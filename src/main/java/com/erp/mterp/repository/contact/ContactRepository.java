package com.erp.mterp.repository.contact;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.erp.mterp.vo.contact.ContactVo;

import javax.transaction.Transactional;
import java.util.Date;

@Repository
public interface ContactRepository extends JpaRepository<ContactVo, Long> {

	
	boolean existsByMobNo(String mobileNumbe);

	ContactVo findByMobNo(String mobile);

	@Query(value="Select COALESCE(contact_id,0) from contact where contact.mob_no=?1",nativeQuery = true)
	long findByMobileNo(String mobile);


	@Query(value = "update contact set name=?1,email=?2 where contact_id=?3",nativeQuery = true)
	@Modifying
	@Transactional
	void updateNameAndEmail(String name, String email, Long contactId);

	@Query(value = "update contact set anniversary_date=?2where contact_id=?1",nativeQuery = true)
	@Modifying
	@Transactional
	void updateAnniversary(Long contactId, Date anniversary);

	@Query(value = "update contact set date_of_birth=?2 where contact_id=?1",nativeQuery = true)
	@Modifying
	@Transactional
	void updateDob(Long contactId, Date dob);
}
