package com.erp.mterp.vo.bom;

import com.erp.mterp.vo.contact.ContactVo;
import com.erp.mterp.vo.drawinglogic.DrawingLogicDocVo;
import com.erp.mterp.vo.product.MaterialTypeVo;
import com.erp.mterp.vo.product.ProductUOMVo;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;
import org.springframework.data.annotation.LastModifiedDate;

import javax.persistence.*;
import java.util.Date;
import java.util.List;

@Entity
@Getter
@Setter
@Table(name = "billofmaterial")
public class BillOfMaterialVo {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "billofmaterial_id", length = 10)
    private long billofmaterialId;

    @Column(name = "prefix")
    private String prefix;
    
    @Column(name = "bom_no")
    private String bomNo;
    
    @Column(name = "bom_date")
    private String bomDate;

    @ManyToOne
    @JoinColumn(name = "drawing_logic_doc_id", referencedColumnName = "drawing_logic_doc_id")
    private DrawingLogicDocVo drawingLogicDocVo;

    @Column(name = "planingitem_id", columnDefinition = "bigint default 0")
    private long planingItemId;

    @ManyToOne
    @JoinColumn(name = "material_type_id", referencedColumnName = "material_type_id")
    private MaterialTypeVo materialTypeVo;

    @Column(name = "size_of_material")
    private String sizeOfMaterial;

    @Column(name = "round_type")
    private String roundType;

    @Column(name = "material_cost", columnDefinition = "double precision default 0")
    private double materialCost=0.0;

    @Column(name = "diameter_no", columnDefinition = "double precision default 0")
    private double diameterNo=0.0;

    @Column(name = "diameter_no_uom")
    private String diameterNoUOM;

    @Column(name = "diameter_length", columnDefinition = "double precision default 0")
    private double diameterLength=0.0;

    @Column(name = "diameter_length_uom")
    private String diameterLengthUOM;

    @Column(name = "pipe_length", columnDefinition = "double precision default 0")
    private double pipeLength=0.0;

    @Column(name = "pipe_length_uom")
    private String pipeLengthUOM;

    @Column(name = "od_value", columnDefinition = "double precision default 0")
    private double odValue=0.0;

    @Column(name = "od_uom")
    private String odUOM;

    @Column(name = "squre_val1", columnDefinition = "double precision default 0")
    private double squreVal1=0.0;

    @Column(name = "squre_val2", columnDefinition = "double precision default 0")
    private double squreVal2=0.0;

    @Column(name = "squre_uom")
    private String squreUOM;

    @Column(name = "squre_length", columnDefinition = "double precision default 0")
    private double squreLength=0.0;

    @Column(name = "squre_length_uom")
    private String squreLengthUOM;

    @Column(name = "small", columnDefinition = "double precision default 0")
    private double small=0.0;

    @Column(name = "small_uom")
    private String smallUOM;

    @Column(name = "big", columnDefinition = "double precision default 0")
    private double big=0.0;

    @Column(name = "big_uom")
    private String bigUOM;

    @Column(name = "flat_length", columnDefinition = "double precision default 0")
    private double flatLength=0.0;

    @Column(name = "flat_length_uom")
    private String flatLengthUOM;

    @Column(name = "machine_cost", columnDefinition = "double precision default 0")
    private double machineCost=0.0;

    @Column(name = "labour_cost", columnDefinition = "double precision default 0")
    private double labourCost=0.0;

    @Column(name = "additional_cost", columnDefinition = "double precision default 0")
    private double additionalCost=0.0;

    @Column(name = "total", columnDefinition = "double precision default 0")
    private double total=0.0;

    @Column(name = "profit", columnDefinition = "double precision default 0")
    private double profit=0.0;

    @Column(name = "bom_total", columnDefinition = "double precision default 0")
    private double bomTotal=0.0;


//    drawingLogicId: 3
//    materialType: 2

    @Column(name = "alterby_id", length = 10)
    private long alterBy;

    @Column(name = "createdby_id", length = 10, updatable = false)
    private long createdBy;

    @Column(name = "company_id", length = 10, updatable = false)
    private long companyId;

    @Column(name = "branch_id", length = 10, updatable = false)
    private long branchId;

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
    

}
