package com.erp.mterp.vo.category;

import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.CreationTimestamp;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

@Entity
@Getter
@Setter
@Table(name = "category")
public class CategoryVo implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "category_id", length = 10)
    private long categoryId;

    @Column(name = "category_name", length = 50)
    private String categoryName;


    @Column(name = "branch_id", length = 10)
    private long branchId;

    @Column(name = "company_id", length = 10)
    private long companyId;

    @Column(name = "alterby_id", length = 10)
    private long alterBy;

    @Column(name = "createdby_id", length = 10, updatable = false)
    private long createdBy;

    @Column(name = "is_deleted", length = 1, columnDefinition = "int default 0")
    private int isDeleted;


    @Temporal(TemporalType.DATE)
    @CreationTimestamp
    @Column(name = "created_on", length = 50, updatable = false)
    private Date createdOn;

    @Column(name = "modified_on", length = 50)
    private Date modifiedOn;

}
