package com.erp.mterp.repository.userrole;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import com.erp.mterp.vo.navmenu.NavMenuPermissionVo;
import com.erp.mterp.vo.userrole.UserRoleVo;

import java.util.List;


public interface UserRoleRepository extends CrudRepository<UserRoleVo, Long> {
    //@Query("from GlobalUserVo where global_user_id =:uid")
    UserRoleVo findByUserRoleId(long id);

    @Query(value = "select * from nav_menu_permission", nativeQuery = true)
    List<NavMenuPermissionVo> getSubmenuListWithGlobalPermission(String type, long parseLong, String action);

    @Query(value = "select * from user_role", nativeQuery = true)
    List getCheckList();

    List<UserRoleVo> findByBranchId(long branchId);
}
