package com.erp.mterp.controller.coupon;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.datatables.mapping.DataTablesInput;
import org.springframework.data.jpa.datatables.mapping.DataTablesOutput;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.erp.mterp.config.MenuPermission;
import com.erp.mterp.constant.Constant;
import com.erp.mterp.dto.coupon.CouponCustomDatatableDTO;
import com.erp.mterp.dto.coupon.CouponCustomDatatableMainDTO;
import com.erp.mterp.dto.datatable.DataTableMetaDTO;
import com.erp.mterp.repository.coupon.CouponRepository;
import com.erp.mterp.service.coupon.CouponService;
import com.erp.mterp.vo.coupon.CouponVo;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping("/coupon")
public class CouponController {
	@Autowired
	CouponRepository couponRepository;
	
	@Autowired
	CouponService couponService;
	

    
    @RequestMapping(value = { "","/"})
    public ModelAndView coupon(HttpServletRequest request,HttpSession session) {

        ModelAndView view = new ModelAndView("coupon/coupon");
        if (MenuPermission.havePermission(session, Constant.COUPON, Constant.VIEW) == 1) {
            
        } else {
            view.setViewName("accessdenied/accessdenied");
        }
        	
        return view;
    }
    @RequestMapping("/datatable")
    @ResponseBody
    public DataTablesOutput<CouponVo> getUsers(@Valid DataTablesInput input,
            @RequestParam Map<String, String> allRequestParams, HttpSession session) {
        long companyId = Long.parseLong(session.getAttribute("companyId").toString());

        Specification<CouponVo> specification = new Specification<CouponVo>() {
        	
        	private static final long serialVersionUID = 1L;
        	@Override
            public Predicate toPredicate(Root<CouponVo> root, CriteriaQuery<?> query, CriteriaBuilder criteriaBuilder) {
                List<Predicate> predicates = new ArrayList<Predicate>();

                predicates.add(criteriaBuilder.equal(root.get("isDeleted"), 0));
                predicates.add(criteriaBuilder.equal(root.get("companyId"), companyId));
                return criteriaBuilder.and(predicates.toArray(new Predicate[predicates.size()]));
            }
        };

        DataTablesOutput<CouponVo> a = couponRepository.findAll(input, null, specification);
        return a;
    }
    
    @RequestMapping("/customdatatable")
	@ResponseBody
    public CouponCustomDatatableMainDTO returnCustomDatatable(@RequestParam Map<String, String> allRequestParams,
			@Valid DataTablesInput input, HttpSession session) throws NumberFormatException, ParseException {
		long companyId = Long.parseLong(session.getAttribute("companyId").toString());
		String serachValue = "";
		Integer totallength = 0;

		List<CouponCustomDatatableDTO> list = new ArrayList<CouponCustomDatatableDTO>();
		
		// search value
		if (StringUtils.isNotBlank(allRequestParams.get("search.value"))) {
			serachValue = allRequestParams.get("search.value").toString();
		}
		log.info("serachValue::" + serachValue);

		totallength = couponService.countOfCouponVoDatatable(serachValue, companyId, 0);

		log.warning("count IS :" + totallength);
		int start = Integer.parseInt(allRequestParams.get("start"));
		String pageLength = allRequestParams.get("length");
		int length = 0, page = 0, offset = 0, draw = 1;
		try {
			if (allRequestParams.get("draw") != null && !allRequestParams.get("draw").equals("")) {
				draw = 1;
			} else {
				draw = Integer.parseInt(allRequestParams.get("draw").toString());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		if (!pageLength.equals("-1")) {
			length = Integer.parseInt(allRequestParams.get("length"));
			page = start / length; // Calculate page number
			offset = page * length;
			log.info("length::::>>>>>" + length);
		} else {
			length = totallength;
			offset = 0;
		}

		list = couponService.getCouponVoCustomDatatableBy(serachValue, companyId, 0,length, offset);
		log.severe("LIST SIZE IS :" + list.size());
		double totalRecords = totallength;
		CouponCustomDatatableMainDTO dto = new CouponCustomDatatableMainDTO();
		dto.setData(list);
		dto.setDraw(Integer.parseInt(allRequestParams.get("draw")));
		dto.setError(null);
		dto.setRecordsFiltered((int) totalRecords);
		dto.setRecordsTotal((int) totalRecords);
		dto.setDataTableMetaDTO(
				new DataTableMetaDTO(page, (int) Math.ceil((totalRecords) / length), (int) length, (int) totalRecords));
		return dto;
	}
    
    @PostMapping("/savecoupon")
    @ResponseBody
    public void savecoupon(@RequestParam(value = "discountType") String discountType,
    		@RequestParam(value = "description") String description,
    		@RequestParam(value = "couponType") String couponType,
    		@RequestParam(value = "discount",defaultValue = "0") String discount,
    		@RequestParam(value = "points") String points,
                           @RequestParam(value = "otpverify") int otpverify,HttpSession session) {
        
    	CouponVo couponVo=new  CouponVo();
    	couponVo.setAlterBy(Long.parseLong(session.getAttribute("userId").toString()));
    	couponVo.setCompanyId(Long.parseLong(session.getAttribute("companyId").toString()));
    	couponVo.setDescription(description);
    	couponVo.setCouponType(couponType);
    	couponVo.setCreatedBy(Long.parseLong(session.getAttribute("userId").toString()));
    	couponVo.setDiscount(Double.parseDouble(discount));
    	couponVo.setDiscountType(discountType);
    	couponVo.setPoints(Double.parseDouble(points));
    	couponVo.setOtpverify(otpverify);
    	couponService.save(couponVo);
    
    }
    @PostMapping("/updatecoupon")
    @ResponseBody
    public void savecoupon(@RequestParam(value = "couponId") long couponId,
    		@RequestParam(value = "discountType") String discountType,
    		@RequestParam(value = "description") String description,
    		@RequestParam(value = "couponType") String couponType,
    		@RequestParam(value = "discount",defaultValue = "0") String discount,
    		@RequestParam(value = "points") String points,@RequestParam(value = "otpverify") int otpverify,HttpSession session) {
        
    	CouponVo couponVo=couponService.findByCouponIdAndCompanyId(couponId, Long.parseLong(session.getAttribute("companyId").toString()));
    	couponVo.setAlterBy(Long.parseLong(session.getAttribute("userId").toString()));
    	couponVo.setCompanyId(Long.parseLong(session.getAttribute("companyId").toString()));
    	couponVo.setDescription(description);
    	couponVo.setCouponType(couponType);
    	couponVo.setDiscount(Double.parseDouble(discount));
    	couponVo.setDiscountType(discountType);
    	couponVo.setPoints(Double.parseDouble(points));
    	couponVo.setOtpverify(otpverify);
    	couponService.save(couponVo);
    
    }
    @RequestMapping("{id}")
    @ResponseBody
    public CouponVo viewCoupon(@PathVariable(value = "id") long id,HttpSession session) {
        
    	CouponVo couponVo=couponService.findByCouponIdAndCompanyId(id,Long.parseLong(session.getAttribute("companyId").toString()));
    			return couponVo;
    }
    @RequestMapping("delete")
    @ResponseBody
    public void deleteCoupon(@RequestParam(value = "id") long id,HttpSession session) {
    	CouponVo couponVo=couponService.findByCouponIdAndCompanyId(id,Long.parseLong(session.getAttribute("companyId").toString()));
    	couponVo.setIsDeleted(1);
    	couponService.save(couponVo);
    }


}
