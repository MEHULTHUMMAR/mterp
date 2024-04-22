package com.erp.mterp.config;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;

import java.util.Collection;
import java.util.Set;

public class RequestUserDetails extends User {
    private static final long serialVersionUID = -6411988532329234916L;
    private Long userFrontId;
    private Long roleId;
    private Long userType;
    private Long corporateId;
    private Long branchId;
    private Long companyId;
    private String stateCode;
    private String countryCode;
    private String name;
    private String accessKey;
    private String secretKey;

    public RequestUserDetails(String username, String password, Long userFrontId, Long roleId, Long userType, Long corporateId, Long branchId, Long companyId, String stateCode, String countryCode, String name,
                              Collection<? extends GrantedAuthority> authorities) {
        super(username, password, authorities);
        this.userFrontId = userFrontId;
        this.roleId = roleId;
        this.userType = userType;
        this.corporateId = corporateId;
        this.branchId = branchId;
        this.companyId = companyId;
        this.stateCode = stateCode;
        this.countryCode = countryCode;
        this.name = name;
    }
    
   


    public RequestUserDetails(String username, String password, long contactId, long userType, long branchId,
                              long companyId, String name, Set<GrantedAuthority> authorities) {
        super(username, password, authorities);
        this.userFrontId = contactId;
        this.userType = userType;
        this.branchId = branchId;
        this.companyId = companyId;
        this.name = name;
    }

    public RequestUserDetails(String accessKey2, String secretKey2, long userFrontId2, long userFrontId3,
			Set<GrantedAuthority> grantedAuthorities) {
    	 super(accessKey2, secretKey2, grantedAuthorities);
         this.userFrontId = userFrontId2;
        this.companyId = userFrontId3;
      
	}




	public Long getUserFrontId() {
        return userFrontId;
    }

    public Long getRoleId() {
        return roleId;
    }

    public Long getUserType() {
        return userType;
    }


    public Long getCorporateId() {
        return corporateId;
    }


    public Long getBranchId() {
        return branchId;
    }

    public Long getCompanyId() {
        return companyId;
    }


    public String getStateCode() {
        return stateCode;
    }


    public String getCountryCode() {
        return countryCode;
    }


    public String getName() {
        return name;
    }

}
