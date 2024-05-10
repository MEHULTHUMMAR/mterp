package com.erp.mterp.vo.drawinglogic;

import com.erp.mterp.vo.category.CategoryVo;
import com.erp.mterp.vo.product.ProductVo;
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
@Table(name = "drawing_logic_doc")
public class DrawingLogicDocVo {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "drawing_logic_doc_id", length = 10)
    private long drawingLogicDocId;

    @Column(name = "prefix")
    private String prefix;

    @Column(name = "drawing_logic_doc_no")
    private String drawingLogicDocNo;


    @Column(name = "file_name", columnDefinition = "text")
    private String fileName;


    @Column(name = "file_path")
    private String FilePath;

    @ManyToOne
    @JoinColumn(name = "product_id", referencedColumnName = "product_id")
    private ProductVo productVo;


    @Column(name = "gaflag", columnDefinition = "int default 0")
    private int gaFlag;

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
