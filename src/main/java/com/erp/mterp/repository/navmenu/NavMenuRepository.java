package com.erp.mterp.repository.navmenu;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import com.erp.mterp.vo.navmenu.NavMenuVo;


public interface NavMenuRepository extends CrudRepository<NavMenuVo, Long> {

    @Query(nativeQuery = true, value = "select * from nav_menu where nav_menu_id in (select nav_menu_id from nav_menu_permission where user_role_id=?1)  GROUP BY nav_menu_id ORDER BY ordering  ASC")
    Iterable<NavMenuVo> getNavMenuGlobalList(long userRoleId);

    @Query(nativeQuery = true, value = "select * from nav_menu where nav_menu_id in (select nav_menu_id from nav_menu_permission where user_front_id=?1)  GROUP BY nav_menu_id ORDER BY ordering  ASC")
    Iterable<NavMenuVo> getNavMenuByUserFrontId(long userFrontId);

}
