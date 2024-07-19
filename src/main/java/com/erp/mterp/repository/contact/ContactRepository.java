package com.erp.mterp.repository.contact;

import com.erp.mterp.dto.contact.ContactCustomDatatableDTO;
import com.erp.mterp.vo.contact.ContactVo;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Repository
public interface ContactRepository extends JpaRepository<ContactVo, Long> {

	
//	boolean existsByMobNo(String mobileNumbe);

//	ContactVo findByMobNo(String mobile);

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

	@Query(value = "select * from contact where contact_id=?1 and company_id=?2",nativeQuery = true)
    ContactVo findByIdAndCompanyId(long id, long companyId);

	@Query(nativeQuery = true, value = "select count(1) from contact\n" +
			"    inner join public.contact_address ca on contact.contact_id = ca.contact_id and ca.is_default=1\n" +
			"where branch_id=:branchId and contact.is_deleted=:isDeleted and\n" +
			"      (company_name ilike lower(concat('%',:searchValue,'%')) or \n" +
			"    ca.contact_name ilike lower(concat('%',:searchValue,'%')) or ca.mob_no ilike lower(concat('%',:searchValue,'%')))")
	Integer countOfContactVoDatatable(@Param("searchValue") String serachValue, @Param("branchId") long branchId, @Param("isDeleted") int isDeleted);

	List<ContactVo> findByCompanyIdAndIsDeleted(long companyId, int i);

	@Query(nativeQuery = true, value = "select\n" +
			"     ca.contact_address_id,\n" +
			"    ca.contact_name,\n" +
			"    ca.mob_no," +
			"	 ca.address,\n" +
			"    ca.pin_code,\n" +
			"    city_name,\n" +
			"    state_name,\n" +
			"    countries_name,\n" +
			"    is_default\n" +
			"from contact\n" +
			"    left join contact_address as ca on contact.contact_id = ca.contact_id\n" +
			"    left join loc_city as city on ca.city_code=city.city_code\n" +
			"    left join loc_countries as countries on ca.countries_code=countries.countries_code\n" +
			"    left join loc_state as state on ca.state_code=state.state_code\n" +
			"where contact.contact_id=?1 and branch_id=?2 and ca.is_deleted=0 and contact.is_deleted=0\n\n")
	List<Map<String, String>> findAddressDetails(long id, long branchId);

	@Modifying
	@Query("update ContactAddressVo set isDeleted=1 where contactAddressId in (?1)")
    void updateAddress(List<Long> l);

	@Modifying
	@Query("update ContactAddressVo set isDefault=0 where contact.contactId=?1")
	void updateAllAdress(Long id);

	@Modifying
	@Query("update ContactAddressVo set isDefault=1 where contactAddressId=?1")
	void updateDefaultAddress(Long addressId);

	@Query(nativeQuery = true, value = "select contact.contact_id as contactId,company_name as companyName,email, ca.contact_name as contactName,ca.mob_no as mobNo\n" +
			"from contact\n" +
			"left join public.contact_address ca on contact.contact_id = ca.contact_id and ca.is_default=1\n" +
			"where branch_id=:branchId and contact.is_deleted=:isdeleted and\n" +
			"    (company_name ilike lower(concat('%',:searchValue,'%')) or\n" +
			"     ca.contact_name ilike lower(concat('%',:searchValue,'%')) or ca.mob_no ilike lower(concat('%',:searchValue,'%')))\n" +
			" order by public.contact.contact_id desc limit :length offset :offset")
	List<ContactCustomDatatableDTO> getContactVoCustomDatatableBy(@Param("searchValue") String serachValue, @Param("branchId") long branchId,@Param("isdeleted")int isdeleted,
																  @Param("length") int length,@Param("offset")  int offset);
}
