package com.erp.mterp.vo.enquire;

import com.erp.mterp.vo.contact.ContactVo;
import com.erp.mterp.vo.product.ProductVo;
import com.fasterxml.jackson.annotation.JsonBackReference;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.CreationTimestamp;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "enquire_item")
@Getter
@Setter
public class EnquireItemVo {


    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "enquire_item_id", length = 10)
    private long enquireItemId;
    
    @JsonBackReference
    @ManyToOne
    @JoinColumn(name = "enquire_id", referencedColumnName = "enquire_id")
    private EnquireVo enquireVo;

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

}
