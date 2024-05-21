package com.erp.mterp.controller.quotation;

import com.erp.mterp.dto.contact.ContactCustomDatatableDTO;
import com.erp.mterp.service.city.CityService;
import com.erp.mterp.service.contact.ContactService;
import com.erp.mterp.service.country.CountryService;
import com.erp.mterp.service.enquire.EnquireService;
import com.erp.mterp.service.planing.PlaningService;
import com.erp.mterp.service.quotation.QuotationService;
import com.erp.mterp.service.state.StateService;
import com.erp.mterp.utill.JasperExporter;
import com.erp.mterp.vo.planing.PlaningVo;
import com.erp.mterp.vo.quotation.QuotationVo;
import lombok.extern.java.Log;
import org.apache.commons.lang3.StringUtils;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.jpa.datatables.mapping.DataTablesInput;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Log
@Controller
@RequestMapping("/quotation")
public class QuotationController {
	@Autowired
	ContactService contactService;

	@Autowired
	PlaningService planingService;

	@Autowired
	JasperExporter jasperExporter;

	@Autowired
	QuotationService quotationService;

	@Autowired
	CountryService countryService;

	@Autowired
	StateService stateService;
	@Autowired
	CityService cityService;
	long totalRow=0;
	String rowNumber = "";

	@Value("${JASPER_REPORT_PATH}")
	private String JASPER_REPORT_PATH;

	@RequestMapping(value = { "", "/" })
	public ModelAndView Listpage(HttpSession session) {

		ModelAndView view = new ModelAndView("quotation/quotation");

		return view;
	}

	@RequestMapping(value = { "/new" })
	public ModelAndView NewEnquire(HttpSession session) {
		ModelAndView view = new ModelAndView("quotation/quotation-new");
		String prefix="ORD";
		view.addObject(	"prefix",prefix);
		view.addObject(	"quotationNo",quotationService.findNextQuotationNo(Long.parseLong(session.getAttribute("companyId").toString()),prefix));
		view.addObject(	"planingList",planingService.findPlaningForQuotation(Long.parseLong(session.getAttribute("companyId").toString())));

		return view;
	}

	@RequestMapping(value = { "/view/{id}" })
	public ModelAndView ViewQuotation(HttpSession session,@PathVariable("id")long id) {
		ModelAndView view = new ModelAndView("quotation/quotation-view");
		QuotationVo quotationVo = quotationService.findByQuotationId(id,Long.parseLong(session.getAttribute("companyId").toString()));
		if(quotationVo.getContactVo().getCountriesCode()!=null) {
			quotationVo.getContactVo().setCountryName(countryService.findByCountriesCode(quotationVo.getContactVo().getCountriesCode()).getCountriesName());
		}
		if(quotationVo.getContactVo().getStateCode()!=null) {
			quotationVo.getContactVo().setStateName(stateService.findByStateCode(quotationVo.getContactVo().getStateCode()).getStateName());
		}
		if(quotationVo.getContactVo().getCityCode()!=null) {
			quotationVo.getContactVo().setCityName(cityService.findByCityCode(quotationVo.getContactVo().getCityCode()).getCityName());
		}
		view.addObject(	"quotationVo",quotationVo);
		return view;
	}

	@RequestMapping(value = { "/edit/{id}" })
	public ModelAndView EditQuotation(HttpSession session,@PathVariable("id")long id) {
		ModelAndView view = new ModelAndView("quotation/quotation-edit");
		QuotationVo quotationVo = quotationService.findByQuotationId(id,Long.parseLong(session.getAttribute("companyId").toString()));
		if(quotationVo.getContactVo().getCountriesCode()!=null) {
			quotationVo.getContactVo().setCountryName(countryService.findByCountriesCode(quotationVo.getContactVo().getCountriesCode()).getCountriesName());
		}
		if(quotationVo.getContactVo().getStateCode()!=null) {
			quotationVo.getContactVo().setStateName(stateService.findByStateCode(quotationVo.getContactVo().getStateCode()).getStateName());
		}
		if(quotationVo.getContactVo().getCityCode()!=null) {
			quotationVo.getContactVo().setCityName(cityService.findByCityCode(quotationVo.getContactVo().getCityCode()).getCityName());
		}
		view.addObject(	"quotationVo",quotationVo);

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

		totallength = quotationService.countOfQuotationDatatable(serachValue, companyId, 0);

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
		jsonMainObject.put("data", quotationService.findQuotationData(Long.parseLong(session. getAttribute("companyId").toString()),serachValue,length, offset));
		jsonMainObject.put("meta", jsonMataObject);
		return jsonMainObject;
	}

   //loyalty reset points api


	@PostMapping("/save")
	@ResponseBody
	public ModelAndView savequotation(@ModelAttribute("quotationVo") QuotationVo quotationVo, HttpSession session) {
		ModelAndView view = new ModelAndView();
		view.setViewName("redirect:/quotation");
		quotationVo.setAlterBy(Long.parseLong(session.getAttribute("userId").toString()));
		quotationVo.setCreatedBy(Long.parseLong(session.getAttribute("userId").toString()));
		quotationVo.setCompanyId(Long.parseLong(session.getAttribute("companyId").toString()));
		quotationVo.setBranchId(Long.parseLong(session.getAttribute("branchId").toString()));
		quotationVo.setStatus("pending");

		if(quotationVo.getQuotationItemVos()!=null) {
			quotationVo.getQuotationItemVos().removeIf(x -> x.getProductVo() == null);
			quotationVo.getQuotationItemVos().forEach(doc -> {
				doc.setQuotationVo(quotationVo);
			});
		}
		quotationService.saveQuotation(quotationVo);
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
		QuotationVo quotationVo = quotationService.findByQuotationId(id,Long.parseLong(session.getAttribute("companyId").toString()));
		if(quotationVo!=null) {
			quotationVo.setIsDeleted(1);
			quotationService.saveQuotation(quotationVo);
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

	@GetMapping(value = {"/pdf/{id}"}) // Invoice PDF
	public void salesPDF(@PathVariable long id, HttpSession session,
						 HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		String Receipt = "Receipt";
		HashMap jasperParameter = new HashMap();
		jasperParameter.put("realPath", session.getAttribute("realPath").toString());
		jasperParameter.put("user_front_id", Long.parseLong(session.getAttribute("companyId").toString()));
		jasperParameter.put("display_title", Receipt);
		jasperParameter.put("quotation_id", id);


		jasperParameter.put("path", JASPER_REPORT_PATH + System.getProperty("file.separator"));

		jasperExporter.jasperExporterPDF(jasperParameter, JASPER_REPORT_PATH + System.getProperty("file.separator") + "/quotation.jrxml","Quotation", response);

	}
}
