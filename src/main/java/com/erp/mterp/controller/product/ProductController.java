package com.erp.mterp.controller.product;

import com.erp.mterp.constant.Constant;
import com.erp.mterp.dto.CustomerLoyaltyWrongSheetDTO;
import com.erp.mterp.dto.CustomerUploadSheetFinalDTO;
import com.erp.mterp.dto.contact.ContactCustomDatatableDTO;
import com.erp.mterp.service.category.CategoryService;
import com.erp.mterp.service.contact.ContactService;
import com.erp.mterp.service.product.ProductService;
import com.erp.mterp.utill.RegexTest;
import com.erp.mterp.vo.commonResponse.ApiResponse;
import com.erp.mterp.vo.contact.ContactManageVo;
import com.erp.mterp.vo.contact.ContactVo;
import com.erp.mterp.vo.product.ProductVo;
import lombok.extern.java.Log;
import lombok.var;
import org.apache.commons.lang3.StringUtils;
import org.dhatim.fastexcel.reader.ReadableWorkbook;
import org.dhatim.fastexcel.reader.Row;
import org.dhatim.fastexcel.reader.Sheet;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.jpa.datatables.mapping.DataTablesInput;
import org.springframework.data.jpa.datatables.mapping.DataTablesOutput;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.ParseException;
import java.util.*;
import java.util.stream.Collectors;
import java.util.stream.Stream;

@Log
@Controller
@RequestMapping("/product")
public class ProductController {
	@Autowired
	CategoryService categoryService;

	@Autowired
	ContactService contactService;

	@Autowired
	ProductService productService;

	@Value("${DOCUMENT_LOCATION}")
	private String DOCUMENT_LOCATION;
	long totalRow=0;
	String rowNumber = "";

	@RequestMapping(value = { "", "/" })
	public ModelAndView Listpage(HttpSession session) {

		ModelAndView view = new ModelAndView("product/product");
		view.addObject("categoryList",categoryService.findByCompanyIdAndIsDeleted(Long.parseLong(session.getAttribute("companyId").toString()),0));

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

		totallength = productService.countOfProductDatatable(serachValue, companyId, 0);

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
		jsonMainObject.put("data", productService.findproductData(Long.parseLong(session. getAttribute("companyId").toString()),serachValue,length, offset));
		jsonMainObject.put("meta", jsonMataObject);
		return jsonMainObject;
	}

   //loyalty reset points api


	@PostMapping("/saveproduct")
	@ResponseBody
	public ModelAndView saveProduct(@ModelAttribute("product")ProductVo productVo, HttpSession session,@RequestParam("uploadFiles") MultipartFile[] uploadFiles) {
		ModelAndView view = new ModelAndView();
		view.setViewName("redirect:/product");
		productVo.setAlterBy(Long.parseLong(session.getAttribute("userId").toString()));
		productVo.setCreatedBy(Long.parseLong(session.getAttribute("userId").toString()));
		productVo.setCompanyId(Long.parseLong(session.getAttribute("companyId").toString()));
		productVo.setBranchId(Long.parseLong(session.getAttribute("branchId").toString()));

		if(productVo.getProductDocVos()!=null) {
			productVo.getProductDocVos().removeIf(x -> x.getFileName() == null);
			productVo.getProductDocVos().forEach(doc -> {
				doc.setProductVo(productVo);
				log.info("uploadFiles: " + uploadFiles.length);
				for (MultipartFile document : uploadFiles) {
					String filename = document.getOriginalFilename();
					if (doc.getFileName().equals(filename)) {
						String fileNameWithOutExt = document.getOriginalFilename().replaceFirst("[.][^.]+$", "");
						try {
							if (document != null && document.getSize() > 0) {
								String fileExtension = "", filePath = "";
								Calendar cal = Calendar.getInstance();

								fileExtension = getFileExtension(document);
								log.info("not ext:"+fileNameWithOutExt);
								log.info("time:"+cal.getTimeInMillis() );
								log.info("ext:"+fileExtension);
								filename = fileNameWithOutExt + cal.getTimeInMillis()+"." + fileExtension;
								filePath = DOCUMENT_LOCATION;

								document.transferTo(new File(filePath + filename));
								log.info(filePath);
								log.info(doc.getRemark());
								doc.setFileName(filename);
								doc.setFilePath(filePath);
							}
						} catch (IOException e) {
							throw new RuntimeException(e);
						}

					}
				}
			});
		}

		productService.saveProduct(productVo);
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
		ProductVo productVo =productService.findByProductId(id,Long.parseLong(session.getAttribute("companyId").toString()));
		if(productVo!=null) {
			productVo.setIsDeleted(1);
			productService.saveProduct(productVo);
			return true;
		}else{
			return false;
		}
	}

	@RequestMapping("/getdata/{id}")
	@ResponseBody
	public ProductVo productData(HttpSession session, @PathVariable("id") long id) {
		ProductVo productVo= productService.findByProductId(id, Long.parseLong(session.getAttribute("companyId").toString()));
		return productVo;
	}

}
