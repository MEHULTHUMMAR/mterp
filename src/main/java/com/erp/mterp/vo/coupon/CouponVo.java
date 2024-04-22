package com.erp.mterp.vo.coupon;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

import org.hibernate.annotations.CreationTimestamp;
import org.springframework.data.annotation.LastModifiedDate;

import lombok.Getter;
import lombok.Setter;

@Entity
@Getter
@Setter
@Table(name = "coupon")
public class CouponVo {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "coupon_id", length = 10)
    private long couponId;

    @Column(name = "description", columnDefinition = "text")
    private String description;

    @Column(name = "discount_type", length = 20)
    String discountType;
    
    @Column(name = "coupoun_type", length = 20)
    String couponType;
 
    @Column(name = "points", length = 6)
    private double points = 0.0;
    
    @Column(name = "discount", length = 6)
    private double discount = 0.0;
    
    @Column(name = "company_id", length = 10)
    private long companyId;

    @Column(name = "alterby_id", length = 10)
    private long alterBy;

    @Column(name = "createdby_id", length = 10, updatable = false)
    private long createdBy;

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

    @Column(name = "otpverify", length = 1, columnDefinition = "int default 0")
    private int otpverify;

    @Transient
    private String createdby_name;


}
