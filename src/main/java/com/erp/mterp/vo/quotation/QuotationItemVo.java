package com.erp.mterp.vo.quotation;

import com.erp.mterp.vo.product.ProductVo;
import com.fasterxml.jackson.annotation.JsonBackReference;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.CreationTimestamp;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "quotation_item")
@Getter
@Setter
public class QuotationItemVo {


    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "quotation_item_id", length = 10)
    private long quotationItemId;
    
    @JsonBackReference
    @ManyToOne
    @JoinColumn(name = "quotation_id", referencedColumnName = "quotation_id")
    private QuotationVo quotationVo;

    @ManyToOne
    @JoinColumn(name = "product_id", referencedColumnName = "product_id")
    private ProductVo productVo;
    
    @Temporal(TemporalType.TIMESTAMP)
    @CreationTimestamp
    @Column(name = "created_on")
    private Date createdOn;
    
    @Column(name = "remark", columnDefinition = "text")
    private String remark;
    
    @Column(name = "qty",columnDefinition = "double precision default 0")
    private float qty;

    @Column(name = "cost", columnDefinition = "double precision default 0")
    private double cost=0.0;

}
