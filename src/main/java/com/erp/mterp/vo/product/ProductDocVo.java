package com.erp.mterp.vo.product;

import com.erp.mterp.vo.contact.ContactTransactionVo;
import com.fasterxml.jackson.annotation.JsonBackReference;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.CreationTimestamp;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "product_doc")
@Getter
@Setter
public class ProductDocVo {


    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "product_doc_id", length = 10)
    private long productDocId;
    
    @JsonBackReference
    @ManyToOne
    @JoinColumn(name = "product_id", referencedColumnName = "product_id")
    private ProductVo productVo;
    
    @Temporal(TemporalType.TIMESTAMP)
    @CreationTimestamp
    @Column(name = "created_on")
    private Date createdOn;
    
    @Column(name = "file_name", columnDefinition = "text")
    private String fileName;
    
    @Column(name = "remark")
    private String remark;

    @Column(name = "file_path")
    private String FilePath;

}
