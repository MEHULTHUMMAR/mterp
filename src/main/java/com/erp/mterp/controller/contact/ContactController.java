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
	
	long totalRow=0;
	String rowNumber = "";

	@RequestMapping(value = { "", "/" })
	public ModelAndView Listpage(HttpSession session) {

		ModelAndView view = new ModelAndView("contact/contact");

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
	
	@PostMapping("/adjust/{contactId}")
	@ResponseBody
	public ApiResponse adjustPoints(@PathVariable long contactId,@RequestParam(required = false) double inPoints,@RequestParam(required = false) double outPoints,HttpSession session) {
		long comapanyId=Long.parseLong( session.getAttribute("companyId").toString());
		try {
			log.info(contactId+"contactId");
			log.info("points"+inPoints+"po"+outPoints);
			int res=contactService.adjustPoints(contactId,inPoints,outPoints,comapanyId,Constant.POINTDESCRIPTION);
			return new ApiResponse(true,"adjust points",null,res);
		}catch(Exception ex) {
			ex.printStackTrace();
			return new ApiResponse(false, "not adjust points", null, ex);
		}
	}
	
	@DeleteMapping("/resetPoints")
	@ResponseBody
	public ApiResponse deleteByContactIdAndCompanyId(@RequestParam String contactIds,HttpSession session) {
		long companyId=Long.parseLong( session.getAttribute("companyId").toString());
		if (StringUtils.isNotBlank(contactIds)) {
			List<Long> contactId = new ArrayList<>();
			contactId.add(0L);
			try {
				contactId = Arrays.asList(contactIds.split(",")).stream().map(Long::parseLong).collect(Collectors.toList());
				contactService.deleteByContactIdAndCompanyId(contactId, companyId);
				return new ApiResponse(true,"delete points",null);
			}catch(Exception ex) {
				ex.printStackTrace();
				return new ApiResponse(false, "not delete points", ex);
			}
		}else {
			return new ApiResponse(false, "No contactIds found", null);
		}
		
	}

	@PostMapping(value = "/check/excel")
	@ResponseBody
	public CustomerUploadSheetFinalDTO ImportCustomer(@RequestParam("excelFile") MultipartFile file,
			HttpSession session, HttpServletRequest request, HttpServletResponse response) throws IOException {
		FileValidationResponse fileValidationResponse = securityValidation.validateFile(file, Constant.FILE_EXCEL);
		if (!fileValidationResponse.isValid()) {
			List<CustomerLoyaltyWrongSheetDTO> wrongSheetDTO = new ArrayList<CustomerLoyaltyWrongSheetDTO>();
			return new CustomerUploadSheetFinalDTO(wrongSheetDTO, Integer.parseInt("" + 0), wrongSheetDTO.size(),
					fileValidationResponse.getMessage(), false);
		} else {
			File fb = ImageResize.convert(file);
			// System.out.println(fb.getName());
			// System.out.println(fb.getAbsolutePath());
			String filepath = fb.getAbsolutePath();
			session.setAttribute("filepath", filepath);
			return checkSheet(request, response, session, Constant.CONTACT_CUSTOMER);
		}
	}

	public CustomerUploadSheetFinalDTO checkSheet(HttpServletRequest request, HttpServletResponse response,
			HttpSession session, String type) throws IOException {
		String name = "";
		boolean result = true;

		String filepath = (String) session.getAttribute("filepath");
		File fb = new File(filepath);
		InputStream in = new FileInputStream(fb);
		// Create Workbook instance holding reference to .xlsx file
		ReadableWorkbook workbook = new ReadableWorkbook(in);
	        Sheet sheet = workbook.getFirstSheet();

		try(Stream<Row> rows = sheet.openStream()){
			var rowIterator = rows.iterator();
			List<Row> row2 = sheet.read(); 
	        long rowTotal = row2.size();
	        totalRow=rowTotal;
	        System.err.println("rowTotal"+rowTotal);
	        Row row1 = rowIterator.next();

		List<CustomerLoyaltyWrongSheetDTO> wrongSheetDTO = new ArrayList<CustomerLoyaltyWrongSheetDTO>();

		if (rowTotal == 0) {
			result = false;
			rowNumber = "";
			rowNumber = "Please enter data in the sheet";
			return new CustomerUploadSheetFinalDTO(wrongSheetDTO, Integer.parseInt("" + rowTotal), wrongSheetDTO.size(),
					"Please enter data in the sheet", false);
		}
		if (row1.getCell(Constant.SHEETNAME) != null
				&& row1.getCell(Constant.SHEETNAME).getText().trim() != "") {
			if (type.equals(Constant.CONTACT_CUSTOMER)) {
				if (!row1.getCell(Constant.SHEETNAME).getText().trim().equals("Customer Name")) {
					result = false;
					rowNumber += "column Not find Wrong Sheet";
					return new CustomerUploadSheetFinalDTO(wrongSheetDTO, Integer.parseInt("" + rowTotal),
							wrongSheetDTO.size(), "column Not find Wrong Sheet", false);
				}
			}

		} else {
			result = false;
			rowNumber += "column Not find Wrong Sheet";
			return new CustomerUploadSheetFinalDTO(wrongSheetDTO, Integer.parseInt("" + rowTotal), wrongSheetDTO.size(),
					"column Not find Wrong Sheet", false);
		}

		if (result == true) {
			int i = 2;
			while (rowIterator.hasNext()) {
				Boolean checkIssue = false;
				String reason = "";
				Row row = rowIterator.next();
				

					try {
						if (row.getCell(Constant.SHEETNAME) != null) {
							if (row.getCell(Constant.SHEETNAME).getText().trim().length() < 51) {
								if (RegexTest.validateFirstName(
										row.getCell(Constant.SHEETNAME).getText().trim())) {
								} else {
									result = false;
									rowNumber += "(" + i + ",A)-";
									checkIssue = true;
									reason += "(The name can only consist of alphabetical, number and underscore)-";
								}
							} else {
								result = false;
								rowNumber += "(" + i + ",A)-";
								checkIssue = true;
								reason += "(The name must be less than 50 characters long)-";
							}
						} else {
							if (type.equalsIgnoreCase(Constant.CONTACT_CUSTOMER)) {
								checkIssue = true;
								reason += "(First Name Required)-";
								result = false;
								rowNumber += "(" + i + ",A)-";
							}
						}
					} catch (Exception e) {
						e.printStackTrace();
					}

					try {
						if (row.getCell(Constant.SHEETMOBILENO) != null
								&& row.getCell(Constant.SHEETMOBILENO).getText().trim() != "") {
							if (row.getCell(Constant.SHEETMOBILENO).getText().trim().length() >= 10
									&& row.getCell(Constant.SHEETMOBILENO).getText().trim().length() <= 15) {
								if (RegexTest.validateMobile(
										row.getCell(Constant.SHEETMOBILENO).getText().trim())) {
								} else {
									log.info("mobile "
											+ row.getCell(Constant.SHEETMOBILENO).getText().trim());
									result = false;
									rowNumber += "(" + i + ",B)-";
									checkIssue = true;
									reason += "(The mobile no can only consist of number)-";
								}
							} else {
								result = false;
								rowNumber += "(" + i + ",B)-";
								checkIssue = true;
								reason += "(The mobile no must be between 10-15 digits .)-";
							}
						}

					} catch (Exception e) {
						e.printStackTrace();
					}

					try {
						if (row.getCell(Constant.SHEETEMAIL) != null
								&& row.getCell(Constant.SHEETEMAIL).getText().trim() != "") {
							if (RegexTest.validateEmail(row.getCell(Constant.SHEETEMAIL).getText().trim())) {
							} else {
								result = false;
								rowNumber += "(" + i + ",C)-";
								checkIssue = true;
								reason += "(email address is not a valid)-";
							}
						}

					} catch (Exception e) {
						e.printStackTrace();
					}
					try {
						if (row.getCell(Constant.SHEETPOINTS) != null
								&& row.getCell(Constant.SHEETPOINTS).getText().trim() != "") {
						} else {
							result = false;
							rowNumber += "(" + i + ",D)-";
							checkIssue = true;
							reason += "( Points is not a valid)-";

						}

					} catch (Exception e) {
						e.printStackTrace();
					}

					System.out.println("Row No= " + (row.getRowNum() + 1));
					if (checkIssue) {
						int actualIndex = row.getRowNum()-1;
						wrongSheetDTO.add(new CustomerLoyaltyWrongSheetDTO(reason,actualIndex, actualIndex));
					}
					i++;

			}
		}
		workbook.close();
		in.close();
		
		session.setAttribute("Wrongsheet", wrongSheetDTO);
		System.out.println("Final Result----------->" + result);
		return new CustomerUploadSheetFinalDTO(wrongSheetDTO, Integer.parseInt("" + rowTotal), wrongSheetDTO.size(),
				"All Data Not Valid", true);
	}
	}
	@RequestMapping(value = "/upload/excel/{flag}")
	@ResponseBody
	public String ImportContactToDB(HttpSession session, HttpServletRequest request, HttpServletResponse response,
			@PathVariable("flag") int flag) throws IOException, ParseException {
		return contactService.ImportContactToDB(flag, session, request);
	}

}
