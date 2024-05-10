package com.erp.mterp.controller.api;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

import javax.servlet.http.HttpServletRequest;

import com.erp.mterp.dto.contact.ContactManageDTO;
import org.apache.commons.collections.map.HashedMap;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.scheduling.annotation.Async;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.erp.mterp.config.JwtProvider;
import com.erp.mterp.constant.Constant;
import com.erp.mterp.constant.SMSCONSTANT;
import com.erp.mterp.dto.CaptureBillDTO;
import com.erp.mterp.dto.CustomerSignUpDTO;
import com.erp.mterp.dto.LoyaltyCouponDataDTO;
import com.erp.mterp.dto.LoyaltyCouponsDTO;
import com.erp.mterp.dto.LoyaltyExtraFieldsDTO;
import com.erp.mterp.dto.LoyaltySendOtpBillDTO;
import com.erp.mterp.dto.RedeemCouponDTO;
import com.erp.mterp.dto.RevertPointDTO;
import com.erp.mterp.dto.pointledger.PointLedgerDTO;
import com.erp.mterp.dto.pointtransaction.PointTransactionCustomDatatableRequestDTO;
import com.erp.mterp.dto.pointtransaction.PointTransactionMainCustomDatatableDto;
import com.erp.mterp.repository.pointsetup.PointSetupRepository;
import com.erp.mterp.repository.user.UserRepository;
import com.erp.mterp.service.contact.ContactService;
import com.erp.mterp.service.coupon.CouponService;
import com.erp.mterp.service.transaction.TransactionService;
import com.erp.mterp.utill.Msg91;
import com.erp.mterp.vo.commonResponse.ApiResponse;
import com.erp.mterp.vo.commonResponse.ApiResponseForCustomerLedger;
import com.erp.mterp.vo.commonResponse.PointsDetails;
import com.erp.mterp.vo.contact.ContactManageVo;
import com.erp.mterp.vo.contact.ContactTransactionItemVo;
import com.erp.mterp.vo.contact.ContactTransactionVo;
import com.erp.mterp.vo.contact.ContactVo;
import com.erp.mterp.vo.coupon.CouponVo;
import com.erp.mterp.vo.pointSetup.PointSetupVo;
import com.erp.mterp.vo.transaction.PointTransactionVo;

import lombok.extern.java.Log;
@Log
@RestController
@RequestMapping("/api/v1")
public class ApiController {
    @Autowired
    AuthenticationManager authenticationManager;

    @Autowired
    JwtProvider jwtProvider;
    
    @Autowired
    ContactService contactService;
    
    @Autowired
    private UserRepository userRepository;
    
    @Autowired
    PointSetupRepository pointSetupRepository;
    @Autowired
    TransactionService transactionService;
    @Autowired
    CouponService couponService;
    
    
    private String getSecretKey(HttpServletRequest request) {
  		return request.getHeader("SecretKey");
  	}

  	private String getAccessKey(HttpServletRequest request) {
  		return request.getHeader("AccessKey");
  	}
	private boolean CheckAuthorizeUser(HttpServletRequest request) {

		String accessKey = getAccessKey(request);
        String secretKey = getSecretKey(request);
         
        if (accessKey != null && secretKey!=null ) {
        	long userFrontId=userRepository.findByAccessKeyAndSecretKey(accessKey,secretKey);
        	if(userFrontId==0) {
        		return false;	
        	}else {
        		return true;
        	}
        	
        }else {
        	return false;
        }
    }
	private long getUserCompanyId(HttpServletRequest request) {
		
		String accessKey = getAccessKey(request);
        String secretKey = getSecretKey(request);
         
        if (accessKey != null && secretKey!=null ) {
        	long userFrontId=userRepository.findByAccessKeyAndSecretKey(accessKey,secretKey);
        	return userFrontId;
        }else {
        	return 0;
        }
	}

	@Async
	public void TransactionEntry(double point, String type, long companyId, long contactId, long contactTransactionId) {
		log.info("point>>>>>>>>"+point+"::"+contactTransactionId);
		PointSetupVo pointSetupVo=pointSetupRepository.findByCompanyId(companyId);
			PointTransactionVo pointTransactionVo=new PointTransactionVo();
			pointTransactionVo.setCompanyId(companyId);
			pointTransactionVo.setContactId(contactId);
			pointTransactionVo.setContactTransactionId(contactTransactionId);
			if(type.equals(Constant.IN)) {
				double pointmultiply=0;
					if(pointSetupVo!=null) {
						pointmultiply= pointSetupVo.getPointRs();
						try {
							if(pointmultiply>0) {
								//pointTransactionVo.setInPoint(Math.floor(point/pointmultiply));
								double pt = Double.parseDouble(String.format("%.2f", point/pointmultiply));
								log.info("before finallllll>>>>>>>>"+pt);
								if (Double.isNaN(pt) || Double.isInfinite(pt)) {
									pt = 0;
								}
								log.info("finallllll>>>>>>>>"+pt);
								pointTransactionVo.setInPoint(pt);	
							}else {
								log.severe("HERE POINTS SETUP is 0 so can not add point");
							}
								
						} catch (Exception e) {
							log.info("HETY HEREEE YOUR DATAAA EROORRRRRR");
						}
						
					}
			}else {
				pointTransactionVo.setOutPoint(point);
			}
			transactionService.save(pointTransactionVo);
	}
	
	@Async
	public void TransactionEntryForPreLoading(double point, String type, long companyId, long contactId, long contactTransactionId) {
			PointSetupVo pointSetupVo=pointSetupRepository.findByCompanyId(companyId);
			PointTransactionVo pointTransactionVo=new PointTransactionVo();
			pointTransactionVo.setCompanyId(companyId);
			pointTransactionVo.setContactId(contactId);
			pointTransactionVo.setDescription(Constant.PRELOADINGPOINT);
			pointTransactionVo.setContactTransactionId(contactTransactionId);
			if(type.equals(Constant.IN)) {
				pointTransactionVo.setInPoint(point);
			}else {
				pointTransactionVo.setOutPoint(point);
			}
			transactionService.save(pointTransactionVo);
	}
	
	
   

//    @PostMapping("auth/signin")
//    public ResponseEntity<ApiResponse> customrSignin(@RequestParam("userName") String userName, @RequestParam("password") String password) {
//        if (!userName.equals("") && !password.equals("")) {
//
//            //Login Process Start
//            LoginForm loginRequest = new LoginForm();
//            loginRequest.setUsername(userName);
//            loginRequest.setPassword(password);
//
//            Authentication authentication = authenticationManager.authenticate(
//                    new UsernamePasswordAuthenticationToken(loginRequest.getUsername(), loginRequest.getPassword()));
//
//            SecurityContextHolder.getContext().setAuthentication(authentication);
//
//            String jwt = jwtProvider.generateJwtToken(authentication);
//
//            return ResponseEntity.ok(new ApiResponse(true, "Done", new JwtResponse(jwt)));
//        } else {
//            return ResponseEntity.ok(new ApiResponse(false, "Fail", null));
//        }
//    }
	@GetMapping("/checkApi")
    public ResponseEntity<ApiResponse> getDetails(HttpServletRequest request) {
        
        	if(CheckAuthorizeUser(request)) {
        		long companyId =getUserCompanyId(request);
	        	return ResponseEntity.ok(new ApiResponse(true, Constant.STATUS100, "Working", null));
	        }else {
        		return ResponseEntity.ok(new ApiResponse(false, Constant.STATUS401,"UnAuthorized", null));
        	}
    }
	
    @GetMapping("/getpoints/{mobileNumber}")
    public ResponseEntity<ApiResponse> getDetails(@PathVariable("mobileNumber") String mobileNumber,
    		@RequestParam(value = "email",required = false) String email,
    		@RequestParam(value = "name",required = false) String name,
    		HttpServletRequest request) {
        if(mobileNumber!=null && !mobileNumber.equals("")&& !mobileNumber.equals("null")) {
        	
        	//long companyId = ((RequestUserDetails) authentication.getPrincipal()).getCompanyId();
        	if(CheckAuthorizeUser(request)) {
        		long companyId =getUserCompanyId(request);
	        	log.info("companyIDDDDD"+companyId);
	        	boolean isavailable=contactService.existsByMobNo(mobileNumber);
	        	if(isavailable) {
	        		double point=contactService.findPointsByContactWithMobileNumberAndCompanyId(mobileNumber,companyId);
	        		if(point==0) {
		        		long contact_id=contactService.findByMobileNo(mobileNumber);
		        		if(contact_id==0) {
		        			ContactManageVo contactManageVo=new ContactManageVo();
		        			ContactVo contactVo=new ContactVo();
		        			contactVo.setContactId(contact_id);
			        		contactManageVo.setContactVo(contactVo);
			        		contactManageVo.setCompanyId(companyId);
			        		contactService.savemanageVo(contactManageVo);
		        		}
		        		
		        		return ResponseEntity.ok(new ApiResponse(true, Constant.STATUS200," ", new PointsDetails(0)));
	        		}else {
	        			return ResponseEntity.ok(new ApiResponse(true, Constant.STATUS200," ", new PointsDetails(point)));
	        		}
	        	}else {
	        		ContactVo contactVo=new ContactVo();
	        		contactVo.setAlterBy(companyId);
	        		contactVo.setCreatedBy(companyId);
	        		contactVo.setMobNo(mobileNumber);
	        		contactVo.setName(name);	  
	        		contactVo.setEmail(email);
	        		contactService.saveContact(contactVo);
	        		
	        		ContactManageVo contactManageVo=new ContactManageVo();
	        		contactManageVo.setContactVo(contactVo);
	        		contactManageVo.setCompanyId(companyId);
	        		contactService.savemanageVo(contactManageVo);
	        		
	        		return ResponseEntity.ok(new ApiResponse(true, Constant.STATUS200,"", new PointsDetails(0)));
	        	}
        	}else {
        		return ResponseEntity.ok(new ApiResponse(false, Constant.STATUS401," UnAuthorized", null));
        	}
        }else{
        	return ResponseEntity.ok(new ApiResponse(false, Constant.STATUS500," Mobile Number Not Blank", null));
        }
	}

    @PostMapping("/updateNo")
    @ResponseBody
    public ResponseEntity<ApiResponse> updateMobileNo(@RequestParam String oldMobNo, @RequestParam String newMobNo, HttpServletRequest request) {
        if (CheckAuthorizeUser(request)) {
            ContactVo contactVo = contactService.findByMobNo(oldMobNo);
			if (contactVo == null){
				return ResponseEntity.ok(new ApiResponse(false, Constant.STATUS404, "No mobile number found", null));
			}
            contactVo.setMobNo(newMobNo);
            contactService.saveContact(contactVo);
            return ResponseEntity.ok(new ApiResponse(true, Constant.STATUS200, "success", contactVo));
        } else {
            return ResponseEntity.ok(new ApiResponse(false, Constant.STATUS401, "UnAuthorized", null));
        }
    }
    
    @PostMapping(value = "/capturebil")
    public ResponseEntity<ApiResponse> capturebil(@RequestBody()CaptureBillDTO captureBillDTO,HttpServletRequest request) {
    	if(CheckAuthorizeUser(request)) {
    		
    		long companyId =getUserCompanyId(request);
    		DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
    		try {
    			if(captureBillDTO.getCustomer().getMobile()!=null && captureBillDTO.getCustomer().getMobile()!=""&& captureBillDTO.getCustomer().getMobile()!="null") {
    			ContactManageVo contactManageVo=contactService.findByMobNoAndCompanyId(captureBillDTO.getCustomer().getMobile(),companyId);
    			
    			
	    		
    			ContactVo contactVo=contactManageVo.getContactVo();
    		
    			contactVo.setName(captureBillDTO.getCustomer().getName());
    			contactVo.setEmail(captureBillDTO.getCustomer().getEmail());
	    		

	    		contactService.saveContact(contactVo);
	    		
	    		ContactTransactionVo transactionVo=new ContactTransactionVo();
	    		transactionVo.setBillNo(captureBillDTO.getTransaction().getBillNo());
	    		transactionVo.setContactManageVo(contactManageVo);
	    		transactionVo.setCompanyId(companyId);
	    		transactionVo.setTransactionId(captureBillDTO.getTransaction().getId());
	    		transactionVo.setGrossAmount(Math.round(Double.parseDouble(captureBillDTO.getTransaction().getGrossAmount())));
	    		transactionVo.setNetAmount(Math.round(Double.parseDouble(captureBillDTO.getTransaction().getNetAmount())));
	    		List<ContactTransactionVo> contactTransactionVos=new ArrayList<>();
	    		contactTransactionVos.add(transactionVo);
	    		contactManageVo.setContactTransactionVo(contactTransactionVos);
	    		List<ContactTransactionItemVo> contactTransactionItemVos=new ArrayList<ContactTransactionItemVo>();
	    		if(captureBillDTO.getTransaction().getItems()!=null) {
		    		for (int i = 0; i < captureBillDTO.getTransaction().getItems().size(); i++) {
		    			ContactTransactionItemVo transactionItemVo=new ContactTransactionItemVo();
		    			transactionItemVo.setContactTransactionVo(transactionVo);
		    			transactionItemVo.setName(captureBillDTO.getTransaction().getItems().get(i).getName());
		    			transactionItemVo.setQuantity(captureBillDTO.getTransaction().getItems().get(i).getQuantity());
		    			transactionItemVo.setRate(captureBillDTO.getTransaction().getItems().get(i).getRate());
		    			contactTransactionItemVos.add(transactionItemVo);
		    		}
	    		}
	    		transactionVo.setContactTransactionItemVo(contactTransactionItemVos);
	    		contactService.savemanageVo(contactManageVo);
	    		
	    		String netAmount = String.format("%.2f", Double.parseDouble(captureBillDTO.getTransaction().getNetAmount()));
	    		log.info("netAmount in capture billlllll>>>>>"+netAmount);
	    		TransactionEntry(Double.parseDouble(netAmount), Constant.IN, companyId,contactVo.getContactId(),contactManageVo.getContactTransactionVo().get(0).getContactTransactionId());
//				TransactionEntry(Math.round(Double.parseDouble(captureBillDTO.getTransaction().getNetAmount())),
//						Constant.IN, companyId, contactVo.getContactId(),
//						contactManageVo.getContactTransactionVo().get(0).getContactTransactionId());
	    		
	    		if(captureBillDTO.getRedemption()!=null) {
    				CouponVo couponsDTO=couponService.findByCouponIdAndCompanyId(Long.parseLong(captureBillDTO.getRedemption().getReward_id()), companyId);
	    			if(contactManageVo.getPoints()>=couponsDTO.getPoints()) {
		    			PointTransactionVo pointTransactionVo=new PointTransactionVo();
		    			pointTransactionVo.setCompanyId(companyId);
		    			pointTransactionVo.setContactId(contactManageVo.getContactVo().getContactId());
		    			pointTransactionVo.setInPoint(0);
		    			pointTransactionVo.setCouponId(couponsDTO.getCouponId());
		    			pointTransactionVo.setDescription("redeem Coupon");
		    			pointTransactionVo.setOutPoint(couponsDTO.getPoints());
		    			pointTransactionVo.setContactTransactionId(contactManageVo.getContactTransactionVo().get(0).getContactTransactionId());
		    			log.warning("couponsDTO.getPoints()>>>>"+couponsDTO.getPoints()+"id is "+contactManageVo.getContactTransactionVo().get(0).getContactTransactionId());
		    			transactionService.save(pointTransactionVo);
	    			}
    			}
	    		return ResponseEntity.ok(new ApiResponse(true, Constant.STATUS201,"Bill successfully Added.", null));
	    		
    			}else {
    				return ResponseEntity.ok(new ApiResponse(false, Constant.STATUS400," Mobile No not valid", null));	
    			}
    		} catch (Exception e) {
    			e.printStackTrace();
    			log.severe(e.getMessage());
    			return ResponseEntity.ok(new ApiResponse(false, Constant.STATUS500," Something Went Wrong Pls Check Data.", null));
			}
    	}else {
    		return ResponseEntity.ok(new ApiResponse(false, Constant.STATUS401," UnAuthorized", null));
    	}
    }
    
    
    @PostMapping(value = "/addpreloadingpoint")
    public ResponseEntity<ApiResponse> addPreLoadingPoint(@RequestBody() CaptureBillDTO captureBillDTO,
    		@RequestParam(value = "preLoadingPoint", required = false, defaultValue = "0") double preLoadingPoint
    		,HttpServletRequest request) {
    	if(preLoadingPoint!=0) {
    		if(CheckAuthorizeUser(request)) {
        		
        		long companyId =getUserCompanyId(request);
        		DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
        		try {
        			if(captureBillDTO.getCustomer().getMobile()!=null && captureBillDTO.getCustomer().getMobile()!=""&& captureBillDTO.getCustomer().getMobile()!="null") {
        			ContactManageVo contactManageVo=contactService.findByMobNoAndCompanyId(captureBillDTO.getCustomer().getMobile(),companyId);
        			ContactVo contactVo=contactManageVo.getContactVo();
        		
        			contactVo.setName(captureBillDTO.getCustomer().getName());
        			contactVo.setEmail(captureBillDTO.getCustomer().getEmail());
    	    		

    	    		contactService.saveContact(contactVo);
    	    		
    	    		ContactTransactionVo transactionVo=new ContactTransactionVo();
    	    		
    	    		transactionVo.setBillNo(captureBillDTO.getTransaction().getBillNo());
    	    		transactionVo.setContactManageVo(contactManageVo);
    	    		transactionVo.setCompanyId(companyId);
    	    		transactionVo.setTransactionId(captureBillDTO.getTransaction().getId());
    	    		transactionVo.setGrossAmount(Math.round(Double.parseDouble(captureBillDTO.getTransaction().getGrossAmount())));
    	    		transactionVo.setNetAmount(Math.round(Double.parseDouble(captureBillDTO.getTransaction().getNetAmount())));
    	    		transactionVo.setDescription(Constant.PRELOADINGPOINT);
    	    		List<ContactTransactionVo> contactTransactionVos=new ArrayList<>();
    	    		contactTransactionVos.add(transactionVo);
    	    		contactManageVo.setContactTransactionVo(contactTransactionVos);
    	    		List<ContactTransactionItemVo> contactTransactionItemVos=new ArrayList<ContactTransactionItemVo>();
    	    		if(captureBillDTO.getTransaction().getItems()!=null) {
    		    		for (int i = 0; i < captureBillDTO.getTransaction().getItems().size(); i++) {
    		    			ContactTransactionItemVo transactionItemVo=new ContactTransactionItemVo();
    		    			transactionItemVo.setContactTransactionVo(transactionVo);
    		    			transactionItemVo.setName(captureBillDTO.getTransaction().getItems().get(i).getName());
    		    			transactionItemVo.setQuantity(captureBillDTO.getTransaction().getItems().get(i).getQuantity());
    		    			transactionItemVo.setRate(captureBillDTO.getTransaction().getItems().get(i).getRate());
    		    			contactTransactionItemVos.add(transactionItemVo);
    		    		}
    	    		}
    	    		transactionVo.setContactTransactionItemVo(contactTransactionItemVos);
    	    		contactService.savemanageVo(contactManageVo);
    	    		
    	    		TransactionEntryForPreLoading(preLoadingPoint, Constant.IN, companyId,contactVo.getContactId(),contactManageVo.getContactTransactionVo().get(0).getContactTransactionId());
    	    		
    	    		return ResponseEntity.ok(new ApiResponse(true, Constant.STATUS201,"Preloading Point successfully Added.", null));
    	    		
        			}else {
        				return ResponseEntity.ok(new ApiResponse(false, Constant.STATUS400," Mobile No not valid", null));	
        			}
        		} catch (Exception e) {
        			e.printStackTrace();
        			log.severe(e.getMessage());
        			return ResponseEntity.ok(new ApiResponse(false, Constant.STATUS500," Something Went Wrong Pls Check Data.", null));
    			}
        	}else {
        		return ResponseEntity.ok(new ApiResponse(false, Constant.STATUS401," UnAuthorized", null));
        	}
    	}else {
    		return ResponseEntity.ok(new ApiResponse(false, Constant.STATUS400,"Please enter preLoadingPoint more than 0", null));
    	}
    	
    }

    @PatchMapping(value = "/updatebil")
    public ResponseEntity<ApiResponse> updatebil(@RequestBody()CaptureBillDTO captureBillDTO,HttpServletRequest request) {
    	if(CheckAuthorizeUser(request)) {
    		
    		long companyId =getUserCompanyId(request);
    		DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
    		//try {
    		if(captureBillDTO.getCustomer().getMobile()!=null && captureBillDTO.getCustomer().getMobile()!=""&& captureBillDTO.getCustomer().getMobile()!="null") {
    			ContactManageDTO contactManageDTO=contactService.findByMobNoAndCompanyIdDTO(captureBillDTO.getCustomer().getMobile(),companyId);
    			Long contactId=contactManageDTO.getContactId();

    		//	contactVo.setName(captureBillDTO.getCustomer().getName());
    	//		contactVo.setEmail(captureBillDTO.getCustomer().getEmail());
				contactService.updateNameAndEmail(captureBillDTO.getCustomer().getName(),captureBillDTO.getCustomer().getEmail(),contactId);
				try {
	    				if(StringUtils.isNotBlank(captureBillDTO.getCustomer().getDob())){
							contactService.updateDob(contactId,dateFormat.parse(captureBillDTO.getCustomer().getDob()));
						}
						if (StringUtils.isNotBlank(captureBillDTO.getCustomer().getAnniversaryDate())){
							contactService.updateAnniversary(contactId,dateFormat.parse(captureBillDTO.getCustomer().getAnniversaryDate()));
						}
				} catch (Exception e) {
							e.printStackTrace();
				}
	    		

	    		//contactService.saveContact(contactVo);
	    		contactService.deleteTransaction(contactId,companyId,captureBillDTO.getTransaction().getId());
	    		ContactTransactionVo transactionVo=new ContactTransactionVo();
	    		transactionVo.setBillNo(captureBillDTO.getTransaction().getBillNo());
				ContactManageVo contactManageId=new ContactManageVo();
				contactManageId.setContactManageId(contactManageDTO.getContactManageId());
	    		transactionVo.setContactManageVo(contactManageId);
	    		transactionVo.setCompanyId(companyId);
	    		transactionVo.setTransactionId(captureBillDTO.getTransaction().getId());
	    		transactionVo.setGrossAmount(Math.round(Double.parseDouble(captureBillDTO.getTransaction().getGrossAmount())));
	    		transactionVo.setNetAmount(Math.round(Double.parseDouble(captureBillDTO.getTransaction().getNetAmount())));

	    		List<ContactTransactionItemVo> contactTransactionItemVos=new ArrayList<ContactTransactionItemVo>();
	    		if(captureBillDTO.getTransaction().getItems()!=null) {
		    		for (int i = 0; i < captureBillDTO.getTransaction().getItems().size(); i++) {
		    			ContactTransactionItemVo transactionItemVo=new ContactTransactionItemVo();
		    			transactionItemVo.setContactTransactionVo(transactionVo);
		    			transactionItemVo.setName(captureBillDTO.getTransaction().getItems().get(i).getName());
		    			transactionItemVo.setQuantity(captureBillDTO.getTransaction().getItems().get(i).getQuantity());
		    			transactionItemVo.setRate(captureBillDTO.getTransaction().getItems().get(i).getRate());
		    			contactTransactionItemVos.add(transactionItemVo);
		    		}
	    		}
	    		transactionVo.setContactTransactionItemVo(contactTransactionItemVos);
				contactService.savetransaction(transactionVo);

	    		String netAmount = String.format("%.2f", Double.parseDouble(captureBillDTO.getTransaction().getNetAmount()));
	    		log.info("netAmount in capture billlllll>>>>>"+netAmount);
	    		TransactionEntry(Double.parseDouble(netAmount), Constant.IN, companyId,contactId,transactionVo.getContactTransactionId());
	    		//TransactionEntry(Math.round(Double.parseDouble(captureBillDTO.getTransaction().getNetAmount())), Constant.IN, companyId,contactVo.getContactId(),contactManageVo.getContactTransactionVo().get(0).getContactTransactionId());
	    		return ResponseEntity.ok(new ApiResponse(true, Constant.STATUS200,"Bill successfully Updated.", null));
    		}else {
    			return ResponseEntity.ok(new ApiResponse(false, Constant.STATUS400," Mobile No not valid", null));	
    		}
	    		
    		//} catch (Exception e) {
    	//		log.severe(e.getMessage());
    	//		return ResponseEntity.ok(new ApiResponse(false, Constant.STATUS500," Something Went Wrong Pls Check Data.", null));
		//	}
    	}else {
    		return ResponseEntity.ok(new ApiResponse(false, Constant.STATUS401," UnAuthorized", null));
    	}
    }

    @DeleteMapping(value = "/revertbill")
    public ResponseEntity<ApiResponse> revertpoint(@RequestBody()RevertPointDTO revertPointDTO,HttpServletRequest request) {
    	if(CheckAuthorizeUser(request)) {
    		long companyId =getUserCompanyId(request);
    		try {
    			if(revertPointDTO.getMobile()!=null && revertPointDTO.getMobile()!=""&& revertPointDTO.getMobile()!="null") {
    			ContactManageDTO contactManageVo=contactService.findByMobNoAndCompanyIdDTO(revertPointDTO.getMobile(),companyId);
	    		contactService.deleteTransaction(contactManageVo.getContactId(),companyId,revertPointDTO.getTransactionId());
	    		
	    		return ResponseEntity.ok(new ApiResponse(true, Constant.STATUS200,"Bill successfully reverted.", null));
    			}else {
    				return ResponseEntity.ok(new ApiResponse(false, Constant.STATUS400," Mobile No not valid", null));	
    			}
	    	
    		} catch (Exception e) {
    			log.severe(e.getMessage());
    			return ResponseEntity.ok(new ApiResponse(false, Constant.STATUS500," Something Went Wrong Pls Check Data.", null));
			}
    	}else {
    		return ResponseEntity.ok(new ApiResponse(false, Constant.STATUS401," UnAuthorized", null));
    	}
    }
    
    @GetMapping(value = "/getcoupon/{mobileNumber}")
    public ResponseEntity<ApiResponse> getcoupon(@PathVariable("mobileNumber") String mobileNumber,HttpServletRequest request) {
    	if(CheckAuthorizeUser(request)) {
    		long companyId =getUserCompanyId(request);
    		if(mobileNumber!=null && mobileNumber!=""&& mobileNumber!="null") {
    		try {
    			ContactManageVo contactManageVo=contactService.findByMobNoAndCompanyId(mobileNumber,companyId);
    			List<CouponVo> couponVos=couponService.findByCoponPointAndCompanyId(contactManageVo.getPoints(),companyId);
	    		List<LoyaltyCouponsDTO> couponsDTOs=new ArrayList<>();
	    		
	    		
    			for (int i = 0; i < couponVos.size(); i++) {
    				List<LoyaltyExtraFieldsDTO> extraFieldsDTOs=new ArrayList<>();
    				extraFieldsDTOs.add(new LoyaltyExtraFieldsDTO(Constant.POINTSVALUE,""+couponVos.get(i).getPoints()));
    				if(couponVos.get(i).getCouponType().equals(Constant.Discount)) {
    					String couponname;
    					if(couponVos.get(i).getDiscountType().equals("amount")) {
    						couponname="Get "+couponVos.get(i).getDescription()+" Worth Rs "+couponVos.get(i).getDiscount()+" Free.";
    					}else {
    						couponname="Get "+couponVos.get(i).getDescription()+" Worth %"+couponVos.get(i).getDiscount()+" Free.";
    					}
    					couponsDTOs.add(new LoyaltyCouponsDTO(couponname,""+couponVos.get(i).getCouponId(),couponVos.get(i).getCouponType(),Constant.ProductWise,couponVos.get(i).getDiscountType(),""+couponVos.get(i).getDiscount(),couponVos.get(i).getOtpverify(),extraFieldsDTOs));
    				}else if(couponVos.get(i).getCouponType().equals(Constant.FreeProduct)) {
    					String couponname;
    					couponname="Get "+couponVos.get(i).getDescription()+" Free Product.";
    					couponsDTOs.add(new LoyaltyCouponsDTO(couponname,""+couponVos.get(i).getCouponId(),couponVos.get(i).getCouponType(),Constant.ProductWise,null,null,couponVos.get(i).getOtpverify(),extraFieldsDTOs));
    				}
    				
				}
	    		return ResponseEntity.ok(new ApiResponse(true, Constant.STATUS200,"successfully fetched Coupon.", new LoyaltyCouponDataDTO(null, contactManageVo.getPoints(), false, couponsDTOs)));
	    	
    		} catch (Exception e) {
    			log.severe(e.getMessage());
    			return ResponseEntity.ok(new ApiResponse(false, Constant.STATUS500," Something Went Wrong Pls Check Data.", null));
			}
    		}else {
    			return ResponseEntity.ok(new ApiResponse(false, Constant.STATUS400," Mobile No not valid", null));	
    		}
    		
    	}else {
    		return ResponseEntity.ok(new ApiResponse(false, Constant.STATUS401," UnAuthorized", null));
    	}
    }
    @PostMapping(value = "/redeemcoupon")
    public ResponseEntity<ApiResponse> redeemcoupon(@RequestBody()RedeemCouponDTO redeemCouponDTO,HttpServletRequest request) {
    	if(CheckAuthorizeUser(request)) {
    		long companyId =getUserCompanyId(request);
    		if(redeemCouponDTO.getMobile()!=null && redeemCouponDTO.getMobile()!=""&& redeemCouponDTO.getMobile()!="null") {
    		try {
    			ContactManageVo contactManageVo=contactService.findByMobNoAndCompanyId(redeemCouponDTO.getMobile(),companyId);
    			CouponVo couponsDTO=couponService.findByCouponIdAndCompanyId(Long.parseLong(redeemCouponDTO.getCouponCode()), companyId);
    			if(contactManageVo.getPoints()>=couponsDTO.getPoints()) {
//	    			PointTransactionVo pointTransactionVo=new PointTransactionVo();
//	    			pointTransactionVo.setCompanyId(companyId);
//	    			pointTransactionVo.setContactId(contactManageVo.getContactVo().getContactId());
//	    			pointTransactionVo.setInPoint(0);
//	    			pointTransactionVo.setCouponId(couponsDTO.getCouponId());
//	    			pointTransactionVo.setDescription("redeem Coupon");
//	    			pointTransactionVo.setOutPoint(couponsDTO.getPoints());
//	    			transactionService.save(pointTransactionVo);
	    			return ResponseEntity.ok(new ApiResponse(true, Constant.STATUS200,"successfully Coupon Redeem.", null));
    			}else {
    	    		return ResponseEntity.ok(new ApiResponse(false, Constant.STATUS412,"You don't have enough points.", null));

    			}
    		} catch (Exception e) {
    			log.severe(e.getMessage());
    			return ResponseEntity.ok(new ApiResponse(false, Constant.STATUS500," Something Went Wrong Pls Check Data.", null));
			}
    		}else {
    			return ResponseEntity.ok(new ApiResponse(false, Constant.STATUS400," Mobile No not valid", null));	
    		}
    	}else {
    		return ResponseEntity.ok(new ApiResponse(false, Constant.STATUS401," UnAuthorized", null));
    	}
    }
    
    @PostMapping(value = "/otpverifications/sendotp")
    public ResponseEntity<ApiResponse> sendotp(@RequestBody()LoyaltySendOtpBillDTO loyaltySendOtpBillDTO,HttpServletRequest request) {
    	if(CheckAuthorizeUser(request)) {
    		long companyId =getUserCompanyId(request);
    		if(loyaltySendOtpBillDTO.getCustomer_mobile()!=null && loyaltySendOtpBillDTO.getCustomer_mobile()!=""&& loyaltySendOtpBillDTO.getCustomer_mobile()!="null") {
    		try {
    			ContactManageVo contactManageVo=contactService.findByMobNoAndCompanyId(loyaltySendOtpBillDTO.getCustomer_mobile(),companyId);
    			if(contactManageVo!=null) {
    			 Random random = new Random();
                 String otp = String.format("%06d", random.nextInt(1000000));
                 log.info("here calll ");
                 String sms = "Your OTP is "+otp+"\n"
                 		+ "system developed by vasyerp.com";
                     try {
                     	String senderId = "VSYERP";
                     	Msg91.sendOtp(loyaltySendOtpBillDTO.getCustomer_mobile(), sms,SMSCONSTANT.OTP,senderId);
                     	return ResponseEntity.ok(new ApiResponse(true, Constant.STATUS200,otp, null));
                         // .sendMessage(userFrontVo.getContactNo(), sms, session);
                     } catch (Exception e) {
                         log.info("OTP MSG NOT SENDEDDD");
                         return ResponseEntity.ok(new ApiResponse(false, Constant.STATUS500," Something Went Wrong Pls Check Data.", null));
                     }
    			}else {
    				return ResponseEntity.ok(new ApiResponse(false, Constant.STATUS400," Mobile No not valid", null));	
    			}
    		} catch (Exception e) {
    			log.severe(e.getMessage());
    			return ResponseEntity.ok(new ApiResponse(false, Constant.STATUS500," Something Went Wrong Pls Check Data.", null));
			}
    		}else {
    			return ResponseEntity.ok(new ApiResponse(false, Constant.STATUS400," Mobile No not valid", null));	
    		}
    	}else {
    		return ResponseEntity.ok(new ApiResponse(false, Constant.STATUS401," UnAuthorized", null));
    	}
    }

	@PostMapping("/loyalty/customer/exist")
	public ResponseEntity<ApiResponse> checkCustomerExistorNot(@RequestBody CustomerSignUpDTO customerSignUpDTO,
			HttpServletRequest request) {

		if (customerSignUpDTO != null) {
			if (StringUtils.isNotBlank(customerSignUpDTO.getCustomerMobile())
					&& !StringUtils.equalsIgnoreCase("null", customerSignUpDTO.getCustomerMobile())) {

				if (CheckAuthorizeUser(request)) {
					long companyId = getUserCompanyId(request);
					log.warning("companyId-------->" + companyId);
					boolean isavailable = contactService.existsByMobNo(customerSignUpDTO.getCustomerMobile());
					if (isavailable) {
						ContactManageVo manageVo = contactService.findByContactWithMobileNumberAndCompanyId(
								customerSignUpDTO.getCustomerMobile(), companyId);
						//JSONObject contactJson = new JSONObject();
						Map<String, Object> contactJson = new HashedMap();
						if (manageVo == null) {
							ContactVo contactVo = contactService.findByMobNo(customerSignUpDTO.getCustomerMobile());
							if (contactVo != null) {
								ContactManageVo contactManageVo = new ContactManageVo();
								contactManageVo.setContactVo(contactVo);
								contactManageVo.setCompanyId(companyId);
								contactService.savemanageVo(contactManageVo);
								contactJson.put("contactManageId", contactManageVo.getContactManageId());
								contactJson.put("contactId", contactManageVo.getContactVo().getContactId());
								contactJson.put("mobileNumber", contactManageVo.getContactVo().getMobNo());
								contactJson.put("contactName", contactManageVo.getContactVo().getName());
								return ResponseEntity
										.ok(new ApiResponse(true, Constant.STATUS200, "CUSTOMER_EXIST", contactJson));
							} else {
								return ResponseEntity
										.ok(new ApiResponse(false, Constant.STATUS500, "CUSTOMER_NOT_EXIST", null));
							}

						} else {
							contactJson.put("contactManageId", manageVo.getContactManageId());
							contactJson.put("contactId", manageVo.getContactVo().getContactId());
							contactJson.put("mobileNumber", manageVo.getContactVo().getMobNo());
							contactJson.put("contactName", manageVo.getContactVo().getName());
							return ResponseEntity.ok(new ApiResponse(true, Constant.STATUS200, "CUSTOMER_EXIST", contactJson));
						}
					} else {
						ContactVo contactVo = new ContactVo();
						contactVo.setAlterBy(companyId);
						contactVo.setCreatedBy(companyId);
						contactVo.setName(customerSignUpDTO.getCustomerName());
						contactVo.setMobNo(customerSignUpDTO.getCustomerMobile());

						ContactVo contactVo2 = contactService.saveContact(contactVo);

						ContactManageVo contactManageVo = new ContactManageVo();
						contactManageVo.setContactVo(contactVo2);
						contactManageVo.setCompanyId(companyId);
						contactService.savemanageVo(contactManageVo);

						return ResponseEntity
								.ok(new ApiResponse(true, Constant.STATUS200, "NEW_CUSTOMER_CREATED", null));
					}
				} else {
					return ResponseEntity.ok(new ApiResponse(false, Constant.STATUS401, "UNAUTHORIZED_USER", null));
				}

			} else {
				return ResponseEntity.ok(new ApiResponse(false, Constant.STATUS400, "MOBILE_NUMBER_REQUIRED", null));
			}
		} else {
			return ResponseEntity.ok(new ApiResponse(false, Constant.STATUS400, "JSON_BODY_REQUIRED", null));
		}
	}
	@RequestMapping("/pointtransaction/customdatatable")
	@ResponseBody
	public ResponseEntity<ApiResponseForCustomerLedger> returnPointCustomDatatable(
	        @RequestBody PointTransactionCustomDatatableRequestDTO pointTransactionCustomDatatableRequestDTO)
	        throws NumberFormatException, ParseException {

	    long contactIdForLoyalty = 0;

	    try {
	        if (StringUtils.isNotBlank(pointTransactionCustomDatatableRequestDTO.getMobileno())) {
	            contactIdForLoyalty = contactService
	                    .findByMobileNo(pointTransactionCustomDatatableRequestDTO.getMobileno());
	        } else {

	            return ResponseEntity
	                    .ok(new ApiResponseForCustomerLedger(false, Constant.STATUS200, "Not FOUND", null));
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	        return ResponseEntity.ok(new ApiResponseForCustomerLedger(false, Constant.STATUS200, "Not FOUND", null));
	    }

	    if (contactIdForLoyalty != 0) {

	        PointTransactionMainCustomDatatableDto PointTransactionMainCustomDatatableDto = null;
	        Integer totallength = 0;
	        String serachValue = "";
	        List<PointLedgerDTO> list = new ArrayList<PointLedgerDTO>();

	        // search value
	        if (StringUtils.isNotBlank(pointTransactionCustomDatatableRequestDTO.getSerachValue())) {
	            serachValue = pointTransactionCustomDatatableRequestDTO.getSerachValue().trim();
	        } else {
	            serachValue = "";
	        }
	        log.info("searchValue: " + serachValue);

	        totallength = contactService.countOfPointtransactionVoDatatable(serachValue, contactIdForLoyalty);

	        log.warning("count IS :" + totallength);
	        int start = pointTransactionCustomDatatableRequestDTO.getStart();
	        String pageLength = String.valueOf(pointTransactionCustomDatatableRequestDTO.getLength());
	        int length = 0, page = 0, offset = 0, draw = 1;

	        if (StringUtils.isNotBlank(pointTransactionCustomDatatableRequestDTO.getDraw())) {
	            draw = Integer.parseInt(pointTransactionCustomDatatableRequestDTO.getDraw());
	        } else {
	            draw = 1;
	        }

	        if (!pageLength.equals("-1")) {
	            length = pointTransactionCustomDatatableRequestDTO.getLength();
	            page = start / length; // Calculate page number
	            offset = page * length;
	            log.info("length::::>>>>>" + length);
	        } else {
	            length = totallength;
	            offset = 0;
	        }

	        list = contactService.getAllTransactions(serachValue, contactIdForLoyalty, length, offset);
	        log.severe("LIST SIZE IS :" + list.size());
	        double totalRecords = totallength;
	        PointTransactionMainCustomDatatableDto dto = new PointTransactionMainCustomDatatableDto();
	        dto.setData(list);
	        dto.setPage(page);
	        dto.setOffset(offset);
	        dto.setTotalRecords(totallength);
	        return ResponseEntity.ok(new ApiResponseForCustomerLedger(true, Constant.STATUS200, "FOUND", dto));
	    } else {
	        return ResponseEntity.ok(new ApiResponseForCustomerLedger(false, Constant.STATUS200, "Not FOUND", null));
	    }
	}
}
