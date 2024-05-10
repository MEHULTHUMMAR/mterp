package com.erp.mterp.vo.product;

import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Data
@Table(name = "material_type")
public class MaterialTypeVo implements Serializable{

	private static final long serialVersionUID = 1L;

	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "material_type_id", length = 10)
    private long materialTypeId;

    @Column(name = "material_type", length = 20)
    private String materialType;
}
