package com.erp.mterp.vo.navmenu;

import lombok.Data;

import javax.persistence.*;

@Entity
@Data
@Table(name = "nav_menu")
public class NavMenuVo {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "nav_menu_id", length = 10)
    private long navMenuId;

    @Column(name = "title", length = 50)
    private String title;

    @Column(name = "menu_url", length = 50)
    private String menuURL;

    @Column(name = "icon_class", length = 50)
    private String iconClass;

    @Column(name = "status", length = 50)
    private String status;

    @Column(name = "ordering")
    private int ordering;

    @Column(name = "hide_company_id", length = 50)
    private String hideCompanyId;


}
