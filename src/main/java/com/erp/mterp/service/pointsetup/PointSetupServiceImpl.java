package com.erp.mterp.service.pointsetup;

import com.erp.mterp.repository.contact.ContactRepository;
import com.erp.mterp.repository.transaction.TransactionRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

@Service
public class PointSetupServiceImpl implements PointSetupService {
	@Autowired
	ContactRepository contactRepository;

	@Autowired
	TransactionRepository transactionRepository;

    @PersistenceContext
    EntityManager entityManager;
	
	
	

	
	

}
