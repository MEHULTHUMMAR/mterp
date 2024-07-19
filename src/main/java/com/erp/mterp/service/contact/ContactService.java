package com.erp.mterp.service.contact;

import com.erp.mterp.dto.contact.ContactCustomDatatableDTO;
import com.erp.mterp.vo.contact.ContactAddressVo;
import com.erp.mterp.vo.contact.ContactVo;

import java.util.List;
import java.util.Map;

public interface ContactService {
//Contact
	boolean existsByMobNo(String mobileNumber);

	ContactVo saveContact(ContactVo contactVo);

	ContactVo findByMobNo(String mobileNumber);
	
	long findByMobileNo(String mobile);

	void updateNameAndEmail(String name, String email, Long contactId);


	ContactVo findBycontactId(long id, long companyId);

	List<ContactVo> findByCompanyIdAndIsDeleted(long companyId, int i);

	List<Map<String, String>> findAddressDetails(long id, long branchId);

    ContactAddressVo findByContactAddressId(long contactAddressId);

    void updateAddress(List<Long> l);

	void updateAllAdress(Long id);

	void updateDefaultAddress(Long addressId);

	Integer countOfContactVoDatatable(String serachValue, long branchId, int i);

	List<ContactCustomDatatableDTO> getContactVoCustomDatatableBy(String serachValue, long branchId, int i, int length, int offset);
}
