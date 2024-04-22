package com.erp.mterp.repository.contact;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.erp.mterp.vo.contact.ContactTransactionItemVo;

@Repository
public interface ContactTransactionItemRepository extends JpaRepository<ContactTransactionItemVo, Long> {

	
	@Modifying
	@Transactional
//	@Query(value = "delete from contact_transaction_item where contact_transaction_id in( select  contact_transaction_id from contact_transaction where company_id=?2 and transaction_id=?3	and contact_transaction.contact_manage_id=(SELECT contact_manage_id from contact_manage where  contact_manage.contact_id=?1 and  contact_manage.company_id=?2))",nativeQuery = true)
//	void deleteTransaction(long contactId, long companyId, String transactionId);

	@Query(value = "delete from contact_transaction_item \n" +
			"where  exists ( select  1 \n" +
			"\t\t\t   from contact_transaction \n" +
			"\t\t\t   where company_id=?2 \n" +
			"\t\t\t   and transaction_id=?3\t\n" +
			"\t\t\t   and contact_transaction.contact_transaction_id=contact_transaction_item.contact_transaction_id\n" +
			"\t\t\t   and exists (SELECT 1 \n" +
			"\t\t\t\t\t\t   from contact_manage \n" +
			"\t\t\t\t\t\t   where  contact_manage.contact_id=?1 and  contact_manage.company_id=?2\n" +
			"\t\t\t\t\t\t   and contact_manage.contact_manage_id=contact_transaction.contact_manage_id));",nativeQuery = true)
	void deleteTransaction(long contactId, long companyId, String transactionId);

}
