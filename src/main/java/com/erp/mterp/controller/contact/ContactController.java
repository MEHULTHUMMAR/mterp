package com.erp.mterp.controller.contact;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import com.erp.mterp.service.city.CityService;
import com.erp.mterp.service.country.CountryService;
import com.erp.mterp.service.state.StateService;
import com.erp.mterp.vo.contact.ContactVo;
import com.erp.mterp.vo.coupon.CouponVo;
import com.erp.mterp.vo.product.ProductVo;
import org.apache.commons.lang3.StringUtils;
import org.dhatim.fastexcel.reader.ReadableWorkbook;
import org.dhatim.fastexcel.reader.Row;
import org.dhatim.fastexcel.reader.Sheet;
//import org.apache.poi.ss.usermodel.Cell;
//import org.apache.poi.ss.usermodel.CellStyle;
//import org.apache.poi.ss.usermodel.CellType;
//import org.apache.poi.ss.usermodel.CreationHelper;
//import org.apache.poi.ss.usermodel.Font;
//import org.apache.poi.ss.usermodel.IndexedColors;
//import org.apache.poi.ss.usermodel.Row;
//import org.apache.poi.ss.usermodel.Sheet;
//import org.apache.poi.ss.usermodel.Workbook;
//import org.apache.poi.xssf.usermodel.XSSFSheet;
//import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.datatables.mapping.DataTablesInput;
import org.springframework.data.jpa.datatables.mapping.DataTablesOutput;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.erp.mterp.config.ImageResize;
import com.erp.mterp.config.SecurityValidation;
import com.erp.mterp.constant.Constant;
import com.erp.mterp.dto.CustomerLoyaltyWrongSheetDTO;
import com.erp.mterp.dto.CustomerUploadSheetFinalDTO;
import com.erp.mterp.dto.FileValidationResponse;
import com.erp.mterp.dto.contact.ContactCustomDatatableDTO;
import com.erp.mterp.dto.contact.ContactCustomDatatableMainDTO;
import com.erp.mterp.dto.datatable.DataTableMetaDTO;
import com.erp.mterp.repository.contact.ContactRepository;
import com.erp.mterp.service.contact.ContactService;
import com.erp.mterp.utill.RegexTest;
import com.erp.mterp.vo.commonResponse.ApiResponse;
import com.erp.mterp.vo.contact.ContactManageVo;

import lombok.var;
import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping("/contact")
public class ContactController {
	@Autowired
	ContactService contactService;
	
	@Autowired
    SecurityValidation securityValidation;
	
	@Autowired
	ContactRepository contactRepository;

	@Autowired
	CountryService countryService;

	@Autowired
	StateService stateService;

	@Autowired
	CityService cityService;
	
	long totalRow=0;
	String rowNumber = "";

	@RequestMapping(value = { "", "/" })
	public ModelAndView Listpage(HttpSession session) {

		ModelAndView view = new ModelAndView("contact/contact");
		view.addObject("CountryList", countryService.findAll());
		view.addObject("StateList", stateService.findAll());
		view.addObject("CityList", cityService.findAll());

		return view;
	}

	@PostMapping("datatable")
	@ResponseBody
	public DataTablesOutput<ContactManageVo> productDatatable(@Valid DataTablesInput input,
			@RequestParam Map<String, String> allRequestParams, HttpSession session) {
		long companyId = Long.parseLong(session.getAttribute("companyId").toString());
		List<Map<Long, Double>> dueAmount = null;
		Specification<ContactManageVo> specification = new Specification<ContactManageVo>() {

			@Override
			public Predicate toPredicate(Root<ContactManageVo> root, CriteriaQuery<?> query,
					CriteriaBuilder criteriaBuilder) {
				List<Predicate> predicates = new ArrayList<Predicate>();
				// predicates.add(criteriaBuilder.equal(root.get("type"), type));
				predicates.add(criteriaBuilder.equal(root.get("isDeleted"), 0));
				predicates.add(criteriaBuilder.equal(root.get("companyId"), companyId));

				return criteriaBuilder.and(predicates.toArray(new Predicate[predicates.size()]));
			}
		};
		DataTablesOutput<ContactManageVo> dataTablesOutput = contactService.findAll(input, null, specification);
		return dataTablesOutput;
	}

	@RequestMapping("/customdatatable")
	@ResponseBody
	public ContactCustomDatatableMainDTO returnCustomDatatable(@RequestParam Map<String, String> allRequestParams,
			@Valid DataTablesInput input, HttpSession session) throws NumberFormatException, ParseException {
		long companyId = Long.parseLong(session.getAttribute("companyId").toString());
		String serachValue = "";
		Integer totallength = 0;

		List<ContactCustomDatatableDTO> list = new ArrayList<ContactCustomDatatableDTO>();
		// search value
		if (StringUtils.isNotBlank(allRequestParams.get("search.value"))) {
			serachValue = allRequestParams.get("search.value").toString();
		}
		log.info("serachValue::" + serachValue);

		totallength = contactService.countOfContactVoDatatable(serachValue, companyId, 0);

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

		list = contactService.getContactVoCustomDatatableBy(serachValue, companyId, 0, length, offset);
		log.severe("LIST SIZE IS :" + list.size());
		double totalRecords = totallength;
		ContactCustomDatatableMainDTO dto = new ContactCustomDatatableMainDTO();
		dto.setData(list);
		dto.setDraw(Integer.parseInt(allRequestParams.get("draw")));
		dto.setError(null);
		dto.setRecordsFiltered((int) totalRecords);
		dto.setRecordsTotal((int) totalRecords);
		dto.setDataTableMetaDTO(
				new DataTableMetaDTO(page, (int) Math.ceil((totalRecords) / length), (int) length, (int) totalRecords));
		return dto;
	}

   //loyalty reset points api


	@PostMapping("/savecontact")
	@ResponseBody
	public void savecontact(@RequestParam(value = "customerName") String customerName,
						   @RequestParam(value = "mobileNo") String mobileNo,
						   @RequestParam(value = "companyName") String companyName,
						   @RequestParam(value = "email") String email,
							@RequestParam(value = "address") String address, @RequestParam(value = "cityCode") String cityCode,
							@RequestParam(value = "stateCode") String stateCode, @RequestParam(value = "countriesCode") String countriesCode,
							@RequestParam(value = "pincode") String pincode,
							@RequestParam(value = "contactId",defaultValue = "0") long contactId,HttpSession session) {

		ContactVo contactVo=new ContactVo();
		if(contactId!=0){
			contactVo.setContactId(contactId);
		}
		contactVo.setAlterBy(Long.parseLong(session.getAttribute("userId").toString()));
		contactVo.setCreatedBy(Long.parseLong(session.getAttribute("userId").toString()));
		contactVo.setCompanyId(Long.parseLong(session.getAttribute("companyId").toString()));
		contactVo.setBranchId(Long.parseLong(session.getAttribute("branchId").toString()));
		contactVo.setEmail(email);
		contactVo.setCompanyName(companyName);
		contactVo.setName(customerName);
		contactVo.setMobNo(mobileNo);
		contactVo.setAddress(address);
		contactVo.setCountriesCode(countriesCode);
		contactVo.setStateCode(stateCode);
		contactVo.setCityCode(cityCode);
		contactVo.setPincode(pincode);
		contactService.saveContact(contactVo);

	}

	@RequestMapping("delete")
	@ResponseBody
	public boolean deleteContact(@RequestParam(value = "id") long id,HttpSession session) {
		ContactVo contactVo =contactService.findBycontactId(id,Long.parseLong(session.getAttribute("companyId").toString()));
		if(contactVo!=null) {
			contactVo.setIsDeleted(1);
			contactService.saveContact(contactVo);
			return true;
		}else{
			return false;
		}
	}

	@RequestMapping("/{id}/address")
	@ResponseBody
	public Map<String,String> contactVoData(HttpSession session, @PathVariable("id") long id) {
		Map<String,String> contactVo= contactService.findAddressDetails(id, Long.parseLong(session.getAttribute("companyId").toString()));
		return contactVo;
	}
	


}
