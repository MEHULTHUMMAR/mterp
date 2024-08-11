package com.erp.mterp.controller.enquire;

import com.erp.mterp.dto.contact.ContactCustomDatatableDTO;
import com.erp.mterp.service.category.CategoryService;
import com.erp.mterp.service.city.CityService;
import com.erp.mterp.service.contact.ContactService;
import com.erp.mterp.service.country.CountryService;
import com.erp.mterp.service.enquire.EnquireService;
import com.erp.mterp.service.product.ProductService;
import com.erp.mterp.service.state.StateService;
import com.erp.mterp.vo.enquire.EnquireVo;
import lombok.extern.java.Log;
import org.apache.commons.lang3.StringUtils;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.datatables.mapping.DataTablesInput;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Log
@Controller
@RequestMapping("/enquire")
public class EnquireController {
	@Autowired
	CategoryService categoryService;

	@Autowired
	ContactService contactService;

	@Autowired
	ProductService productService;

	@Autowired
	EnquireService enquireService;

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

		ModelAndView view = new ModelAndView("enquire/enquire");

		return view;
	}

	@RequestMapping(value = { "/new" })
	public ModelAndView NewEnquire(HttpSession session) {
		ModelAndView view = new ModelAndView("enquire/enquire-new");
String prefix="ENQ";
		view.addObject(	"prefix",prefix);
		view.addObject(	"enquiryNo",enquireService.findNextEnquiryNo(Long.parseLong(session.getAttribute("companyId").toString()),prefix));
		view.addObject("productList",productService.findProductByCompanyId(Long.parseLong(session.getAttribute("companyId").toString())));
		view.addObject("contactList",contactService.findByCompanyIdAndIsDeleted(Long.parseLong(session.getAttribute("companyId").toString()),0));

		return view;
	}

	@RequestMapping(value = { "/view/{id}" })
	public ModelAndView ViewEnquire(HttpSession session,@PathVariable("id")long id) {
		ModelAndView view = new ModelAndView("enquire/enquire-view");
		EnquireVo enquireVo = enquireService.findByEnquireId(id,Long.parseLong(session.getAttribute("companyId").toString()));
//		if(enquireVo.getContactVo().getCountriesCode()!=null) {
//			enquireVo.getContactVo().setCountryName(countryService.findByCountriesCode(enquireVo.getContactVo().getCountriesCode()).getCountriesName());
//		}
//		if(enquireVo.getContactVo().getStateCode()!=null) {
//			enquireVo.getContactVo().setStateName(stateService.findByStateCode(enquireVo.getContactVo().getStateCode()).getStateName());
//		}
//		if(enquireVo.getContactVo().getCityCode()!=null) {
//			enquireVo.getContactVo().setCityName(cityService.findByCityCode(enquireVo.getContactVo().getCityCode()).getCityName());
//		}
		view.addObject(	"enquiryVo",enquireVo);

		return view;
	}

	@RequestMapping(value = { "/edit/{id}" })
	public ModelAndView EditEnquire(HttpSession session,@PathVariable("id")long id) {
		ModelAndView view = new ModelAndView("enquire/enquire-edit");
		EnquireVo enquireVo = enquireService.findByEnquireId(id,Long.parseLong(session.getAttribute("companyId").toString()));
//		if(enquireVo.getContactVo().getCountriesCode()!=null) {
//			enquireVo.getContactVo().setCountryName(countryService.findByCountriesCode(enquireVo.getContactVo().getCountriesCode()).getCountriesName());
//		}
//		if(enquireVo.getContactVo().getStateCode()!=null) {
//			enquireVo.getContactVo().setStateName(stateService.findByStateCode(enquireVo.getContactVo().getStateCode()).getStateName());
//		}
//		if(enquireVo.getContactVo().getCityCode()!=null) {
//			enquireVo.getContactVo().setCityName(cityService.findByCityCode(enquireVo.getContactVo().getCityCode()).getCityName());
//		}
		view.addObject(	"enquiryVo",enquireVo);
		view.addObject("productList",productService.findProductByCompanyId(Long.parseLong(session.getAttribute("companyId").toString())));
		view.addObject("contactList",contactService.findByCompanyIdAndIsDeleted(Long.parseLong(session.getAttribute("companyId").toString()),0));

		return view;
	}

	@RequestMapping("/customdatatable")
	@ResponseBody
	public JSONObject returnCustomDatatable(@RequestParam Map<String, String> allRequestParams,
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

		totallength = enquireService.countOfEnquireDatatable(serachValue, companyId, 0);

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

		JSONObject jsonMainObject=new JSONObject();
		JSONObject jsonMataObject = new JSONObject();
		double totalRecords=totallength;
		jsonMataObject.put("page", page);
		jsonMataObject.put("pages", Math.ceil((totalRecords) / length));
		jsonMataObject.put("perpage", length);
		jsonMataObject.put("total", totalRecords);

		jsonMainObject.put("draw",Integer.parseInt(allRequestParams.get("draw")));
		jsonMainObject.put("recordsFiltered",totalRecords);
		jsonMainObject.put("recordsTotal",totalRecords);
		jsonMainObject.put("data", enquireService.findEnquiryData(Long.parseLong(session. getAttribute("companyId").toString()),serachValue,length, offset));
		jsonMainObject.put("meta", jsonMataObject);
		return jsonMainObject;
	}

   //loyalty reset points api


	@PostMapping("/save")
	@ResponseBody
	public ModelAndView saveenquire(@ModelAttribute("enquireVo") EnquireVo enquireVo, HttpSession session) {
		ModelAndView view = new ModelAndView();
		view.setViewName("redirect:/enquire");
		if(enquireVo.getEnquireId()==0) {
			enquireVo.setCreatedBy(Long.parseLong(session.getAttribute("userId").toString()));
			enquireVo.setCompanyId(Long.parseLong(session.getAttribute("companyId").toString()));
			enquireVo.setBranchId(Long.parseLong(session.getAttribute("branchId").toString()));
		}
		enquireVo.setAlterBy(Long.parseLong(session.getAttribute("userId").toString()));

		if(enquireVo.getEnquireItemVos()!=null) {
			enquireVo.getEnquireItemVos().removeIf(x -> x.getProductVo() == null);
			enquireVo.getEnquireItemVos().forEach(doc -> {
				log.info("id"+doc.getEnquireItemId());
				doc.setEnquireVo(enquireVo);

			});
		}
		enquireService.saveEnquire(enquireVo);
		return view;
	}

	private static String getFileExtension(MultipartFile files) {
		String fileName = files.getOriginalFilename();
		System.out.println("FILENAME:::+" + fileName);
		if (fileName.lastIndexOf(".") != -1 && fileName.lastIndexOf(".") != 0)
			return fileName.substring(fileName.lastIndexOf(".") + 1);
		else
			return "";
	}
	@RequestMapping("delete")
	@ResponseBody
	public boolean deleteProduct(@RequestParam(value = "id") long id,HttpSession session) {
		EnquireVo enquireVo =enquireService.findByEnquireId(id,Long.parseLong(session.getAttribute("companyId").toString()));
		if(enquireVo!=null) {
			enquireVo.setIsDeleted(1);
			enquireService.saveEnquire(enquireVo);
			return true;
		}else{
			return false;
		}
	}

	@RequestMapping("/getdata/{id}")
	@ResponseBody
	public List<Map<String,String>> productData(HttpSession session, @PathVariable("id") long id) {
		return productService.findByProductId(id, Long.parseLong(session.getAttribute("companyId").toString()));
	}

	@RequestMapping("/{id}/getenquire-data")
	@ResponseBody
	public EnquireVo enquiryData(HttpSession session, @PathVariable("id") long id) {
		EnquireVo enquireVo= enquireService.findByEnquireId(id, Long.parseLong(session.getAttribute("companyId").toString()));
		return enquireVo;
	}

}
