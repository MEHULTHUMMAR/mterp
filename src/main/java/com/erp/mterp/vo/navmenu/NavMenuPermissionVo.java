package com.erp.mterp.vo.navmenu;

import javax.persistence.*;

import com.erp.mterp.vo.userfront.UserFrontVo;
import com.erp.mterp.vo.userrole.UserRoleVo;

@Entity
@Table(name = "nav_menu_permission")
public class NavMenuPermissionVo {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "nav_menu_permission_id", length = 10)
    private long navMenuPermissionId;

    @ManyToOne
    @JoinColumn(name = "nav_menu_id", referencedColumnName = "nav_menu_id")
    private NavMenuVo navMenuVo;

    @ManyToOne
    @JoinColumn(name = "nav_sub_menu_id", referencedColumnName = "nav_sub_menu_id")
    private NavSubMenuVo navSubMenuVo;

    @ManyToOne
    @JoinColumn(name = "nav_menu_action_id", referencedColumnName = "nav_menu_action_id")
    private NavMenuActionVo navMenuActionVo;

    @ManyToOne
    @JoinColumn(name = "user_role_id", referencedColumnName = "user_role_id")
    private UserRoleVo userRoleVo;

    @ManyToOne
    @JoinColumn(name = "user_front_id", referencedColumnName = "user_front_id")
    private UserFrontVo userFrontVo;

    @Column(name = "status", length = 50)
    private String status;

    public long getNavMenuPermissionId() {
        return navMenuPermissionId;
    }

    public void setNavMenuPermissionId(long navMenuPermissionId) {
        this.navMenuPermissionId = navMenuPermissionId;
    }

    public NavMenuVo getNavMenuVo() {
        return navMenuVo;
    }

    public void setNavMenuVo(NavMenuVo navMenuVo) {
        this.navMenuVo = navMenuVo;
    }


    public NavMenuActionVo getNavMenuActionVo() {
        return navMenuActionVo;
    }

    public void setNavMenuActionVo(NavMenuActionVo navMenuActionVo) {
        this.navMenuActionVo = navMenuActionVo;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public NavSubMenuVo getNavSubMenuVo() {
        return navSubMenuVo;
    }

    public void setNavSubMenuVo(NavSubMenuVo navSubMenuVo) {
        this.navSubMenuVo = navSubMenuVo;
    }

    public UserFrontVo getUserFrontVo() {
        return userFrontVo;
    }

    public void setUserFrontVo(UserFrontVo userFrontVo) {
        this.userFrontVo = userFrontVo;
    }

    public UserRoleVo getUserRoleVo() {
        return userRoleVo;
    }

    public void setUserRoleVo(UserRoleVo userRoleVo) {
        this.userRoleVo = userRoleVo;
    }


}
