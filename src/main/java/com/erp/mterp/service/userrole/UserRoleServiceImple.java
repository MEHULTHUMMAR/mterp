package com.erp.mterp.service.userrole;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.erp.mterp.repository.userrole.UserRoleRepository;
import com.erp.mterp.vo.userrole.UserRoleVo;

import javax.transaction.Transactional;
import java.util.List;

@Service
@Transactional
public class UserRoleServiceImple implements UserRoleService {

    @Autowired
    UserRoleRepository userRoleRepository;

    @Override
    public UserRoleVo findByUserRoleId(long userRoleId) {
        return userRoleRepository.findByUserRoleId(userRoleId);
    }

    @Override
    public void save(UserRoleVo userRoleVo) {
        userRoleRepository.save(userRoleVo);
    }

    @Override
    public List<UserRoleVo> findByBranchId(long branchId) {
        return userRoleRepository.findByBranchId(branchId);
    }
}
