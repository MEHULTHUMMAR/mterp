package com.erp.mterp.vo.navmenu;

import javax.persistence.*;

@Entity
@Table(name = "nav_menu_action")
public class NavMenuActionVo {


    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "nav_menu_action_id", length = 10)
    private long navMenuActionId;

    @Column(name = "action_name", length = 50)
    private String actionName;


    public long getNavMenuActionId() {
        return navMenuActionId;
    }

    public void setNavMenuActionId(long navMenuActionId) {
        this.navMenuActionId = navMenuActionId;
    }

    public String getActionName() {
        return actionName;
    }

    public void setActionName(String actionName) {
        this.actionName = actionName;
    }
}
