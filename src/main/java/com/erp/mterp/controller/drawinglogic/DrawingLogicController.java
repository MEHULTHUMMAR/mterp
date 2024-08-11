package com.erp.mterp.controller.drawinglogic;

import com.erp.mterp.dto.contact.ContactCustomDatatableDTO;
import com.erp.mterp.dto.dl_type.DLTypeCUSTOMDTO;
import com.erp.mterp.dto.dl_type.DLTypeCUSTOMSelectItemDTO;
import com.erp.mterp.service.category.CategoryService;
import com.erp.mterp.service.contact.ContactService;
import com.erp.mterp.service.drawinglogic.DrawingLogicService;
import com.erp.mterp.service.product.ProductService;
import com.erp.mterp.vo.drawinglogic.DrawingLogicDocVo;
import com.erp.mterp.vo.drawinglogic.DrawingLogicTypeVo;
import lombok.extern.java.Log;
import org.apache.commons.lang3.StringUtils;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.data.jpa.datatables.mapping.DataTablesInput;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Map;

@Log
@Controller
@RequestMapping("/drawinglogic")
public class DrawingLogicController {
	@Autowired
	CategoryService categoryService;

	@Autowired
	ContactService contactService;

	@Autowired
	ProductService productService;

	@Autowired
	DrawingLogicService drawingLogicService;

	@Value("${DRAWING_LOGIC_DOCUMENT_LOCATION}")
	private String DRAWING_LOGIC_DOCUMENT_LOCATION;
	long totalRow=0;
	String rowNumber = "";

	@RequestMapping(value = { "", "/" })
	public ModelAndView Listpage(HttpSession session) {

		ModelAndView view = new ModelAndView("drawing-logic-doc/drawing-logic-doc");
		String prefix="DRL";
		view.addObject(	"prefix",prefix);
		view.addObject(	"planingNo",drawingLogicService.findNextDLNo(Long.parseLong(session.getAttribute("companyId").toString()),prefix));
		view.addObject("productList",productService.findProductByCompanyId(Long.parseLong(session.getAttribute("companyId").toString())));

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

		totallength = drawingLogicService.countOfDLDatatable(serachValue, companyId, 0);

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
		jsonMainObject.put("data", drawingLogicService.findDLData(Long.parseLong(session. getAttribute("companyId").toString()),serachValue,length, offset));
		jsonMainObject.put("meta", jsonMataObject);
		return jsonMainObject;
	}

   //loyalty reset points api


	@PostMapping("/savedrawinglogic")
	@ResponseBody
	public String savedrawinglogic(@ModelAttribute("drawingLogicDocVo") DrawingLogicDocVo drawingLogicDocVo, HttpSession session, @RequestParam("docFile") MultipartFile uploadFiles) {
	//	ModelAndView view = new ModelAndView();
	//	view.setViewName("redirect:/product");
		drawingLogicDocVo.setAlterBy(Long.parseLong(session.getAttribute("userId").toString()));
		drawingLogicDocVo.setCreatedBy(Long.parseLong(session.getAttribute("userId").toString()));
		drawingLogicDocVo.setCompanyId(Long.parseLong(session.getAttribute("companyId").toString()));
		drawingLogicDocVo.setBranchId(Long.parseLong(session.getAttribute("branchId").toString()));

		String filename = uploadFiles.getOriginalFilename();
		String fileNameWithOutExt = uploadFiles.getOriginalFilename().replaceFirst("[.][^.]+$", "");
			try {
				if (uploadFiles != null && uploadFiles.getSize() > 0) {
					String fileExtension = "", filePath = "";
					Calendar cal = Calendar.getInstance();

					fileExtension = getFileExtension(uploadFiles);
					log.info("not ext:"+fileNameWithOutExt);
					log.info("time:"+cal.getTimeInMillis() );
					log.info("ext:"+fileExtension);
					filename = fileNameWithOutExt + cal.getTimeInMillis()+"." + fileExtension;
					filePath = DRAWING_LOGIC_DOCUMENT_LOCATION;

					Path uploadPath = Paths.get(filePath);
					if (!Files.exists(uploadPath)) {
						Files.createDirectories(uploadPath);
					}
					uploadFiles.transferTo(new File(filePath + filename));
					drawingLogicDocVo.setFileName(filename);
					drawingLogicDocVo.setFilePath(filePath);
				}
			} catch (IOException e) {
				throw new RuntimeException(e);
			}

		drawingLogicService.savedrawingLogicDoc(drawingLogicDocVo);
		return "true";
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
		DrawingLogicDocVo drawingLogicDocVo=drawingLogicService.findBydrawingLogicDocId(id,Long.parseLong(session.getAttribute("companyId").toString()));
		if(drawingLogicDocVo!=null) {
			drawingLogicDocVo.setIsDeleted(1);
			drawingLogicService.savedrawingLogicDoc(drawingLogicDocVo);
			return true;
		}else{
			return false;
		}
	}

	@RequestMapping("/getbyproduct/{id}/{planingitemid}")
	@ResponseBody
	public List<Map<String,String>>  productData(HttpSession session, @PathVariable("id") long id, @PathVariable("planingitemid") long planingItemId) {
		List<Map<String,String>>  drawingLogicDocVos= drawingLogicService.getdetailsByProductId(id, Long.parseLong(session.getAttribute("companyId").toString()),planingItemId);
		return drawingLogicDocVos;
	}

	@GetMapping("/download")
	public ResponseEntity<Resource> downloadFile(@RequestParam String fileName) {
		Path filePath = Paths.get(DRAWING_LOGIC_DOCUMENT_LOCATION).resolve(fileName);
		Resource resource = new FileSystemResource(filePath.toFile());

		if (resource.exists()) {
			return ResponseEntity.ok()
					.contentType(MediaType.APPLICATION_OCTET_STREAM)
					.header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"" + resource.getFilename() + "\"")
					.body(resource);
		} else {
			return ResponseEntity.notFound().build();
		}
	}


	@PostMapping("/list/type/select/json")
	@ResponseBody
	public DLTypeCUSTOMDTO selectProductForRecipe(@RequestParam Map<String, String> allRequestParams, HttpSession session)
			throws ParseException {


		String searchValue = "";
		if (StringUtils.isNotBlank(allRequestParams.get("q"))) {
			if (!allRequestParams.get("q").toString().equals("")) {
				searchValue = allRequestParams.get("q").toString();
			}
		}
		List<DLTypeCUSTOMSelectItemDTO> productVos = new ArrayList<DLTypeCUSTOMSelectItemDTO>();
		productVos = drawingLogicService.findDLTypeData(searchValue, Long.parseLong(session.getAttribute("companyId").toString()), allRequestParams.get("type"));

		return new DLTypeCUSTOMDTO(productVos.size(), true, productVos);
	}

	@PostMapping("/save/dltype")
	@ResponseBody
	public DrawingLogicTypeVo save_dltype(@RequestParam(value = "dl_name") String dl_name, @RequestParam(value = "dl_code") String dl_code, @RequestParam(value = "dl_type") String dl_type, HttpSession session) {

		DrawingLogicTypeVo dlTypeVo = new DrawingLogicTypeVo();

		dlTypeVo.setDlTypeName(dl_name);
		dlTypeVo.setDlTypeCode(dl_code);
		dlTypeVo.setDlType(dl_type);
		dlTypeVo.setCreatedBy(Long.parseLong(session.getAttribute("userId").toString()));
		dlTypeVo.setBranchId(Long.parseLong(session.getAttribute("branchId").toString()));
		dlTypeVo.setCompanyId(Long.parseLong(session.getAttribute("companyId").toString()));
		dlTypeVo.setAlterBy(Long.parseLong(session.getAttribute("userId").toString()));
		drawingLogicService.savedrawingLogicType(dlTypeVo);
		return dlTypeVo;
	}

	@PostMapping("/checkdlcode")
	@ResponseBody
	public Boolean checkdlcode(@RequestParam(defaultValue = "", value = "drawingLogicCode") String drawingLogicCode, @RequestParam(defaultValue = "0", value = "drawingLogicId") long drawingLogicId,HttpSession session) {
		List<DrawingLogicDocVo> b;
//		if (measurementId == 0) {
//			b = uomService.findByUomCodeAndCompanyId(name, Long.parseLong(session.getAttribute("companyId").toString()),merchantTypeId,clusterId);
//		} else {
			b = drawingLogicService.checkDLCode(drawingLogicCode, Long.parseLong(session.getAttribute("companyId").toString()));
//		}
		if (b.isEmpty()) {
			return true;
		} else {
			return false;
		}
	}
}
