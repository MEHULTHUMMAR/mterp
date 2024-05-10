package com.erp.mterp.vo.contact;

import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;
import org.hibernate.validator.constraints.SafeHtml;
import org.springframework.data.annotation.LastModifiedDate;

import lombok.Getter;
import lombok.Setter;

@Entity
@Getter
@Setter
@Table(name = "contact")
public class ContactVo {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "contact_id", length = 10)
    private long contactId;

    @Column(name = "name")
    private String name;
    
    @Column(name = "company_name")
    private String companyName;
    
    @Column(name = "email", length = 50)
    private String email;
    
    @Column(name = "mob_no", length = 17)
    private String mobNo;

    @Column(name = "address", length = 300, columnDefinition = "text")
    private String address;

    @Column(name = "countries_code", length = 50)
    private String countriesCode;

    @Column(name = "pin_code", length = 50)
    private String pincode;

    @Column(name = "state_code", length = 50)
    private String stateCode;

    @Column(name = "city_code", length = 50)
    private String cityCode;
    

    @Column(name = "alterby_id", length = 10)
    private long alterBy;

    @Column(name = "createdby_id", length = 10, updatable = false)
    private long createdBy;

    @Column(name = "company_id", length = 10, updatable = false)
    private long companyId;

    @Column(name = "branch_id", length = 10, updatable = false)
    private long branchId;

    @Column(name = "is_deleted", length = 1, columnDefinition = "int default 0")
    private int isDeleted;

    @Temporal(TemporalType.DATE)
    @CreationTimestamp
    @Column(name = "created_on", length = 50, updatable = false)
    private Date createdOn;

    @Temporal(TemporalType.DATE)
    @LastModifiedDate
    @Column(name = "modified_on", length = 50)
    private Date modifiedOn;

    @Transient
    private String cityName;
    @Transient
    private String countryName;
    @Transient
    private String stateName;

}
