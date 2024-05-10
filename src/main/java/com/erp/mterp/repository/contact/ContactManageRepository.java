package com.erp.mterp.repository.contact;

import java.util.List;

import javax.transaction.Transactional;

import com.erp.mterp.dto.contact.ContactManageDTO;
import org.springframework.data.jpa.datatables.repository.DataTablesRepository;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.erp.mterp.dto.contact.ContactCustomDatatableDTO;
import com.erp.mterp.dto.pointledger.PointLedgerDTO;
import com.erp.mterp.vo.contact.ContactManageVo;

@Repository
public interface ContactManageRepository extends JpaRepository<ContactManageVo, Long> ,DataTablesRepository<ContactManageVo, Long>{

	@Query("from ContactManageVo where contactVo.mobNo=?1 and companyId=?2 ")
	ContactManageVo findByContactWithMobileNumberAndCompanyId(String mobileNumber, long l);

	@Query(nativeQuery = true,value ="select contact_manage.contact_manage_id as  contactManageId,contact.contact_id as  contactId from contact_manage\n" +
			"inner join contact ON contact.contact_id = contact_manage.contact_id\n" +
			"where \n" +
			"contact.mob_no=?1 and company_id=?2")
	ContactManageDTO findByContactWithMobileNumberAndCompanyIdDTO(String mobileNumber, long l);


	@Query(value="Select coalesce(contact_manage.points,0) from contact_manage INNER JOIN contact ON  contact.contact_id=contact_manage.contact_id where contact.mob_no=?1 and contact_manage.company_id=?2 order by contact_manage.contact_manage_id desc limit 1",nativeQuery = true)
	Double findPointsByContactWithMobileNumberAndCompanyId(String mobileNumber, long l);


	@Query(nativeQuery = true, value = "SELECT\n"
			+ "	COALESCE(contact.contact_id,0) as contactId,\n"
			+ "	COALESCE(contact.name,'') as contactName,\n"
			+ "	COALESCE(contact.mob_no,'') as contactMobNo,\n"
			+ "	COALESCE(contact.email,'') as contactEmail,\n"
			+ "	COALESCE(contact.company_name,'') as companyName,\n"
			+ "	COALESCE(contact.address,'') as address,\n"
			+ "	COALESCE(contact.countries_code,'') as countriesCode,\n"
			+ "	COALESCE(contact.state_code,'') as stateCode,\n"
			+ "	COALESCE(contact.city_code,'') as cityCode,\n"
			+ "	COALESCE(contact.pin_code,'') as pincode\n"
			+ "FROM\n"
			+ "	contact \n"
			+ "WHERE\n"
			+ "		case when :searchValue='' then 1=1 else \n"
			+ "		(LOWER(contact.name) like lower(concat('%',:searchValue,'%')) \n"
			+ "			or LOWER(contact.email) like lower(concat('%',:searchValue,'%')) \n"
			+ "			or LOWER(contact.company_name) like lower(concat('%',:searchValue,'%')) \n"
			+ "			or LOWER(contact.mob_no) like lower(concat('%',:searchValue,'%'))) end\n"
			+ "	AND company_id = :companyId \n"
			+ "	AND is_deleted = :isDeleted\n"
			+ "	order by contact_id desc limit :length offset :offset")
	List<ContactCustomDatatableDTO> getContactManageCustomDatatableBy(@Param("searchValue") String serachValue,@Param("companyId") long companyId,@Param("isDeleted") int isDeleted,
			@Param("length") int length,@Param("offset") int offset);

//delete transaction specific
	@Modifying
	@Transactional
	@Query(value="delete from point_transaction\r\n"
			+ "where contact_id in :contactId and company_id = :companyId",nativeQuery = true)
	 void deleteByContactIdAndCompanyId(@Param("contactId") List<Long> contactId,@Param("companyId") long companyId);
	
	//boolean existsByMobNoAndCompanyId(String mobileNumber, long l);

//	@Query("select points from ContactVo where mobNo=?1 and companyId=?2")
//	double findByPointsMobileNoAndCompanyId(String mobileNumber, long l);
//
//	ContactVo findByMobNoAndCompanyId(String mobile, long companyId);
//get all transactions
	@Query(value = "SELECT\r\n"
	        + "    pt.point_transaction_id AS pointTransactionId,\r\n"
	        + "    pt.created_on AS createdOn,\r\n"
	        + "    COALESCE(ct.bill_no,'0') AS billNo,\r\n"
	        + "    pt.in_point AS inPoint,\r\n"
	        + "    pt.out_point AS outPoint,\r\n"
	        + "    COALESCE(pt.description,'') as description,\r\n"
	        + "    COALESCE(c.coupon_id, 0) AS couponId,\r\n"
	        + "    c.coupoun_type AS coupounType\r\n"
	        + "FROM\r\n"
	        + "    point_transaction pt\r\n"
	        + "    LEFT JOIN contact_transaction ct ON ct.contact_transaction_id = pt.contact_transaction_id\r\n"
	        + "    LEFT JOIN coupon c ON c.coupon_id = pt.coupon_id\r\n"
	        + "WHERE\r\n"
	        + "    CASE WHEN :searchValue = '' THEN TRUE ELSE\r\n"
	        + "        (LOWER(ct.bill_no) LIKE LOWER(concat('%', :searchValue, '%')))\r\n"
	        + "    END\r\n"
	        + "    AND pt.contact_id = :contactId\r\n"
	        + "ORDER BY\r\n"
	        + "   pt.point_transaction_id DESC\r\n"
	        + "LIMIT :length OFFSET :offset",nativeQuery = true)
	List<PointLedgerDTO> getAllTransactions(
	        @Param("searchValue") String searchValue,
	        @Param("contactId") long contactId,
	        @Param("length") int length,
	        @Param("offset") int offset);

      @Query(value = "SELECT\r\n"
		+ "	count(point_transaction.point_transaction_id)\r\n"
		+ "FROM\r\n"
		+ "	point_transaction\r\n"
		+ "	LEFT JOIN contact_transaction ON contact_transaction.contact_transaction_id = point_transaction.contact_transaction_id\r\n"
		+ "\r\n"
		+ "WHERE\r\n"
		+ "	CASE WHEN :searchValue='' THEN true ELSE\r\n"
		+ "		(LOWER(contact_transaction.bill_no) LIKE lower(concat('%', :searchValue, '%')))		\r\n"
		+ "	END\r\n"
		+ "	AND point_transaction.contact_id = :contactId", nativeQuery = true)
     Integer countOfPointtransactionVoDatatable(@Param("searchValue") String searchValue, @Param("contactId") long contactId);



	  @Query(value = "selct ?1 as contactManageId,?2 as contactId",nativeQuery = true)
	  ContactManageDTO getDTOForContactManageDTO(long contactManageId, Long contactid);
}
