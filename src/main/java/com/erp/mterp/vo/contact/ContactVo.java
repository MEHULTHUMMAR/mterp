package com.erp.mterp.vo.contact;

import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;
import org.springframework.data.annotation.LastModifiedDate;

import javax.persistence.*;
import java.util.Date;
import java.util.List;

@Entity
@Getter
@Setter
@Table(name = "contact")
public class ContactVo {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "contact_id", length = 10)
    private long contactId;

    
    @Column(name = "company_name")
    private String companyName;

    @LazyCollection(LazyCollectionOption.FALSE)
    @OneToMany(mappedBy = "contact", cascade = CascadeType.ALL)
    private List<ContactAddressVo> contactAddressVos;
    
    @Column(name = "email", length = 50)
    private String email;

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


}
