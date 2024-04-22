package com.erp.mterp.service.contact;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import com.erp.mterp.dto.contact.ContactManageDTO;
import com.erp.mterp.vo.contact.ContactTransactionVo;
import org.springframework.data.jpa.datatables.mapping.DataTablesInput;
import org.springframework.data.jpa.datatables.mapping.DataTablesOutput;
import org.springframework.data.jpa.domain.Specification;

import com.erp.mterp.dto.contact.ContactCustomDatatableDTO;
import com.erp.mterp.dto.pointledger.PointLedgerDTO;
import com.erp.mterp.vo.contact.ContactManageVo;
import com.erp.mterp.vo.contact.ContactVo;

public interface ContactService {
//Contact
	boolean existsByMobNo(String mobileNumber);

	ContactVo saveContact(ContactVo contactVo);

	ContactVo findByMobNo(String mobileNumber);
	
	long findByMobileNo(String mobile);
//Contact Manage
	ContactManageVo findByContactWithMobileNumberAndCompanyId(String mobileNumber, long companyId);
	double findPointsByContactWithMobileNumberAndCompanyId(String mobileNumber, long companyId);
	void savemanageVo(ContactManageVo contactManageVo);

	ContactManageVo findByMobNoAndCompanyId(String mobile, long companyId);

	void deleteTransaction(long contactId, long companyId, String transactionId);

	DataTablesOutput<ContactManageVo> findAll(@Valid DataTablesInput input, Object object,
			Specification<ContactManageVo> specification);

	Integer countOfContactVoDatatable(String serachValue, long companyId, int i);

	List<ContactCustomDatatableDTO> getContactVoCustomDatatableBy(String serachValue, long companyId, int i, int length,
			int offset);
     
//	Integer resetPoints(long contactId);
	Integer adjustPoints(long contactId,double inPoints,double outPoints,long companyId,String description );
	
//	delete the transaction of specific contactid
    void deleteByContactIdAndCompanyId(List<Long> contactId, long companyId);
  //get transaction details 
    List<PointLedgerDTO>getAllTransactions(String serachValue,long contactId,int length,int offset);
    
    //count of transactions
    int countOfPointtransactionVoDatatable(String serachValue, long contactId);
    String ImportContactToDB(int flag,HttpSession session, HttpServletRequest request) throws IOException;

	ContactManageDTO findByMobNoAndCompanyIdDTO(String mobile, long companyId);

	void updateNameAndEmail(String name, String email, Long contactId);

	void updateAnniversary( Long contactId, Date anniversary);
	void updateDob(Long contactId, Date dob);

	void savetransaction(ContactTransactionVo transactionVo);
}
