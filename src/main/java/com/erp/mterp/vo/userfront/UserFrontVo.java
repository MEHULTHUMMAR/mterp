package com.erp.mterp.vo.userfront;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

import com.erp.mterp.vo.userrole.UserRoleVo;
import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name = "user_front")
@Getter
@Setter
public class UserFrontVo {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "user_front_id", length = 10)
    private long userFrontId;


	/*
	 * @Column(name = "company_id") private long companyId;
	 */
	

    @JsonIgnore
    @ManyToOne
    @JoinColumn(name = "parent_id", referencedColumnName = "user_front_id")
    private UserFrontVo userFrontVo;

    @ManyToMany
    @JoinTable(name = "user_role_new", joinColumns = @JoinColumn(name = "user_front_id"), inverseJoinColumns = @JoinColumn(name = "user_role_id"))
    private List<UserRoleVo> roles;

    @Column(name = "countries_code", length = 20)
    private String countriesCode;

    @Transient
    private String countriesName;

    @Column(name = "zone_code", length = 20)
    private String zoneCode;

    @Column(name = "state_code", length = 20)
    private String stateCode;

    @Transient
    private String stateName;

    @Column(name = "city_code", length = 20)
    private String cityCode;

    @Transient
    private String cityName;

    @Transient
    private String userActivityLog;

    @Column(name = "languages_code", length = 20)
    private String languagesCode;

    @Column(name = "name", length = 150)
    private String name;

    @Column(name = "email", length = 80)
    private String email;

    @Column(name = "address", length = 200)
    private String address;

    @Column(name = "pincode", length = 6)
    private String pincode;

    @Column(name = "contact_name", length = 100)
    private String contactName;

    @Column(name = "contact_no", length = 30)
    private String contactNo;

    @Column(name = "user_name", length = 50)
    private String userName;

    @Column(name = "password")
    private String password;

    @Column(name = "bank_acholder_name", length = 50)
    private String bankAcholderName;

    @Column(name = "bank_acno", length = 30)
    private String bankAcno;

    @Column(name = "bank_branch", length = 50)
    private String bankBranch;

    @Column(name = "bank_ifsc", length = 20)
    private String bankIFSC;

    @Column(name = "bank_name", length = 50)
    private String bankName;

    @Column(name = "bank_swift_code", length = 50)
    private String bankSwiftCode;

    @Column(name = "bank_iban_no", length = 30)
    private String ibanNo;

    @Column(name = "gst", length = 20)
    private String gst;

    @Column(name = "pan_no", length = 30)
    private String panNo;

    @Column(name = "telephone", length = 20)
    private String telephone;

    @Column(name = "website", length = 100)
    private String website;

    @Column(name = "status", length = 20)
    private String status;

    @Column(name = "is_deleted", length = 1, columnDefinition = "int default 0")
    private int isDeleted;

    @Column(name = "email_verification", length = 1, columnDefinition = "int default 0")
    private int emailVerify;

    @Column(name = "mobno_verification", length = 1, columnDefinition = "int default 0")
    private int mobnoVerify;

    @Column(name = "created_on", length = 50, updatable = false)
    private String createdOn;

    @Column(name = "modified_on", length = 50)
    private String modifiedOn;

    @Column(name = "sender_id", length = 10)
    private String senderId;

    @Column(name = "logo", length = 50)
    private String logo;


    @Column(name = "domainName", length = 100)
    private String domainname;

    @Column(name = "assigned_sms", columnDefinition = "int default 0")
    private long assignedSms;
    
    @Column(name = "used_sms", columnDefinition = "int default 0")
    private long usedSms;
    
    @Temporal(TemporalType.DATE)
    @Column(name = "demo_start_date")
    private Date startDate;
    
    @Column(name = "validity_days")
    private long validityDays;

    @Column(name = "whatsapp_token", columnDefinition = "TEXT")
    private String whatsappToken;

    @Column(name = "company_upi")
    private String companyUpi;

    
    @Column(name = "access_key", columnDefinition = "TEXT")
    private String accessKey;
    
    @Column(name = "secret_key", columnDefinition = "TEXT")
    private String secretKey;

    @Temporal(TemporalType.DATE)
    @Column(name = "next_renewal_date")
    private Date nextRenewalDate;

    @Column(name = "owner_no")
    private String ownerNo;
    
    @Column(name = "customer_care_no")
    private String customerCareNo;
    
    @Column(name = "month_interval", length = 100)
    private String monthInterval;

    @Column(name = "default_year_interval", length = 100)
    private String defaultYearInterval;
    
}
