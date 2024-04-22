package com.erp.mterp.vo.contact;

import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;

import com.fasterxml.jackson.annotation.JsonBackReference;

import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name = "contact_transaction")
@Getter
@Setter
public class ContactTransactionVo {


    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "contact_transaction_id", length = 10)
    private long contactTransactionId;
    
    @JsonBackReference
    @ManyToOne
    @JoinColumn(name = "contact_manage_id", referencedColumnName = "contact_manage_id")
    private ContactManageVo contactManageVo;
    
    @Temporal(TemporalType.TIMESTAMP)
    @CreationTimestamp
    @Column(name = "created_on")
    private Date createdOn;
    
    @Column(name = "transaction_id")
    private String transactionId;
    
    @Column(name = "description")
    private String description;
    
    @Column(name = "company_id", length = 10)
    private long companyId;
    
    @Column(name = "bill_no")
    private String billNo;
    
    @Column(name = "gross_amount")
    private double grossAmount;
    
    @Column(name = "net_amount")
    private double netAmount;
    
    @LazyCollection(LazyCollectionOption.FALSE)
    @OneToMany(mappedBy = "contactTransactionVo", cascade = CascadeType.ALL)
    private List<ContactTransactionItemVo> contactTransactionItemVo;
    
    
    
    
    
    
    
    
    
    
    
    

}
