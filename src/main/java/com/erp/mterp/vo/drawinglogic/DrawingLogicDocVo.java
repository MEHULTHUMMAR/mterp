package com.erp.mterp.vo.drawinglogic;

import com.erp.mterp.vo.product.ProductVo;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.CreationTimestamp;
import org.springframework.data.annotation.LastModifiedDate;

import javax.persistence.*;
import java.util.Date;

@Entity
@Getter
@Setter
@Table(name = "drawing_logic_doc")
public class DrawingLogicDocVo {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "drawing_logic_doc_id", length = 10)
    private long drawingLogicDocId;

    @ManyToOne
    @JoinColumn(name = "product_id", referencedColumnName = "product_id")
    private ProductVo productVo;

    @Column(name = "gaflag", columnDefinition = "int default 0")
    private int gaFlag;

    @Column(name = "prefix")
    private String prefix;

    @Column(name = "drawing_logic_code")
    private String drawingLogicCode;

    @Column(name = "isstd", columnDefinition = "int default 0")
    private int isStd;

    @Column(name = "std_code")
    private String stdCode;

    @Column(name = "product_category" ,columnDefinition = "bigint default 0")
    private long productCategory;

    @Column(name = "product_capacity", columnDefinition = "bigint default 0")
    private long productCapacity;

    @Column(name = "orientation" ,columnDefinition = "bigint default 0")
    private long orientation;

    @Column(name = "sub_assembly_no")
    private String subAssemblyNo;

    @Column(name = "part_no")
    private String partNo;

    @Column(name = "process_no")
    private String processNo;

    @Column(name = "revision_no")
    private String revisionNo;

    @Column(name = "raw_material_code")
    private String rawMaterialCode;

    @Column(name = "raw_material" ,columnDefinition = "bigint default 0")
    private long rawMaterial;

    @Column(name = "raw_material_type", columnDefinition = "bigint default 0")
    private long rawMaterialType;

    @Column(name = "moc" ,columnDefinition = "bigint default 0")
    private long moc;

    @Column(name = "size1")
    private String size1;

    @Column(name = "size2")
    private String size2;

    @Column(name = "size3")
    private String size3;

    @Column(name = "is_hardware_code", columnDefinition = "int default 0")
    private int isHardwareCode;

    @Column(name = "is_miscellaneous", columnDefinition = "int default 0")
    private int isMiscellaneous;

    @Column(name = "hardware_code")
    private String hardwareCode;

    @Column(name = "miscellaneous_code")
    private String miscellaneousCode;

    @Column(name = "file_name", columnDefinition = "text")
    private String fileName;

    @Column(name = "file_path")
    private String FilePath;

    @Column(name = "description")
    private String description;

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
