package com.erp.mterp.service.userfront;

import java.util.Date;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.datatables.mapping.DataTablesInput;
import org.springframework.data.jpa.datatables.mapping.DataTablesOutput;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.jpa.repository.support.JpaEntityInformation;
import org.springframework.data.jpa.repository.support.JpaEntityInformationSupport;
import org.springframework.stereotype.Service;

import com.erp.mterp.repository.CustomDataTableSearch;
import com.erp.mterp.repository.user.UserRepository;
import com.erp.mterp.vo.userfront.UserFrontVo;

@Service
public class UserFrontServiceImpl implements UserFrontService {

    @Autowired
    UserRepository userRepository;

    @PersistenceContext
    EntityManager entityManager;

    @Override
    public long getClientsRoleIdStatusIsDeleted(String data) {

        return userRepository.getClientsRoleIdStatusIsDeleted(data);
    }

    @Override
    public long getTotalClientsRoleIdIsDeleted() {

        return userRepository.getTotalClientsRoleIdIsDeleted();
    }

    @Override
    public List<UserFrontVo> getRenewalCustomers(Date currentDate, Date betweenDate) {

        return userRepository.getRenewalCustomers(currentDate, betweenDate);
    }

    @Override
    public List<UserFrontVo> getCompanyAndIsDeleted() {

        return userRepository.findByCompanyAndIsDeleted();
    }

    @Override
    public DataTablesOutput<UserFrontVo> getAll(@Valid DataTablesInput input,
                                                Specification<UserFrontVo> additionalSpecification, Specification<UserFrontVo> specification) {
        final JpaEntityInformation<UserFrontVo, ?> entityInformation = JpaEntityInformationSupport
                .getEntityInformation(UserFrontVo.class, entityManager);
        CustomDataTableSearch<UserFrontVo, Long> customDataTableSearch = new CustomDataTableSearch<>(entityInformation,
                entityManager);
        return customDataTableSearch.findAll(input, additionalSpecification, specification);
    }

    @Override
    public List<Object[]> getTopPerformingIndustrywiseCustomer() {
        return userRepository.getTopPerformingCustomer();
    }

	@Override
	public UserFrontVo findByUserFrontIdAndIsDeletedAndStatus(long branchId, int i, String status) {
		return userRepository.findByUserFrontIdAndIsDeletedAndStatus(branchId,i,status);
	}

//	@Override
//	public List<Object[]> getBottomPerformingIndustrywiseCustomer() {
//		// TODO Auto-generated method stub
//		return userRepository.getBottomPerformingCustomer();
//	}


}
