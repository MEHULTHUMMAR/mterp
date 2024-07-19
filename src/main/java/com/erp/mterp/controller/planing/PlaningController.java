package com.erp.mterp.controller.planing;

import com.erp.mterp.dto.contact.ContactCustomDatatableDTO;
import com.erp.mterp.service.bom.BOMService;
import com.erp.mterp.service.city.CityService;
import com.erp.mterp.service.contact.ContactService;
import com.erp.mterp.service.country.CountryService;
import com.erp.mterp.service.enquire.EnquireService;
import com.erp.mterp.service.planing.PlaningService;
import com.erp.mterp.service.state.StateService;
import com.erp.mterp.vo.planing.PlaningVo;
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
@RequestMapping("/planing")
public class PlaningController {
	@Autowired
	ContactService contactService;

	@Autowired
	PlaningService planingService;

	@Autowired
	EnquireService enquireService;

	@Autowired
	CountryService countryService;

	@Autowired
	StateService stateService;
	@Autowired
	CityService cityService;

	@Autowired
	BOMService bomService;
	long totalRow=0;
	String rowNumber = "";

	@RequestMapping(value = { "", "/" })
	public ModelAndView Listpage(HttpSession session) {

		ModelAndView view = new ModelAndView("planing/planing");

		return view;
	}

	@RequestMapping(value = { "/new" })
	public ModelAndView NewEnquire(HttpSession session) {
		ModelAndView view = new ModelAndView("planing/planing-new");
String prefix="PLN";
		view.addObject(	"prefix",prefix);
		view.addObject(	"planingNo",planingService.findNextPlaningNo(Long.parseLong(session.getAttribute("companyId").toString()),prefix));
		view.addObject(	"enquireList",enquireService.findEnquiryforPlaning(Long.parseLong(session.getAttribute("companyId").toString())));

		return view;
	}

	@RequestMapping(value = { "/view/{id}" })
	public ModelAndView ViewEnquire(HttpSession session,@PathVariable("id")long id) {
		ModelAndView view = new ModelAndView("planing/planing-view");
		PlaningVo planingVo = planingService.findByPlaningId(id,Long.parseLong(session.getAttribute("companyId").toString()));
//		if(planingVo.getContactVo().getCountriesCode()!=null) {
//			planingVo.getContactVo().setCountryName(countryService.findByCountriesCode(planingVo.getContactVo().getCountriesCode()).getCountriesName());
//		}
//		if(planingVo.getContactVo().getStateCode()!=null) {
//			planingVo.getContactVo().setStateName(stateService.findByStateCode(planingVo.getContactVo().getStateCode()).getStateName());
//		}
//		if(planingVo.getContactVo().getCityCode()!=null) {
//			planingVo.getContactVo().setCityName(cityService.findByCityCode(planingVo.getContactVo().getCityCode()).getCityName());
//		}

		view.addObject(	"planingVo",planingVo);

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

		totallength = planingService.countOfPlaningDatatable(serachValue, companyId, 0);

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
		jsonMainObject.put("data", planingService.findPlaningData(Long.parseLong(session. getAttribute("companyId").toString()),serachValue,length, offset));
		jsonMainObject.put("meta", jsonMataObject);
		return jsonMainObject;
	}

   //loyalty reset points api


	@PostMapping("/save")
	@ResponseBody
	public ModelAndView saveenquire(@ModelAttribute("planingVo") PlaningVo planingVo, HttpSession session) {
		ModelAndView view = new ModelAndView();
		view.setViewName("redirect:/planing");
		planingVo.setAlterBy(Long.parseLong(session.getAttribute("userId").toString()));
		planingVo.setCreatedBy(Long.parseLong(session.getAttribute("userId").toString()));
		planingVo.setCompanyId(Long.parseLong(session.getAttribute("companyId").toString()));
		planingVo.setBranchId(Long.parseLong(session.getAttribute("branchId").toString()));
		planingVo.setStatus("pending");

		if(planingVo.getPlaningItemVos()!=null) {
			planingVo.getPlaningItemVos().removeIf(x -> x.getProductVo() == null);
			planingVo.getPlaningItemVos().forEach(doc -> {
				doc.setPlaningVo(planingVo);

			});
		}
		planingService.savePlaning(planingVo);
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
		PlaningVo planingVo = planingService.findByPlaningId(id,Long.parseLong(session.getAttribute("companyId").toString()));
		if(planingVo!=null) {
			planingVo.setIsDeleted(1);
			planingService.savePlaning(planingVo);
			bomService.deleteBOMByPlaningId(id);

			return true;
		}else{
			return false;
		}
	}

	@RequestMapping("/update/itemcost/{id}")
	@ResponseBody
	public String updateItemCose(HttpSession session, @PathVariable("id") long id) {
		 planingService.updateplaningItemCost(id);
		return "true";
	}

	@RequestMapping("/{id}/getplaning-data")
	@ResponseBody
	public PlaningVo enquiryData(HttpSession session, @PathVariable("id") long id) {
		PlaningVo planingVo= planingService.findByPlaningId(id, Long.parseLong(session.getAttribute("companyId").toString()));
//		if(planingVo.getContactVo().getCountriesCode()!=null) {
//			planingVo.getContactVo().setCountryName(countryService.findByCountriesCode(planingVo.getContactVo().getCountriesCode()).getCountriesName());
//		}
//		if(planingVo.getContactVo().getStateCode()!=null) {
//			planingVo.getContactVo().setStateName(stateService.findByStateCode(planingVo.getContactVo().getStateCode()).getStateName());
//		}
//		if(planingVo.getContactVo().getCityCode()!=null) {
//			planingVo.getContactVo().setCityName(cityService.findByCityCode(planingVo.getContactVo().getCityCode()).getCityName());
//		}
		return planingVo;
	}

}
