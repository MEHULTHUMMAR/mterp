package com.erp.mterp.controller.category;

import com.erp.mterp.repository.category.CategoryRepository;
import com.erp.mterp.service.category.CategoryService;
import com.erp.mterp.vo.category.CategoryVo;
import lombok.extern.java.Log;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Log
@Slf4j
@Controller
@RequestMapping("/category")
public class CategoryController {
	@Autowired
	CategoryService categoryservice;
	@Autowired
	CategoryRepository categoryRepository;

	@RequestMapping(value = { "/", "" })
	public ModelAndView newContact(HttpSession session) {
		ModelAndView view = new ModelAndView("category/category");
		return view;
	}

	@PostMapping("/savecategory")
	@ResponseBody
	public CategoryVo savecategory(@RequestParam(value = "name") String name, HttpSession session) {
		DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
		CategoryVo cat = new CategoryVo();
		cat.setCategoryName((name.length() > 50 ? name.substring(0, 50) : name));
		cat.setCreatedBy(Long.parseLong(session.getAttribute("userId").toString()));
		cat.setBranchId(Long.parseLong(session.getAttribute("branchId").toString()));
		cat.setCompanyId(Long.parseLong(session.getAttribute("companyId").toString()));

		CategoryVo categoryVo = categoryservice.save(cat);
		return cat;
	}

	@PostMapping("/checkcategory")
	@ResponseBody
	public String checkcategory(@RequestParam(defaultValue = "", value = "category") String name,
								@RequestParam(defaultValue = "0", value = "categoryId") long categoryId,
								@RequestParam(defaultValue = "", value = "catupname") String upcategoryname, HttpSession session) {
		List<CategoryVo> b = new ArrayList<>();

		if (categoryId == 0) {
			b = categoryservice.findByCategoryNameIgnoreCaseAndBranchId(name,Long.parseLong(session.getAttribute("companyId").toString()));
		} else {
			b = categoryservice.findByCategoryNameIgnoreCaseAndBranchIdAndCategoryIdNot(upcategoryname,
					Long.parseLong(session.getAttribute("companyId").toString()), categoryId);
		}
		if (b.size() == 0) {
			return "{ \"valid\": true }";
		} else {
			return "{ \"valid\": false }";
		}
	}


	@PostMapping("/updatecategory")
	@ResponseBody
	public CategoryVo updatecategory(@RequestParam(value = "name") String name, @RequestParam(value = "id") long id, HttpSession session) throws ParseException {
		try {
			DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
			CategoryVo cat = categoryservice.findByCategoryIdAndCompanyIdAndIsDeleted(id,Long.parseLong(session.getAttribute("companyId").toString()), 0);
			if (cat == null) return new CategoryVo();
			cat.setCategoryName((name.length() > 50 ? name.substring(0, 50) : name));
			cat.setModifiedOn(dateFormat.parse(dateFormat.format(new Date())));
			CategoryVo categoryVo = categoryservice.save(cat);
			return cat;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}


	@PostMapping("/deletecategory")
	@ResponseBody
	public String deletecategory(@RequestParam(value = "id") long id, HttpSession session) {

		CategoryVo categoryVo1 = categoryservice.findByCategoryIdAndCompanyIdAndIsDeleted(id,
				Long.parseLong(session. getAttribute("companyId").toString()), 0);
		if(categoryVo1!=null) {
			categoryservice.delete(id, categoryVo1.getCompanyId());
		}
			return "Sucess";
	}

	@ResponseBody
	@PostMapping("/datatable")
	private JSONObject categoryDatatable(HttpSession session, @RequestParam Map<String, String> allRequestParams) throws ParseException {

		String searchValue="";
		if(StringUtils.isNotBlank(allRequestParams.get("search.value"))){
			searchValue = allRequestParams.get("search.value");
		}


		int totalRecord = categoryservice.findTotalCategoryRecord(Long.parseLong(session. getAttribute("companyId").toString()),searchValue);

		int start = Integer.parseInt(allRequestParams.get("start"));
		String pageLength=allRequestParams.get("length");
		int length =0,page=0,offset=0,draw=1;

		try {
			if(allRequestParams.get("draw")!=null && !allRequestParams.get("draw").equals("")){
				draw=1;
			}else {
				draw=Integer.parseInt(allRequestParams.get("draw").toString());
			}
		} catch (Exception e) {
			// TODO: handle exception
		}

		if(!pageLength.equals("-1")) {
			length = Integer.parseInt(allRequestParams.get("length"));
			page = start / length; //Calculate page number
			offset= page*length;
			// log.info("length::::>>>>>"+length);
		}else {
			length=totalRecord;
			offset=0;
		}

		JSONObject jsonMainObject=new JSONObject();
		JSONObject jsonMataObject = new JSONObject();
		double totalRecords=totalRecord;
		jsonMataObject.put("page", page);
		jsonMataObject.put("pages", Math.ceil((totalRecords) / length));
		jsonMataObject.put("perpage", length);
		jsonMataObject.put("total", totalRecords);

		jsonMainObject.put("draw",Integer.parseInt(allRequestParams.get("draw")));
		jsonMainObject.put("recordsFiltered",totalRecords);
		jsonMainObject.put("recordsTotal",totalRecords);
		jsonMainObject.put("data", categoryservice.findcategoryData(Long.parseLong(session. getAttribute("companyId").toString()),searchValue,length, offset));
		jsonMainObject.put("meta", jsonMataObject);
		return jsonMainObject;
	}


}
