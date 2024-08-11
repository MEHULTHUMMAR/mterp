package com.erp.mterp.vo.planing;

import com.erp.mterp.vo.contact.ContactVo;
import com.erp.mterp.vo.enquire.EnquireVo;
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
@Table(name = "planing")
public class PlaningVo {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "planing_id", length = 10)
    private long planingId;

    @Column(name = "prefix")
    private String prefix;
    
    @Column(name = "planing_no")
    private long planingNo;
    
    @Column(name = "planing_date")
    private String planingDate;

    @ManyToOne
    @JoinColumn(name = "contact_id", referencedColumnName = "contact_id")
    private ContactVo contactVo;

    @Column(name = "billing_address_id", length = 10,columnDefinition = "bigint default 0")
    private long billingAddressId;

    @ManyToOne
    @JoinColumn(name = "enquire_id", referencedColumnName = "enquire_id")
    private EnquireVo enquireVo;

    @Column(name = "description")
    private String description;

    @Column(name = "status")
    private String status;

    @LazyCollection(LazyCollectionOption.FALSE)
    @OneToMany(mappedBy = "planingVo", cascade = CascadeType.ALL)
    private List<PlaningItemVo> planingItemVos;

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
