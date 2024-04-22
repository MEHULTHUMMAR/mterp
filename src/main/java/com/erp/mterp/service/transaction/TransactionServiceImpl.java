package com.erp.mterp.service.transaction;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.erp.mterp.repository.transaction.TransactionRepository;
import com.erp.mterp.vo.transaction.PointTransactionVo;

@Service
public class TransactionServiceImpl implements TransactionService {

	@Autowired
	TransactionRepository transactionRepository;
	@Override
	public void save(PointTransactionVo pointTransactionVo) {
		transactionRepository.save(pointTransactionVo);
	}

}
