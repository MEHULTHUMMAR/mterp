package com.erp.mterp.vo.userrole;

import com.erp.mterp.vo.userfront.UserFrontVo;
import com.fasterxml.jackson.annotation.JsonIgnore;

import javax.persistence.*;
import java.util.Set;

@Entity
@Table(name = "user_role")
public class UserRoleVo {


    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "user_role_id", length = 10)
    private long userRoleId;

    @Column(name = "userrole_name", length = 50)
    private String userRoleName;

    @ManyToMany(mappedBy = "roles", cascade = {CascadeType.PERSIST, CascadeType.MERGE})
    @JsonIgnore
    private Set<UserFrontVo> userFrontVo;

    @Column(name = "branch_id")
    private long branchId;

    public long getUserRoleId() {
        return userRoleId;
    }

    public void setUserRoleId(long userRoleId) {
        this.userRoleId = userRoleId;
    }

    public String getUserRoleName() {
        return userRoleName;
    }

    public void setUserRoleName(String userRoleName) {
        this.userRoleName = userRoleName;
    }

    public Set<UserFrontVo> getUserFrontVo() {
        return userFrontVo;
    }

    public void setUserFrontVo(Set<UserFrontVo> userFrontVo) {
        this.userFrontVo = userFrontVo;
    }

    public long getBranchId() {
        return branchId;
    }

    public void setBranchId(long branchId) {
        this.branchId = branchId;
    }


}
