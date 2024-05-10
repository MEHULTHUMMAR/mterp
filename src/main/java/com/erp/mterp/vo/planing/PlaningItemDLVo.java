package com.erp.mterp.vo.planing;

import com.erp.mterp.vo.bom.BillOfMaterialVo;
import com.erp.mterp.vo.drawinglogic.DrawingLogicDocVo;
import com.erp.mterp.vo.product.ProductVo;
import com.fasterxml.jackson.annotation.JsonBackReference;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.CreationTimestamp;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "planing_item_dl")
@Getter
@Setter
public class PlaningItemDLVo {


    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "planing_item_dl_id", length = 10)
    private long planingItemDLId;

    @ManyToOne
    @JoinColumn(name = "drawing_logic_doc_id", referencedColumnName = "drawing_logic_doc_id")
    private DrawingLogicDocVo drawingLogicDocVo;
    
    @Temporal(TemporalType.TIMESTAMP)
    @CreationTimestamp
    @Column(name = "created_on")
    private Date createdOn;
    
    @Column(name = "billofmaterial_id", columnDefinition = "text")
    private long billofmaterialId;

    @Column(name = "planing_item_id", columnDefinition = "text")
    private long planingItemId;
    
    @Column(name = "costing")
    private double costing;

}
