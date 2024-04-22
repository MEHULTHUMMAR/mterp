package com.erp.mterp.service.userfront;

import java.util.Date;
import java.util.List;

import javax.validation.Valid;

import org.springframework.data.jpa.datatables.mapping.DataTablesInput;
import org.springframework.data.jpa.datatables.mapping.DataTablesOutput;
import org.springframework.data.jpa.domain.Specification;

import com.erp.mterp.vo.userfront.UserFrontVo;

public interface UserFrontService {

    long getClientsRoleIdStatusIsDeleted(String data);

    long getTotalClientsRoleIdIsDeleted();

    List<UserFrontVo> getRenewalCustomers(Date currentDate, Date betweenDate);

    List<UserFrontVo> getCompanyAndIsDeleted();

    DataTablesOutput<UserFrontVo> getAll(@Valid DataTablesInput input, Specification<UserFrontVo> additionalSpecification,
                                         Specification<UserFrontVo> specification);

    List<Object[]> getTopPerformingIndustrywiseCustomer();

	UserFrontVo findByUserFrontIdAndIsDeletedAndStatus(long branchId, int i, String string);

    //List<Object[]> getBottomPerformingIndustrywiseCustomer();

}
