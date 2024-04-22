package com.erp.mterp.service.userrole;

import java.util.List;

import com.erp.mterp.vo.userrole.UserRoleVo;

public interface UserRoleService {

    void save(UserRoleVo userRoleVo);

    UserRoleVo findByUserRoleId(long userRoleId);

    List<UserRoleVo> findByBranchId(long branchId);
}
