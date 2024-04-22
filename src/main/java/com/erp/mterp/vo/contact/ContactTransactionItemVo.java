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
@Table(name = "contact_transaction_item")
@Getter
@Setter
public class ContactTransactionItemVo {


    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "contact_transaction_item_id", length = 10)
    private long contactTransactionItemId;
    
    @JsonBackReference
    @ManyToOne
    @JoinColumn(name = "contact_transaction_id", referencedColumnName = "contact_transaction_id")
    private ContactTransactionVo contactTransactionVo;
    
    @Temporal(TemporalType.TIMESTAMP)
    @CreationTimestamp
    @Column(name = "created_on")
    private Date createdOn;
    
    @Column(name = "name", columnDefinition = "text")
    private String name;
  
    @Column(name = "rate")
    private double rate;
    
    @Column(name = "quantity")
    private float quantity;
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

}
