package com.erp.mterp.repository.navmenupermission;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.erp.mterp.vo.navmenu.NavMenuPermissionVo;

@Repository
@Transactional
public interface NavMenuPermissionRepository extends CrudRepository<NavMenuPermissionVo, Long> {


    @Query(value = "from NavMenuPermissionVo  where userRoleVo.userRoleId=?1")
    List<NavMenuPermissionVo> getRoleWisePermission(long userRoleId);

    @Query(value = "from NavMenuPermissionVo  where userFrontVo.userFrontId=?1")
    List<NavMenuPermissionVo> findByUserfrontId(long id);

    int deleteByNavMenuPermissionIdIn(List<Long> navMenuPermissionIds);

    @Query("From NavMenuPermissionVo WHERE navSubMenuVo.type = ?1 AND status = 'active' AND navMenuActionVo.navMenuActionId = ?2 AND userRoleVo.userRoleId = ?3")
    List<NavMenuPermissionVo> findByTypeAndActionAndRole(String type, long navMenuActionId, long userRoleId);


}
