package com.erp.mterp.controller.bom;

import com.erp.mterp.dto.contact.ContactCustomDatatableDTO;
import com.erp.mterp.global.CurrentDateTime;
import com.erp.mterp.service.bom.BOMService;
import com.erp.mterp.service.category.CategoryService;
import com.erp.mterp.service.contact.ContactService;
import com.erp.mterp.service.drawinglogic.DrawingLogicService;
import com.erp.mterp.service.enquire.EnquireService;
import com.erp.mterp.service.planing.PlaningService;
import com.erp.mterp.service.product.ProductService;
import com.erp.mterp.vo.bom.BillOfMaterialVo;
import com.erp.mterp.vo.planing.PlaningItemDLVo;
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
@RequestMapping("/bom")
public class BillOfMaterialController {
	@Autowired
	CategoryService categoryService;

	@Autowired
	ContactService contactService;

	@Autowired
	ProductService productService;

	@Autowired
	EnquireService enquireService;

	@Autowired
	BOMService bomService;

	@Autowired
	PlaningService planingService;

	@Autowired
	DrawingLogicService drawingLogicService;

	long totalRow=0;
	String rowNumber = "";

	@RequestMapping(value = { "", "/" })
	public ModelAndView Listpage(HttpSession session) {

		ModelAndView view = new ModelAndView("bom/bom");

		return view;
	}

	@RequestMapping(value = { "/generatebydl/{dl_id}/{dl_planing_item_id}" })
	public ModelAndView NewEnquire(HttpSession session,@PathVariable("dl_id") long dl_id,@PathVariable("dl_planing_item_id") long dl_planing_item_id) {
		ModelAndView view = new ModelAndView("bom/bom-new");
		String prefix="BOM";
		view.addObject(	"prefix",prefix);
		view.addObject(	"drawingLogicId",dl_id);
		view.addObject(	"planingItemId",dl_planing_item_id);
		view.addObject(	"bomNo",bomService.findNextBOMNo(Long.parseLong(session.getAttribute("companyId").toString()),prefix));
		view.addObject("materilTypeList",productService.findMaterialTypeList());
		view.addObject("uomList",productService.findUOMList());

		return view;
	}
	@RequestMapping(value = { "/new" })
	public ModelAndView NewBOM(HttpSession session) {
		ModelAndView view = new ModelAndView("bom/bom-new");
		String prefix="bom";
		view.addObject(	"prefix",prefix);
		//view.addObject(	"bomNo",enquireService.findNextEnquiryNo(Long.parseLong(session.getAttribute("companyId").toString()),prefix));
		//view.addObject("productList",productService.findProductByCompanyId(Long.parseLong(session.getAttribute("companyId").toString())));
		//view.addObject("contactList",contactService.findByCompanyIdAndIsDeleted(Long.parseLong(session.getAttribute("companyId").toString()),0));

		return view;
	}

	@RequestMapping(value = { "/view/{id}" })
	public ModelAndView ViewBOM(HttpSession session,@PathVariable("id")long id) {
		ModelAndView view = new ModelAndView("bom/bom-view");
		view.addObject(	"bomVo",bomService.findByBOMId(id,Long.parseLong(session.getAttribute("companyId").toString())));

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

		totallength = bomService.countOfBOMDatatable(serachValue, companyId, 0);

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
		jsonMainObject.put("data", bomService.findBOMData(Long.parseLong(session. getAttribute("companyId").toString()),serachValue,length, offset));
		jsonMainObject.put("meta", jsonMataObject);
		return jsonMainObject;
	}

   //loyalty reset points api


	@PostMapping("/save")
	@ResponseBody
	public ModelAndView saveBOM(@ModelAttribute("billOfMaterialVo") BillOfMaterialVo billOfMaterialVo, HttpSession session) {
		ModelAndView view = new ModelAndView();
		view.setViewName("redirect:/bom");
		billOfMaterialVo.setAlterBy(Long.parseLong(session.getAttribute("userId").toString()));
		billOfMaterialVo.setCreatedBy(Long.parseLong(session.getAttribute("userId").toString()));
		billOfMaterialVo.setCompanyId(Long.parseLong(session.getAttribute("companyId").toString()));
		billOfMaterialVo.setBranchId(Long.parseLong(session.getAttribute("branchId").toString()));
		billOfMaterialVo.setBomDate(CurrentDateTime.getTodayDate());

		billOfMaterialVo= bomService.saveBOM(billOfMaterialVo);

		PlaningItemDLVo planingItemDLVo =new PlaningItemDLVo();
		planingItemDLVo.setCosting(billOfMaterialVo.getBomTotal());
		planingItemDLVo.setPlaningItemId(billOfMaterialVo.getPlaningItemId());
		planingItemDLVo.setBillofmaterialId(billOfMaterialVo.getBillofmaterialId());
		planingItemDLVo.setDrawingLogicDocVo(billOfMaterialVo.getDrawingLogicDocVo());

		planingService.savePlaningItemDL(planingItemDLVo);
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
		List<Long> list = drawingLogicService.getDLAndPlaningFromBOMID(id);
		if(list.size()>0){
			bomService.deleteBOM(id);
			drawingLogicService.deleteplaningDL(list);
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
}
