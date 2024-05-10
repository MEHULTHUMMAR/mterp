package com.erp.mterp.vo.product;

import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Data
@Table(name = "product_uom")
public class ProductUOMVo implements Serializable{

	private static final long serialVersionUID = 1L;

	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "product_uom_id", length = 10)
    private long productUOMId;

    @Column(name = "uom_name", length = 20)
    private String uomName;
}
