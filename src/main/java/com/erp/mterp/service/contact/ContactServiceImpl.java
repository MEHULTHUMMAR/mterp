package com.erp.mterp.service.contact;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.Instant;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.stream.Collectors;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;
import javax.validation.Valid;

import com.erp.mterp.dto.contact.ContactManageDTO;
import com.erp.mterp.vo.contact.ContactTransactionVo;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.datatables.mapping.DataTablesInput;
import org.springframework.data.jpa.datatables.mapping.DataTablesOutput;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import com.erp.mterp.config.SecurityValidation;
import com.erp.mterp.constant.Constant;
import com.erp.mterp.dto.CustomerLoyaltyWrongSheetDTO;
import com.erp.mterp.dto.contact.ContactCustomDatatableDTO;
import com.erp.mterp.dto.pointledger.PointLedgerDTO;
import com.erp.mterp.repository.contact.ContactManageRepository;
import com.erp.mterp.repository.contact.ContactRepository;
import com.erp.mterp.repository.contact.ContactTransactionItemRepository;
import com.erp.mterp.repository.contact.ContactTransactionRepository;
import com.erp.mterp.repository.transaction.TransactionRepository;
import com.erp.mterp.service.transaction.TransactionService;
import com.erp.mterp.vo.contact.ContactManageVo;
import com.erp.mterp.vo.contact.ContactVo;
import com.erp.mterp.vo.transaction.PointTransactionVo;

@Service
public class ContactServiceImpl implements ContactService {
	@Autowired
	ContactRepository contactRepository;
	
	@Autowired
	ContactManageRepository contactManageRepository;
	
	@Autowired
	TransactionService transactionService;
	
	@Autowired
	ContactTransactionRepository contactTransactionRepository;
	
	@Autowired
	ContactTransactionItemRepository contactTransactionItemRepository;
	
	@Autowired
	TransactionRepository transactionRepository;

    @PersistenceContext
    EntityManager entityManager;
    
    @Autowired
    SecurityValidation securityValidation;
    
	@Override
	public boolean existsByMobNo(String mobileNumber) {
		// TODO Auto-generated method stub
		return contactRepository.existsByMobNo(mobileNumber);
	}

	@Override
	public ContactManageVo findByContactWithMobileNumberAndCompanyId(String mobileNumber, long l) {
		// TODO Auto-generated method stub
		return contactManageRepository.findByContactWithMobileNumberAndCompanyId(mobileNumber,l);
	}

	@Override
	public ContactVo saveContact(ContactVo contactVo) {
		// TODO Auto-generated method stub
		return contactRepository.save(contactVo);
	}

	@Override
	public ContactVo findByMobNo(String mobileNumber) {
		// TODO Auto-generated method stub
		return contactRepository.findByMobNo(mobileNumber);
	}

	@Override
	public void savemanageVo(ContactManageVo contactManageVo) {
		// TODO Auto-generated method stub
		contactManageRepository.save(contactManageVo);
	}

	@Override
	@Transactional
	public ContactManageVo findByMobNoAndCompanyId(String mobileNumber, long companyId) {
		boolean isavailable=contactRepository.existsByMobNo(mobileNumber);
    	if(isavailable) {
    		ContactManageVo manageVo=contactManageRepository.findByContactWithMobileNumberAndCompanyId(mobileNumber,companyId);
    		if(manageVo==null) {
        		ContactVo contactVo=contactRepository.findByMobNo(mobileNumber);
        		ContactManageVo contactManageVo=new ContactManageVo();
        		contactManageVo.setContactVo(contactVo);
        		contactManageVo.setCompanyId(companyId);
        		contactManageVo=contactManageRepository.saveAndFlush(contactManageVo);
        		entityManager.refresh(contactManageVo);
        		return contactManageVo;
        	}else {
    			return manageVo;
    		}
    	}else {
    		ContactVo contactVo=new ContactVo();
    		contactVo.setAlterBy(companyId);
    		contactVo.setCreatedBy(companyId);
    		contactVo.setMobNo(mobileNumber);
    		contactRepository.save(contactVo);
    		
    		ContactManageVo contactManageVo=new ContactManageVo();
    		contactManageVo.setContactVo(contactVo);
    		contactManageVo.setCompanyId(companyId);
    		contactManageVo=contactManageRepository.saveAndFlush(contactManageVo);
    		entityManager.refresh(contactManageVo);
    		return contactManageVo;
    	}
	}

	@Override
	public void deleteTransaction(long contactId, long companyId, String transactionId) {
		// TODO Auto-generated method stub
		transactionRepository.deleteTransaction(contactId,companyId,transactionId);
		contactTransactionItemRepository.deleteTransaction(contactId,companyId,transactionId);
		contactTransactionRepository.deleteTransaction(contactId,companyId,transactionId);
	}

	@Override
	public DataTablesOutput<ContactManageVo> findAll(@Valid DataTablesInput input, Object object,
			Specification<ContactManageVo> specification) {
		// TODO Auto-generated method stub
		return contactManageRepository.findAll(input,null,specification);
	}

	@Override
	public double findPointsByContactWithMobileNumberAndCompanyId(String mobileNumber, long companyId) {
		
		Double point = contactManageRepository.findPointsByContactWithMobileNumberAndCompanyId(mobileNumber,companyId);
		if(point==null) {
			return 0;
		}else {
			return point;
		}
	}

	@Override
	public long findByMobileNo(String mobile) {
		// TODO Auto-generated method stub
		return contactRepository.findByMobileNo(mobile);
	}

	@Override
	public Integer countOfContactVoDatatable(String serachValue, long companyId, int isDeleted) {
		return contactManageRepository.countOfContactManageVoDatatable(serachValue, companyId, isDeleted);
	}

	@Override
	public List<ContactCustomDatatableDTO> getContactVoCustomDatatableBy(String serachValue, long companyId, int isDeleted,
			int length, int offset) {
		return contactManageRepository.getContactManageCustomDatatableBy(serachValue, companyId, isDeleted,
				length, offset);
	}
	
	@Override
	public Integer adjustPoints(long contactId,double inPoints,double outPoints,long companyId,String description) {
	
		   PointTransactionVo pointTransactionVo=new PointTransactionVo();
		   pointTransactionVo.setCompanyId(companyId);
		   pointTransactionVo.setContactId(contactId);
		   pointTransactionVo.setDescription(description);
		   pointTransactionVo.setInPoint(inPoints);
		   pointTransactionVo.setOutPoint(outPoints);
		   transactionService.save(pointTransactionVo);
		   System.out.println(contactId+"contactid::::");
		   System.out.println(inPoints+"contactid::::");
		   System.out.println(outPoints+"contactid::::");

			return 1;
	}
	
	@Override
	 public void deleteByContactIdAndCompanyId(List<Long> contactId, long companyId) {
		contactManageRepository.deleteByContactIdAndCompanyId(contactId, companyId);
	}
	@Override
	public List<PointLedgerDTO>getAllTransactions(String serachValue,long contactId,int length,int offset){
		return contactManageRepository.getAllTransactions(serachValue, contactId, length, offset);
	}
	@Override
	public int countOfPointtransactionVoDatatable(String serachValue, long contactId) {
		return contactManageRepository.countOfPointtransactionVoDatatable(serachValue, contactId);
	
	}
	@Override
	 public String ImportContactToDB(int flag,HttpSession session, HttpServletRequest request) throws IOException {

		// if (MenuPermission.havePermission(session, type, Constant.INSERT) == 1) {
		List<ContactVo> contactVos = new ArrayList<ContactVo>();
		long companyId = Long.parseLong(session.getAttribute("companyId").toString());
		 String tmpdir = System.getProperty("java.io.tmpdir");
		// List<Map<String, String>> list = new ArrayList<Map<String,String>>();
		// List<ProductVarientsVo> list = new ArrayList<ProductVarientsVo>();
		String filepath = (String) session.getAttribute("filepath");
		File fb = new File(filepath);
        InputStream in = new FileInputStream(fb);
        List<CustomerLoyaltyWrongSheetDTO> wrongSheetDTO = (List<CustomerLoyaltyWrongSheetDTO>) session.getAttribute("Wrongsheet");
		String[] columns1 = { "Customer Name", "Contact No", "Email", "Points","Reason"};//5
		Workbook workbooksheet =  new XSSFWorkbook();
		Instant instant = Instant.now();
		String filename = "Bug_Loyalty(" + session.getAttribute("companyId").toString() + ")"+instant.getEpochSecond();
		File destination = new File(tmpdir + "/" + filename);
	    FileOutputStream fos = new FileOutputStream(destination);
        Sheet sheetwrong = workbooksheet.createSheet(filename);    
        Font headerFont = workbooksheet.createFont();
        headerFont.setBold(true);
        headerFont.setFontHeightInPoints((short) 14);
        headerFont.setColor(IndexedColors.RED.getIndex());
        CellStyle headerCellStyle = workbooksheet.createCellStyle();
        headerCellStyle.setFont(headerFont);
		int endrowNo = columns1.length-1;
		Row headerRow = sheetwrong.createRow(0);              
    	for (int i = 0; i < columns1.length; i++) {
    		Cell cell = headerRow.createCell(i);
            cell.setCellValue(columns1[i]);
            cell.setCellStyle(headerCellStyle);
        }

		int rowNumWrong = 1;
		XSSFWorkbook workbook = new XSSFWorkbook(in);
		// Get first/desired sheet from the workbook
		XSSFSheet sheet = workbook.getSheetAt(0);
		List<Integer> wrongno = new ArrayList<Integer>();
		if (wrongSheetDTO != null) {
			wrongno = wrongSheetDTO.stream().map(CustomerLoyaltyWrongSheetDTO::getRowno).collect(Collectors.toList());
		}
		// Iterate through each rows one by one
		Iterator<Row> rowIterator = sheet.iterator();
        rowIterator.next();
		while (rowIterator.hasNext()) {
			Row row = rowIterator.next();
				if (flag==1) {
					boolean exist = wrongno.contains(row.getRowNum()) ? true : false;
					if (exist) {
						Row rowwrong = sheetwrong.createRow(rowNumWrong++);
						Iterator<Cell> cellIterator = row.cellIterator();
						for (int i = 0; i <= 4; i++) {
							Cell oldCell = row.getCell(i);
							 Cell newCell = rowwrong.createCell(i);
							if(i==endrowNo) {
								for (int j = 0; j < wrongSheetDTO.size();j++) {
									if(row.getRowNum()==wrongSheetDTO.get(j).getRowno()) {
										
                                         newCell.setCellValue(wrongSheetDTO.get(j).getReason());
									}
								}
										
							}
							
							if (oldCell == null) {
								newCell = null;
								continue;
							}
							if (i != endrowNo) {
								newCell.setCellType(oldCell.getCellType());
								switch (oldCell.getCellType()) {
								case Cell.CELL_TYPE_BLANK:
									break;
								case Cell.CELL_TYPE_BOOLEAN:
									newCell.setCellValue(oldCell.getBooleanCellValue());
									break;
								case Cell.CELL_TYPE_ERROR:
									newCell.setCellErrorValue(oldCell.getErrorCellValue());
									break;
								case Cell.CELL_TYPE_FORMULA:
									newCell.setCellFormula(oldCell.getCellFormula());
									break;
								case Cell.CELL_TYPE_NUMERIC:
									newCell.setCellValue(oldCell.getNumericCellValue());
									break;
								case Cell.CELL_TYPE_STRING:
									newCell.setCellValue(oldCell.getRichStringCellValue());
									break;
								}
							}

						}
						continue;
					}
				}
				Iterator<Cell> cellIterator = row.cellIterator();

				  while (cellIterator.hasNext()) {
	                    Cell cell = cellIterator.next();
	                    cell.setCellType(Cell.CELL_TYPE_STRING);
	                    switch (cell.getCellType()) {
	                        case Cell.CELL_TYPE_BOOLEAN:
	                            System.out.println("boolean===>>>" + cell.getBooleanCellValue() + "\t");
	                            break;
	                        case Cell.CELL_TYPE_NUMERIC:
	                            break;
	                        case Cell.CELL_TYPE_STRING:
	                            break;
	                    }
	                }
				DateFormat dateFormat = new SimpleDateFormat("YYYY-MM-DD");
				ContactVo contactVo = new ContactVo();
				long contactId = contactVo.getContactId();
				boolean isAvailable = false;
				if (row.getCell(Constant.SHEETMOBILENO) != null
						&& row.getCell(Constant.SHEETMOBILENO).getStringCellValue().trim() != ""
						&& row.getCell(Constant.SHEETMOBILENO).getStringCellValue().trim() != null) {
					// log.info("data not
					// found"+row.getCell(Constant.SHEETMOBILENO).getStringCellValue().trim());
					ContactVo contactVo2 = findByMobNo(row.getCell(Constant.SHEETMOBILENO).getStringCellValue().trim());
					if (contactVo2 != null) {
						contactVo = contactVo2;
						isAvailable = true;
					} 

				}

				contactVo.setAlterBy(companyId);
				contactVo.setCreatedBy(companyId);

				if (row.getCell(Constant.SHEETNAME) != null
						&& row.getCell(Constant.SHEETNAME).getStringCellValue().trim() != "") {
					contactVo.setName(securityValidation.checkAndReplaceCsvInjectionCharacters(
							row.getCell(Constant.SHEETNAME).getStringCellValue().trim()));
				} else {
					contactVo.setName("");
				}

				if (row.getCell(Constant.SHEETMOBILENO) != null
						&& row.getCell(Constant.SHEETMOBILENO).getStringCellValue().trim()!= "") {
					contactVo.setMobNo(securityValidation.checkAndReplaceCsvInjectionCharacters(
							row.getCell(Constant.SHEETMOBILENO).getStringCellValue().trim()));
				}

				if (row.getCell(Constant.SHEETEMAIL) != null
						&& row.getCell(Constant.SHEETEMAIL).getStringCellValue().trim()!= "") {
					contactVo.setEmail(securityValidation.checkAndReplaceCsvInjectionCharacters(
							row.getCell(Constant.SHEETEMAIL).getStringCellValue().trim()));
				} else {
					contactVo.setEmail(securityValidation.checkAndReplaceCsvInjectionCharacters(""));
				}
				double points = 0.0;
				try {

					if (row.getCell(Constant.SHEETPOINTS) != null
							&& row.getCell(Constant.SHEETPOINTS).getStringCellValue().trim()!= "") {

						points = Double.parseDouble(securityValidation.checkAndReplaceCsvInjectionCharacters(
								row.getCell(Constant.SHEETPOINTS).getStringCellValue().trim()));
						// contactVo.(securityValidation.checkAndReplaceCsvInjectionCharacters(row.getCell(Constant.SHEETPOINTS).getStringCellValue().trim()));
					} else {
						// contactVo.(securityValidation.checkAndReplaceCsvInjectionCharacters(""));
						points = 0.0;
					}
				} catch (Exception e) {
					points = 0.0;
				}

				ContactVo contactNew = contactRepository.save(contactVo);

				if (isAvailable) {
					int res = adjustPoints(contactNew.getContactId(), points, 0, companyId,
							Constant.SETUP_OPENING_POINT_DESCRIPTION);

				} else {
					// create contact Manager an Save
					ContactManageVo contactManageVo = new ContactManageVo();
					contactManageVo.setContactVo(contactNew);
					contactManageVo.setCompanyId(Long.parseLong(session.getAttribute("companyId").toString()));
					contactManageVo.setPoints(points);
					savemanageVo(contactManageVo);

				}
				contactVos.add(contactVo);

		}

		in.close();
		workbooksheet.write(fos);
        fos.close();
		String filepath1 = "";
		if (flag == 1) {
			FileOutputStream fileOut = new FileOutputStream(request.getServletContext().getRealPath("/") + "pospdf" + System.getProperty("file.separator")+filename+".xlsx");
			workbooksheet.write(fileOut);
			System.out.println("Excel complete-----");
			String filePathToBeServed = request.getServletContext().getRealPath("/") + "pospdf"
					+ System.getProperty("file.separator") + filename + ".xlsx"; // complete file name with path;
			filepath1 = filename + ".xlsx";
			File fileToDownload = new File(filePathToBeServed);
			InputStream inputStream = new FileInputStream(fileToDownload);
			inputStream.close();
			fileOut.close();
			workbooksheet.close();
			//workbooksheet.close();
		}

		return "{ \"valid\": true,\"path\":\"" + filepath1 + "\" }";
	   

	
		
	}

	@Override
	public ContactManageDTO findByMobNoAndCompanyIdDTO(String mobileNumber, long companyId) {
		boolean isavailable=contactRepository.existsByMobNo(mobileNumber);
		if(isavailable) {
			ContactManageDTO manageVo=contactManageRepository.findByContactWithMobileNumberAndCompanyIdDTO(mobileNumber,companyId);
			if(manageVo==null) {
				Long contactid=contactRepository.findByMobileNo(mobileNumber);
				ContactManageVo contactManageVo=new ContactManageVo();
				ContactVo contactVo=new ContactVo();
				contactVo.setContactId(contactid);
				contactManageVo.setContactVo(contactVo);
				contactManageVo.setCompanyId(companyId);
				contactManageRepository.save(contactManageVo);

				return contactManageRepository.getDTOForContactManageDTO(contactManageVo.getContactManageId(),contactid);
			}else {
				return manageVo;
			}
		}else {
			ContactVo contactVo=new ContactVo();
			contactVo.setAlterBy(companyId);
			contactVo.setCreatedBy(companyId);
			contactVo.setMobNo(mobileNumber);
			contactRepository.save(contactVo);

			ContactManageVo contactManageVo=new ContactManageVo();
			contactManageVo.setContactVo(contactVo);
			contactManageVo.setCompanyId(companyId);
			contactManageRepository.save(contactManageVo);

			return contactManageRepository.getDTOForContactManageDTO(contactManageVo.getContactManageId(),contactVo.getContactId());
		}

	}

	@Override
	public void updateNameAndEmail(String name, String email, Long contactId) {
		contactRepository.updateNameAndEmail(name,email,contactId);
	}

	@Override
	public void updateAnniversary(Long contactId, Date anniversary) {
		contactRepository.updateAnniversary(contactId,anniversary);
	}

	@Override
	public void updateDob(Long contactId, Date dob) {
		contactRepository.updateDob(contactId,dob);
	}

	@Override
	public void savetransaction(ContactTransactionVo transactionVo) {
		contactTransactionRepository.save(transactionVo);
	}


}
