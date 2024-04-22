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
import javax.persistence.Transient;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;
import org.springframework.data.annotation.LastModifiedDate;

import com.fasterxml.jackson.annotation.JsonBackReference;

import lombok.Getter;
import lombok.Setter;

@Entity
@Getter
@Setter
@Table(name = "contact_manage")
public class ContactManageVo {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "contact_manage_id", length = 10)
    private long contactManageId;

    @Column(name = "points")
    private double points = 0.0;
    
    @Column(name = "company_id", length = 10)
    private long companyId;

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
    
  
    @ManyToOne
    @JoinColumn(name = "contact_id", referencedColumnName = "contact_id")
    private ContactVo contactVo;
    
    @JsonBackReference
    @LazyCollection(LazyCollectionOption.TRUE)
    @OneToMany(mappedBy = "contactManageVo", cascade = CascadeType.ALL)
    private List<ContactTransactionVo> contactTransactionVo;


}
