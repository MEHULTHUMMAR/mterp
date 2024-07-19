package com.erp.mterp.service.contact;

import com.erp.mterp.config.SecurityValidation;
import com.erp.mterp.dto.contact.ContactCustomDatatableDTO;
import com.erp.mterp.repository.contact.ContactAddressRepository;
import com.erp.mterp.repository.contact.ContactRepository;
import com.erp.mterp.vo.contact.ContactAddressVo;
import com.erp.mterp.vo.contact.ContactVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;
import java.util.List;
import java.util.Map;

@Service
@Transactional
public class ContactServiceImpl implements ContactService {
	@Autowired
	ContactRepository contactRepository;

	@Autowired
	ContactAddressRepository contactAddressRepository;

    @PersistenceContext
    EntityManager entityManager;
    
    @Autowired
    SecurityValidation securityValidation;
    
	@Override
	public boolean existsByMobNo(String mobileNumber) {
		// TODO Auto-generated method stub
		return true;//contactRepository.existsByMobNo(mobileNumber);
	}



	@Override
	public ContactVo saveContact(ContactVo contactVo) {
		// TODO Auto-generated method stub
		return contactRepository.save(contactVo);
	}

	@Override
	public ContactVo findByMobNo(String mobileNumber) {
		// TODO Auto-generated method stub
		return null;//contactRepository.findByMobNo(mobileNumber);
	}

	@Override
	public long findByMobileNo(String mobile) {
		// TODO Auto-generated method stub
		return contactRepository.findByMobileNo(mobile);
	}



	@Override
	public void updateNameAndEmail(String name, String email, Long contactId) {
		contactRepository.updateNameAndEmail(name,email,contactId);
	}

	@Override
	public ContactVo findBycontactId(long id, long companyId) {
		return contactRepository.findByIdAndCompanyId(id,companyId);
	}

	@Override
	public List<ContactVo> findByCompanyIdAndIsDeleted(long companyId, int i) {
		return contactRepository.findByCompanyIdAndIsDeleted(companyId, i) ;
	}

	@Override
	public List<Map<String, String>> findAddressDetails(long id, long branchId) {
		return contactRepository.findAddressDetails(id,  branchId);
	}

	@Override
	public ContactAddressVo findByContactAddressId(long contactAddressId) {
		return contactAddressRepository.findByContactAddressId(contactAddressId);
	}

	@Override
	public void updateAddress(List<Long> l) {
		contactRepository.updateAddress(l);
	}

	@Override
	public void updateAllAdress(Long id) {
		contactRepository.updateAllAdress(id);
	}

	@Override
	public void updateDefaultAddress(Long addressId) {
		contactRepository.updateDefaultAddress(addressId);
	}

	@Override
	public Integer countOfContactVoDatatable(String serachValue, long branchId, int i) {
		return contactRepository.countOfContactVoDatatable(serachValue,branchId,i);
	}

	@Override
	public List<ContactCustomDatatableDTO> getContactVoCustomDatatableBy(String serachValue, long branchId, int i, int length, int offset) {
		return contactRepository.getContactVoCustomDatatableBy(serachValue, branchId, i, length, offset);
	}


}
