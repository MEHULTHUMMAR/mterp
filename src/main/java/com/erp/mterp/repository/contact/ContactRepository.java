package com.erp.mterp.repository.contact;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.erp.mterp.vo.contact.ContactVo;

import javax.transaction.Transactional;
import java.util.Date;
import java.util.List;
import java.util.Map;

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

	@Query(value = "select * from contact where contact_id=?1 and company_id=?2",nativeQuery = true)
    ContactVo findByIdAndCompanyId(long id, long companyId);

	@Query(nativeQuery = true, value = "SELECT\n"
			+ "	count(1)\n"
			+ "FROM\n"
			+ "	contact \n"
			+ "WHERE\n"
			+ "		case when :searchValue='' then 1=1 else \n"
			+ "		(LOWER(contact.name) like lower(concat('%',:searchValue,'%')) \n"
			+ "			or LOWER(contact.email) like lower(concat('%',:searchValue,'%')) \n"
			+ "			or LOWER(contact.company_name) like lower(concat('%',:searchValue,'%')) \n"
			+ "			or LOWER(contact.mob_no) like lower(concat('%',:searchValue,'%'))) end\n"
			+ "	AND company_id = :companyId \n"
			+ "	AND is_deleted = :isDeleted")
	Integer countOfContactVoDatatable(@Param("searchValue") String serachValue, @Param("companyId") long companyId, @Param("isDeleted") int isDeleted);

	List<ContactVo> findByCompanyIdAndIsDeleted(long companyId, int i);

	@Query(nativeQuery = true, value = "select\n" +
			"    address,\n" +
			"    pin_code,\n" +
			"    city_name,\n" +
			"    state_name,\n" +
			"    countries_name\n" +
			"from contact\n" +
			"    left join loc_city as city on contact.city_code=city.city_code\n" +
			"    left join loc_countries as countries on contact.countries_code=countries.countries_code\n" +
			"    left join loc_state as state on contact.state_code=state.state_code\n" +
			"where contact_id=?1 and company_id=?2\n")
	Map<String, String> findAddressDetails(long id, long companyId);
}
