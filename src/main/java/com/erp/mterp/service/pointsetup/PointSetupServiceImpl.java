package com.erp.mterp.service.pointsetup;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.erp.mterp.repository.contact.ContactManageRepository;
import com.erp.mterp.repository.contact.ContactRepository;
import com.erp.mterp.repository.contact.ContactTransactionItemRepository;
import com.erp.mterp.repository.contact.ContactTransactionRepository;
import com.erp.mterp.repository.transaction.TransactionRepository;

@Service
public class PointSetupServiceImpl implements PointSetupService {
	@Autowired
	ContactRepository contactRepository;
	
	@Autowired
	ContactManageRepository contactManageRepository;
	
	@Autowired
	ContactTransactionRepository contactTransactionRepository;
	
	@Autowired
	ContactTransactionItemRepository contactTransactionItemRepository;
	
	@Autowired
	TransactionRepository transactionRepository;

    @PersistenceContext
    EntityManager entityManager;
	
	
	

	
	

}
