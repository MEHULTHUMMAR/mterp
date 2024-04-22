package com.erp.mterp.repository.navsubmenu;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import com.erp.mterp.vo.navmenu.NavSubMenuVo;


public interface NavSubMenuRepository extends CrudRepository<NavSubMenuVo, Long> {

    @Query(nativeQuery = true, value = "select * from nav_sub_menu where nav_sub_menu_id in (select nav_sub_menu_id from nav_menu_permission where user_role_id=?1)  GROUP BY nav_sub_menu_id ORDER BY ordering  ASC")
    Iterable<NavSubMenuVo> getNavSubMenuGlobalList(long userRoleId);

    @Query(nativeQuery = true, value = "select * from nav_sub_menu where nav_sub_menu_id in (select nav_sub_menu_id from nav_menu_permission where user_front_id=?1)  GROUP BY nav_sub_menu_id ORDER BY ordering  ASC")
    Iterable<NavSubMenuVo> getNavSubMenuByUserFrontId(long userFrontId);

    // --Commented out by Inspection (08/11/20, 2:04 AM):NavSubMenuVo findByNavSubMenuId(long navSubMenuId);

    @Query(nativeQuery = true, value = "SELECT * FROM nav_sub_menu WHERE nav_sub_menu_id IN (SELECT nav_sub_menu_id FROM nav_menu_permission WHERE user_role_id=?1 AND status='active')  GROUP BY nav_sub_menu_id ORDER BY ordering ASC")
    List<NavSubMenuVo> findNavSubMenuByUserRoleId(long userRoleId);


}
