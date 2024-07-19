package com.erp.mterp.controller.contact;

import com.erp.mterp.config.SecurityValidation;
import com.erp.mterp.dto.contact.ContactCustomDatatableDTO;
import com.erp.mterp.dto.contact.ContactCustomDatatableMainDTO;
import com.erp.mterp.dto.datatable.DataTableMetaDTO;
import com.erp.mterp.repository.contact.ContactRepository;
import com.erp.mterp.service.city.CityService;
import com.erp.mterp.service.contact.ContactService;
import com.erp.mterp.service.country.CountryService;
import com.erp.mterp.service.state.StateService;
import com.erp.mterp.vo.contact.ContactAddressVo;
import com.erp.mterp.vo.contact.ContactVo;
import lombok.extern.java.Log;
import org.apache.commons.collections4.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.datatables.mapping.DataTablesInput;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

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

	@RequestMapping(value =  "/new")
	public ModelAndView Newpage(HttpSession session) {

		ModelAndView view = new ModelAndView("contact/contact-new");
		view.addObject("CountryList", countryService.findAll());
		view.addObject("StateList", stateService.findAll());
		view.addObject("CityList", cityService.findAll());

		return view;
	}

	@RequestMapping(value =  "/{id}")
	public ModelAndView viewpage(HttpSession session,@PathVariable(value = "id") Long id) {

		ModelAndView view = new ModelAndView("contact/contact-view");
		view.addObject("CountryList", countryService.findAll());
		view.addObject("StateList", stateService.findAll());
		view.addObject("CityList", cityService.findAll());
		view.addObject("ContactDetails",	contactService.findBycontactId(id,Long.parseLong(session.getAttribute("companyId").toString())));
	return view;
	}

	@RequestMapping(value =  "/{id}/edit")
	public ModelAndView Editpage(HttpSession session,@PathVariable(value = "id") Long id) {

		ModelAndView view = new ModelAndView("contact/contact-edit");
		view.addObject("CountryList", countryService.findAll());
		view.addObject("StateList", stateService.findAll());
		view.addObject("CityList", cityService.findAll());
		view.addObject("ContactDetails",	contactService.findBycontactId(id,Long.parseLong(session.getAttribute("companyId").toString())));
		return view;
	}
//
//	@PostMapping("datatable")
//	@ResponseBody
//	public DataTablesOutput<ContactManageVo> productDatatable(@Valid DataTablesInput input,
//			@RequestParam Map<String, String> allRequestParams, HttpSession session) {
//		long companyId = Long.parseLong(session.getAttribute("companyId").toString());
//		List<Map<Long, Double>> dueAmount = null;
//		Specification<ContactManageVo> specification = new Specification<ContactManageVo>() {
//
//			@Override
//			public Predicate toPredicate(Root<ContactManageVo> root, CriteriaQuery<?> query,
//					CriteriaBuilder criteriaBuilder) {
//				List<Predicate> predicates = new ArrayList<Predicate>();
//				// predicates.add(criteriaBuilder.equal(root.get("type"), type));
//				predicates.add(criteriaBuilder.equal(root.get("isDeleted"), 0));
//				predicates.add(criteriaBuilder.equal(root.get("companyId"), companyId));
//
//				return criteriaBuilder.and(predicates.toArray(new Predicate[predicates.size()]));
//			}
//		};
//		DataTablesOutput<ContactManageVo> dataTablesOutput = contactService.findAll(input, null, specification);
//		return dataTablesOutput;
//	}

	@RequestMapping("/customdatatable")
	@ResponseBody
	public ContactCustomDatatableMainDTO returnCustomDatatable(@RequestParam Map<String, String> allRequestParams,
			@Valid DataTablesInput input, HttpSession session) throws NumberFormatException, ParseException {
		long branchId = Long.parseLong(session.getAttribute("branchId").toString());
		String serachValue = "";
		Integer totallength = 0;

		List<ContactCustomDatatableDTO> list = new ArrayList<ContactCustomDatatableDTO>();
		// search value
		if (StringUtils.isNotBlank(allRequestParams.get("search.value"))) {
			serachValue = allRequestParams.get("search.value").toString();
		}
		log.info("serachValue::" + serachValue);

		totallength = contactService.countOfContactVoDatatable(serachValue, branchId, 0);

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

		list = contactService.getContactVoCustomDatatableBy(serachValue, branchId, 0, length, offset);
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
	public String savecontact(@ModelAttribute("contact") ContactVo contactVo, HttpSession session, @RequestParam Map<String, String> allRequestParams) {

		contactVo.setAlterBy(Long.parseLong(session.getAttribute("userId").toString()));
		contactVo.setCreatedBy(Long.parseLong(session.getAttribute("userId").toString()));
		contactVo.setCompanyId(Long.parseLong(session.getAttribute("companyId").toString()));
		contactVo.setBranchId(Long.parseLong(session.getAttribute("branchId").toString()));

		if (!CollectionUtils.isEmpty(contactVo.getContactAddressVos())) {
			contactVo.getContactAddressVos().removeIf(address -> address.getCountriesCode() == null);
			for (ContactAddressVo contactAddressVo : contactVo.getContactAddressVos()) {
				ContactAddressVo contactAddressVoActual = contactService.findByContactAddressId(contactAddressVo.getContactAddressId());

				contactAddressVo.setContact(contactVo);

				try {
					if (contactAddressVoActual != null) {
						contactAddressVo.setIsDefault(contactAddressVoActual.getIsDefault());
					} else {
						if (contactVo.getContactAddressVos().indexOf(contactAddressVo) == 0) {
							contactAddressVo.setIsDefault(1);
						}
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			if (contactVo.getContactAddressVos().stream().filter(x -> x.getIsDefault() == 1).count() == 0) {
				contactVo.getContactAddressVos().get(0).setIsDefault(1);
			}

		}
		ContactVo contactVo2=	contactService.saveContact(contactVo);

		if (allRequestParams.containsKey("deleteAddress") == true) {
			if (!allRequestParams.get("deleteAddress").equals("")) {
				String address = allRequestParams.get("deleteAddress").substring(0,
						allRequestParams.get("deleteAddress").length() - 1);

				List<Long> l = Arrays.asList(address.split(",")).stream().map(Long::parseLong)
						.collect(Collectors.toList());
				contactService.updateAddress(l);
			}

		}

		return "redirect:/contact/" + contactVo2.getContactId();
	}

	@ResponseBody
	@PostMapping("/{id}/updateDefaultAddress/{addressId}")
	public String updateDefaultAddress(@PathVariable Long id, @PathVariable(value = "addressId") Long addressId, HttpSession session) {

		contactService.updateAllAdress(id);
		contactService.updateDefaultAddress(addressId);
		return "0";
	}

	@RequestMapping("/{id}/delete")
	@ResponseBody
	public boolean deleteContact(@PathVariable Long id,HttpSession session) {
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
	public List<Map<String,String>> contactVoData(HttpSession session, @PathVariable("id") long id) {
		List<Map<String,String>> contactVo= contactService.findAddressDetails(id, Long.parseLong(session.getAttribute("branchId").toString()));
		return contactVo;
	}
	


}
