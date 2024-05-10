package com.erp.mterp.vo.planing;

import com.erp.mterp.vo.product.ProductVo;
import com.fasterxml.jackson.annotation.JsonBackReference;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.CreationTimestamp;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "planing_item")
@Getter
@Setter
public class PlaningItemVo {


    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "planing_item_id", length = 10)
    private long planingItemId;
    
    @JsonBackReference
    @ManyToOne
    @JoinColumn(name = "planing_id", referencedColumnName = "planing_id")
    private PlaningVo planingVo;

    @ManyToOne
    @JoinColumn(name = "product_id", referencedColumnName = "product_id")
    private ProductVo productVo;
    
    @Temporal(TemporalType.TIMESTAMP)
    @CreationTimestamp
    @Column(name = "created_on")
    private Date createdOn;
    
    @Column(name = "remark", columnDefinition = "text")
    private String remark;
    
    @Column(name = "qty")
    private float qty;

    @Column(name = "cost", columnDefinition = "double precision default 0")
    private double cost=0.0;

}
