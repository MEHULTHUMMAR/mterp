package com.erp.mterp.repository.transaction;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.erp.mterp.vo.transaction.PointTransactionVo;

@Repository
public interface TransactionRepository extends JpaRepository<PointTransactionVo, Long> {
	
	@Modifying
	@Transactional
//	@Query(value = "delete\n"
//			+ "from Point_transaction where contact_id=?1	and company_id=?2 and contact_transaction_id=(select contact_transaction_id from contact_transaction where company_id=?2 and transaction_id=?3	\n"
//			+ "and contact_transaction.contact_manage_id=(SELECT contact_manage_id from contact_manage where contact_manage.contact_id=?1  and company_id=?2))",nativeQuery = true)
//	void deleteTransaction(long contactId, long companyId, String transactionId);

	@Query(value = "delete\n" +
			"from Point_transaction where contact_id=?1\t\n" +
			"and company_id=?2 \n" +
			"and exists (select 1 from contact_transaction \n" +
			"where company_id=?2 and transaction_id=?3 \n" +
			"and contact_transaction.contact_transaction_id=Point_transaction.contact_transaction_id\n" +
			"and exists (SELECT 1 from contact_manage \n" +
			"where contact_manage.contact_id=?1  and company_id=?2 \n" +
			"and contact_manage.contact_manage_id=contact_transaction.contact_manage_id))",nativeQuery = true)
	void deleteTransaction(long contactId, long companyId, String transactionId);

}
