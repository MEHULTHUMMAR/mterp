package com.erp.mterp.vo.product;

import com.fasterxml.jackson.annotation.JsonBackReference;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Entity
@Table(name = "sub_product")
@Getter
@Setter
public class SubProductVo {


    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "sub_product_tbl_id", length = 10)
    private long subProductTBLId;
    
    @JsonBackReference
    @ManyToOne
    @JoinColumn(name = "product_id", referencedColumnName = "product_id")
    private ProductVo productVo;

    @Column(name = "sub_product_id")
    private long subProductId;

}
