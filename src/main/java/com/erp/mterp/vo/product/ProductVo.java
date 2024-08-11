package com.erp.mterp.vo.product;

import com.erp.mterp.vo.category.CategoryVo;
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
@Table(name = "product")
public class ProductVo {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "product_id", length = 10)
    private long productId;

    @Column(name = "itemcode")
    private String itemcode;
    
    @Column(name = "product_name")
    private String productName;
    
    @Column(name = "display_name")
    private String displayName;

    @ManyToOne
    @JoinColumn(name = "category_id", referencedColumnName = "category_id")
    private CategoryVo categoryVo;


    @Column(name = "capacity1" , columnDefinition = "double precision default 0")
    private float capacity1;

    @Column(name = "capacity2", columnDefinition = "double precision default 0")
    private float capacity2;

    @Column(name = "unit")
    private String unit;

    @Column(name = "certificate_required", columnDefinition = "int default 0")
    private int certificateRequired;

    @Column(name = "is_sub_product", columnDefinition = "int default 0")
    private int isSubProduct;

    @Column(name = "description")
    private String description;

    @LazyCollection(LazyCollectionOption.FALSE)
    @OneToMany(mappedBy = "productVo", cascade = CascadeType.ALL)
    private List<ProductDocVo> productDocVos;

    @LazyCollection(LazyCollectionOption.FALSE)
    @OneToMany(mappedBy = "productVo", cascade = CascadeType.ALL)
    private List<SubProductVo> subProductVos;

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
