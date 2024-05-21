package com.erp.mterp.vo.quotation;

import com.erp.mterp.vo.contact.ContactVo;
import com.erp.mterp.vo.enquire.EnquireVo;
import com.erp.mterp.vo.planing.PlaningVo;
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
@Table(name = "quotation")
public class QuotationVo {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "quotation_id", length = 10)
    private long quotationId;

    @Column(name = "prefix")
    private String prefix;
    
    @Column(name = "quotation_no")
    private String quotationNo;
    
    @Column(name = "quotation_date")
    private String quotationDate;

    @ManyToOne
    @JoinColumn(name = "contact_id", referencedColumnName = "contact_id")
    private ContactVo contactVo;

    @ManyToOne
    @JoinColumn(name = "planing_id", referencedColumnName = "planing_id")
    private PlaningVo planingVo;

    @Column(name = "description")
    private String description;

    @Column(name = "status")
    private String status;

    @LazyCollection(LazyCollectionOption.FALSE)
    @OneToMany(mappedBy = "quotationVo", cascade = CascadeType.ALL)
    private List<QuotationItemVo>  quotationItemVos;

    @Column(name = "tax_rate",columnDefinition = "double precision default 0")
    private float taxRate;

    @Column(name = "tax_amount", columnDefinition = "double precision default 0")
    private double taxAmount=0.0;

    @Column(name = "total", columnDefinition = "double precision default 0")
    private double total=0.0;

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
