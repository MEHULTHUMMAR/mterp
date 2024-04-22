package com.erp.mterp.vo.transaction;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.CreationTimestamp;

import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name = "point_transaction")
@Getter
@Setter
public class PointTransactionVo {

    private static final long serialVersionUID = 1L;
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "point_transaction_id", length = 10)
    private long pointTransactionId;

    @Column(name = "company_id", length = 10)
    private long companyId;
    
    @Column(name = "contact_transaction_id", length = 100)
    private long contactTransactionId;
    
    @Column(name = "contact_id", length = 100)
    private long contactId;
    
    @Column(name = "coupon_id", length = 100)
    private long couponId;
    
    @Column(name = "in_point", length = 50)
    private double inPoint;

    @Column(name = "out_point", length = 50)
    private double outPoint;

    @CreationTimestamp
    @Column(name = "created_on")
    private Timestamp createdOn;
    

    @Column(name = "description", columnDefinition = "TEXT")
    private String description;

}
