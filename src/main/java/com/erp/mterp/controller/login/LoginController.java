package com.erp.mterp.controller.login;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.erp.mterp.config.GetClientInfo;
import com.erp.mterp.constant.Constant;
import com.erp.mterp.repository.navmenu.NavMenuRepository;
import com.erp.mterp.repository.navmenupermission.NavMenuPermissionRepository;
import com.erp.mterp.repository.navsubmenu.NavSubMenuRepository;
import com.erp.mterp.repository.user.UserRepository;
import com.erp.mterp.repository.userrole.UserRoleRepository;
import com.erp.mterp.vo.navmenu.NavMenuPermissionVo;
import com.erp.mterp.vo.userfront.UserFrontVo;
import com.erp.mterp.vo.userrole.UserRoleVo;
import com.erp.mterp.global.CurrentDateTime;

import lombok.extern.java.Log;

@Log
@Controller
public class LoginController {

	private static final String BASEDOMAIN = null;

	@Autowired
	UserRepository userrepo;

	@Autowired
	private SimpMessagingTemplate messagingTemplate;

	@Autowired
	NavMenuPermissionRepository navMenuPermission;

	@Autowired
	NavMenuRepository navMenu;

	@Autowired
	NavSubMenuRepository navSubMenu;

	@Autowired
	GetClientInfo getClientInfo;

	@Autowired
	private UserRepository userRepository;
	@Autowired
	private UserRoleRepository userRoleRepository;

	@Value("${END_POINT_URL}")
	private String END_POINT_URL;

	@Value("${BUCKET}")
	private String BUCKET;

	@Value("${LOGO_IMAGE_LOCATION}")
	private String IMAGE_LOCATION;

	@Value("${from.to}")
	private String from;

	@Value("${base.url}")
	private String BASEURL;

	/*
	 * @RequestMapping("/") public String dashboard(HttpSession session) { return
	 * "redirect:/dashboard";//} }
	 */
	@RequestMapping("/login")
	public ModelAndView login(HttpServletRequest request) {

		ModelAndView view = new ModelAndView();
//    	String uri = request.getScheme() + "://" +   // "http" + "://
//                request.getServerName() +       // "myhost"
//                ":" + request.getServerPort() + // ":" + "8080"
//                request.getRequestURI() +       // "/people"
//               (request.getQueryString() != null ? "?" +
//                request.getQueryString() : ""); // "?" + "lastname=Fox&age=30"
		view.setViewName("signup-login/login");
		view.addObject("data", "BLANK");

		view.addObject("domain", "");
		return view;

		// }
	}

	@RequestMapping("/signin")
	public String signin(HttpServletRequest request) {
		return "signup-login/login";// }
	}

	@RequestMapping("/403")
	public String accesdenis() { /*
									 * HttpSession Session=req.getSession(); if(Session.getAttribute("UserID")!=null
									 * && Session.getAttribute("UserName")!=null) { return "redirect:/dashbord/"; }
									 * else {
									 */
		return "403";// }
	}

	@RequestMapping("/signup")
	public String signup() {

		return "signup-login/signup";
	}

	@RequestMapping("/signup/save")
	public String signupSave(@ModelAttribute UserFrontVo userfront, HttpSession session) {
		String pass = userfront.getPassword();
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		String hashedPassword = passwordEncoder.encode(pass);
		userfront.setPassword(hashedPassword);
		// userfront.setCountriesCode("IN");

//        userfront.setStateCode("24");
//        userfront.setCityCode("938");
//        userfront.setAddress("India Gujrat Ahemedabad");
		userfront.setAssignedSms(1000);
		userfront.setCreatedOn(com.erp.mterp.global.CurrentDateTime.getCurrentDate());
		String domain = userfront.getDomainname();
		/*
		 * String domainName = "localhost,app."+BASEDOMAIN+"," +
		 * userfront.getDomainname() + "."+BASEDOMAIN+",";
		 * System.out.println("domainName---->>" + domainName);
		 * userfront.setDomainname(domainName);
		 */
		userfront = userrepo.save(userfront);

		/* userfront.setCompanyId(userfront.getUserFrontId()); */
		userfront.setUserFrontVo(userfront);
		userfront.setStatus("active");
		userfront.setMonthInterval("April - March");

		try {
			userfront.setDefaultYearInterval(CurrentDateTime.getFinancialYearInterval());
		} catch (Exception e) {
			e.printStackTrace();
			userfront.setDefaultYearInterval("2021-2022");
		}

		userfront.setStartDate(new Date());
		userfront.setValidityDays(365);

		UserRoleVo ur = userRoleRepository.findById(Constant.URID_COMPANY).orElse(null);
		List<UserRoleVo> roles = new ArrayList<UserRoleVo>();
		roles.add(ur);
		userfront.setRoles(roles);
		userfront = userrepo.save(userfront);
		
		String accessKey= checkAccessKeyAndSecretKey("accesskey",userfront);
		
		String secretKey= checkAccessKeyAndSecretKey("secretkey",userfront);

		userrepo.updateAccessKeyAndSecretKeyByUserFrontId(userfront.getUserFrontId(), accessKey, secretKey);
		
		
		return "/signup-login/login";
	}

	public String checkAccessKeyAndSecretKey(String type,UserFrontVo userfront)
	{
		
		System.out.println("== key  " + getAlphaNumericString(16));

		DateFormat df = new SimpleDateFormat("yy"); // Just the year, with 2 digits
		String year = df.format(Calendar.getInstance().getTime());

		DateFormat dfm = new SimpleDateFormat("MM"); // Just the Month, with 2 digits
		String month = dfm.format(Calendar.getInstance().getTime());

		DateFormat dfd = new SimpleDateFormat("dd");
		String date = dfd.format(Calendar.getInstance().getTime());

		String accessKey="";
		String secretKey="";
		
		if(type.equals("accesskey")) {

			do
			{
				accessKey = userfront.getUserFrontId() + month + year + "-";
				accessKey += getAlphaNumericString(4) + "-" + getAlphaNumericString(4) + "-" + getAlphaNumericString(4) + "-"
						+ getAlphaNumericString(12);
				System.out.println("accessKey-->"+accessKey);
				
			}
			while(userrepo.findByAccessKey(accessKey)!=0);
			return accessKey;	
		}else {		
		
			do 
			{
				 secretKey= userfront.getUserFrontId() + month + year + date + "-";
					secretKey += getAlphaNumericString(4) + "-" + getAlphaNumericString(4) + "-" + getAlphaNumericString(4) + "-"
							+ getAlphaNumericString(12);
					System.out.println("secretKey-->"+secretKey);
			}
				while(userrepo.findBySecretKey(secretKey)!=0);
			
			return secretKey;	
		}
		
		
		
	}

	
	public String getAlphaNumericString(int n) {

		// chose a Character random from this String
		String AlphaNumericString = "ABCDEFGHIJKLMNOPQRSTUVWXYZ" + "0123456789" + "abcdefghijklmnopqrstuvxyz";

		// create StringBuffer size of AlphaNumericString

		StringBuilder sb = new StringBuilder(n);

		for (int i = 0; i < n; i++) {

			// generate a random number between
			// 0 to AlphaNumericString variable length
			int index = (int) (AlphaNumericString.length() * Math.random());

			// add Character one by one in end of sb
			sb.append(AlphaNumericString.charAt(index));
		}

		return sb.toString();
	}

	@PostMapping("/checkusername")
	@ResponseBody
	public String checkusername(@RequestParam Map<String, String> allRequestParam,
			@RequestParam(defaultValue = "0", value = "userfrontId") long userfrontId) {
		List<UserFrontVo> b = new ArrayList<>();
		
		System.out.println("userfrontId-->"+userfrontId);
		// String itemcode =
		// allRequestParam.get(allRequestParam.keySet().stream().filter(s ->
		// s.endsWith("itemCode")).collect(Collectors.toSet()).iterator().next());

		if (userfrontId == 0) {
			b = userRepository.findByUserNameIgnoreCase(allRequestParam.get("userName"));
		} else {

			// b=productService.findByitemCodeIgnoreCaseAndCompanyIdAndProductVarientIdNot(itemcode,Long.parseLong(session.getAttribute("companyId").toString()),productvarintid);
		}

		if (b.size() == 0) {
			return "{ \"valid\": true }";
		} else {
			return "{ \"valid\": false }";
		}
	}

	@RequestMapping("/success")
	public String success(HttpSession session, HttpServletRequest request)
			throws NumberFormatException, com.blueconic.browscap.ParseException, ParseException {

		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.s");
		Date currentDate = new Date();
		System.out.println("------InitiaL Date --------- " + dateFormat.format(currentDate));
		// convert date to calendar
		Calendar c = Calendar.getInstance();
		c.setTime(currentDate);
		// manipulate date
		c.add(Calendar.DATE, -7); // same with c.add(Calendar.DAY_OF_MONTH, 1);
		// convert calendar to date
		Date currentDatePlusOne = c.getTime();
		System.out.println("------Final Date --------- " + dateFormat.format(currentDatePlusOne));

		Authentication auth = SecurityContextHolder.getContext().getAuthentication();

		UserFrontVo userFrontVo = userRepository.findByUserName(auth.getName());
		session.setAttribute("accessKey", userFrontVo.getAccessKey());
		session.setAttribute("secretKey", userFrontVo.getSecretKey());
		UserRoleVo role = userFrontVo.getRoles().iterator().next();
		System.out.println("" + END_POINT_URL + "/" + BUCKET + "/" + IMAGE_LOCATION + "/");
		session.setAttribute("realPath", "" + END_POINT_URL + "/" + BUCKET + "/" + IMAGE_LOCATION + "/");
		session.setAttribute("NavMenuPermission",
				navMenu.getNavMenuGlobalList(userFrontVo.getRoles().get(0).getUserRoleId()));
		session.setAttribute("NavSubMenuPermission",
				navSubMenu.findNavSubMenuByUserRoleId(userFrontVo.getRoles().get(0).getUserRoleId()));

		long corporateUserFrontId = 0;

		if (role.getUserRoleId() == Constant.URID_CORPORATE) {
			corporateUserFrontId = userFrontVo.getUserFrontId();
			session.setAttribute("corporateId", userFrontVo.getUserFrontId());
			session.setAttribute("userType", role.getUserRoleId());
		} else if (role.getUserRoleId() == Constant.URID_BRANCH) {

			corporateUserFrontId = userFrontVo.getUserFrontVo().getUserFrontVo().getUserFrontId();
			session.setAttribute("domainName", userFrontVo.getUserFrontVo().getDomainname());
			session.setAttribute("corporateId", userFrontVo.getUserFrontVo().getUserFrontVo().getUserFrontId());
			session.setAttribute("branchId", userFrontVo.getUserFrontId());
			session.setAttribute("companyId", userFrontVo.getUserFrontVo().getUserFrontId());
			session.setAttribute("userType", role.getUserRoleId());
			session.setAttribute("branchName", userFrontVo.getName());

			/*
			 * session.setAttribute("companySetting", new
			 * CompanySettingDao().getCompanySettings(userFrontVo.getUserFrontVo().
			 * getUserFrontId()));
			 *
			 * if (request.getParameter("branchLogin") != null) {
			 * session.setAttribute("branchList", new LoginDao().getBranchListFromCompany(
			 * userFrontVo.getUserFrontVo().getUserFrontId(), Constant.URID_BRANCH));
			 * session.setAttribute("user", userFrontVo.getUserFrontVo().getName()); }
			 */
		} else if (role.getUserRoleId() == Constant.URID_COMPANY) {

			corporateUserFrontId = userFrontVo.getUserFrontVo().getUserFrontId();
			session.setAttribute("corporateId", userFrontVo.getUserFrontVo().getUserFrontId());
			session.setAttribute("branchId", userFrontVo.getUserFrontId());
			session.setAttribute("companyId", userFrontVo.getUserFrontId());
			session.setAttribute("userType", role.getUserRoleId());
			session.setAttribute("domainName", userFrontVo.getDomainname());
			session.setAttribute("branchName", userFrontVo.getName());

			/*
			 * session.setAttribute("companySetting", new
			 * CompanySettingDao().getCompanySettings(userFrontVo.getUserFrontId()));
			 * session.setAttribute("branchList", new LoginDao()
			 * .getBranchListFromCompany(userFrontVo.getUserFrontId(),
			 * Constant.URID_BRANCH));
			 */
		} else if (role.getUserRoleId() > 3) {

			if (userFrontVo.getUserFrontVo().getRoles().get(0).getUserRoleId() == Constant.URID_BRANCH) {

				corporateUserFrontId = userFrontVo.getUserFrontVo().getUserFrontVo().getUserFrontId();
				session.setAttribute("domainName", userFrontVo.getUserFrontVo().getUserFrontVo().getDomainname());
				session.setAttribute("corporateId", userFrontVo.getUserFrontVo().getUserFrontVo().getUserFrontId());
				session.setAttribute("branchId", userFrontVo.getUserFrontVo().getUserFrontId());
				session.setAttribute("companyId", userFrontVo.getUserFrontVo().getUserFrontVo().getUserFrontId());
				session.setAttribute("userType", role.getUserRoleId());
				session.setAttribute("branchName", userFrontVo.getUserFrontVo().getName());
				/*
				 * session.setAttribute("companySetting", new
				 * CompanySettingDao().getCompanySettings(userFrontVo.getUserFrontVo().
				 * getUserFrontId()));
				 *
				 * if (request.getParameter("branchLogin") != null) {
				 * session.setAttribute("branchList", new LoginDao().getBranchListFromCompany(
				 * userFrontVo.getUserFrontVo().getUserFrontId(), Constant.URID_BRANCH));
				 * session.setAttribute("user", userFrontVo.getUserFrontVo().getName()); }
				 */
			} else if (userFrontVo.getUserFrontVo().getRoles().get(0).getUserRoleId() == Constant.URID_COMPANY) {

				corporateUserFrontId = userFrontVo.getUserFrontVo().getUserFrontId();
				session.setAttribute("corporateId", userFrontVo.getUserFrontVo().getUserFrontId());
				session.setAttribute("branchId", userFrontVo.getUserFrontVo().getUserFrontId());
				session.setAttribute("companyId", userFrontVo.getUserFrontVo().getUserFrontId());
				session.setAttribute("userType", role.getUserRoleId());
				session.setAttribute("domainName", userFrontVo.getUserFrontVo().getDomainname());
				session.setAttribute("branchName", userFrontVo.getUserFrontVo().getName());

				/*
				 * session.setAttribute("companySetting", new
				 * CompanySettingDao().getCompanySettings(userFrontVo.getUserFrontId()));
				 * session.setAttribute("branchList", new LoginDao()
				 * .getBranchListFromCompany(userFrontVo.getUserFrontId(),
				 * Constant.URID_BRANCH));
				 */
			}
		}

		if (role.getUserRoleId() != Constant.URID_CORPORATE) {

			String financialYear, monthInterval;

			session.setAttribute("countryCode", userFrontVo.getCountriesCode());
			session.setAttribute("pinCode", userFrontVo.getPincode());
			session.setAttribute("stateCode", userFrontVo.getStateCode());
			session.setAttribute("cityCode", userFrontVo.getCityCode());

			session.setAttribute("address", userFrontVo.getAddress());
			session.setAttribute("name", userFrontVo.getName());
			System.out.println("--->>>>URVICH>>>>>>>>>>>>>>>>>>>>" + userFrontVo.getGst());
			session.setAttribute("gstno", userFrontVo.getGst());

		}

		// Logging User Activity
		long companyId = (long) session.getAttribute("companyId");
		try {
			UserFrontVo userFrontVo2 = userRepository.findByCompanyId(companyId);
			if (StringUtils.isNotBlank(userFrontVo2.getWhatsappToken())) {
				System.err.println("whatsapp token is not blank:" + userFrontVo2.getWhatsappToken());
				session.setAttribute("whatsappToken", userFrontVo2.getWhatsappToken());
			} else {
				System.err.println("whatsapp token is blank HERE:");

			}
		} catch (Exception e) {
			System.err.println("+++++ error occur +++++:");
			e.printStackTrace();
		}

		System.out.println("companyId----" + companyId);

		// notificationService.notificationss(session);

		List<NavMenuPermissionVo> permis = navMenuPermission
				.getRoleWisePermission(userFrontVo.getRoles().get(0).getUserRoleId());
		if (permis.size() != 0) {
			// response.sendRedirect(permis.get(0).getNavSubMenuVo().getMenuURL());
			return "redirect:/" + permis.get(0).getNavSubMenuVo().getMenuURL();

		} else {
			// response.sendRedirect("/AccessDenid");
			return "redirect:/accessDenid";
		}
	}

}
