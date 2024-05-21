package com.erp.mterp.repository.drawinglogic;

import com.erp.mterp.vo.drawinglogic.DrawingLogicDocVo;
import com.erp.mterp.vo.product.ProductVo;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public interface DrawingLogicRepository extends JpaRepository<DrawingLogicDocVo, Long> {


    @Query(nativeQuery = true, value = "SELECT\n"
            + "	count(1)\n"
            + "FROM\n"
            + "	drawing_logic_doc \n"
            + "WHERE\n"
            + "		case when ?1='' then 1=1 else \n"
            + "		LOWER(concat(drawing_logic_doc.prefix,drawing_logic_doc.drawing_logic_doc_no)) like lower(concat('%',?1,'%')) end\n"
            + "	AND company_id = ?2 \n"
            + "	AND is_deleted = ?3")
    Integer countOfDLDatatable(String serachValue, long companyId, int i);

    @Query(value = "select * from drawing_logic_doc\n" +
            "    where drawing_logic_doc.company_id=?1 and drawing_logic_doc.is_deleted=0 and "
            + "		case when ?2 ='' then 1=1 else \n"
            + "		LOWER(concat(drawing_logic_doc.prefix,drawing_logic_doc.drawing_logic_doc_no)) like lower(concat('%',?2,'%')) \n"
            + " end order by drawing_logic_doc_id desc\n"
            + " limit ?3 offset ?4",nativeQuery = true)
    List<DrawingLogicDocVo> findDLData(long companyId, String serachValue, int length, int offset);

    @Query(value = "select * from drawing_logic_doc where drawing_logic_doc_id=?1 and company_id=?2",nativeQuery = true)
    DrawingLogicDocVo findBydrawingLogicDocId(long id, long companyId);

    @Query(value = "select * from product where is_deleted=0 and company_id=?1",nativeQuery = true)
    List<ProductVo> findProductByCompanyId(long companyId);

    @Query(value = "select coalesce(max(drawing_logic_doc_no),'0') from drawing_logic_doc where is_deleted=0 and company_id=?1 and prefix=?2",nativeQuery = true)
    String findNextDLNo(long companyId, String prefix);

    @Query(value = "select\n" +
            "    drawing_logic_doc_id,\n" +
            "    max(file_name) as file_name,\n" +
            "    max(file_path) as file_path,\n" +
            "    max(product_id) as product_id,\n" +
            "   max(drawing_logic_doc_no) as drawing_logic_doc_no,\n" +
            "    sum(costing) as costing,\n" +
            "    max( bom_no) as  bom_no,\n" +
            "    max(billofmaterial_id) as billofmaterial_id\n" +
            "from (\n" +
            "select dld.drawing_logic_doc_id,\n" +
            "       file_name,\n" +
            "       file_path,\n" +
            "       product_id,\n" +
            "       concat(prefix,drawing_logic_doc_no) as drawing_logic_doc_no,\n" +
            "       0 as costing,\n" +
            "       '' as bom_no,\n" +
            "       0 as billofmaterial_id\n" +
            "from drawing_logic_doc as dld\n" +
            "where dld.product_id=?1 and dld.company_id=?2\n" +
            "union all\n" +
            "select\n" +
            "    dld.drawing_logic_doc_id,\n" +
            "    dld.file_name,\n" +
            "    dld.file_path,\n" +
            "    dld.product_id,\n" +
            "    concat(dld.prefix,dld.drawing_logic_doc_no) as drawing_logic_doc_no,\n" +
            "    costing,\n" +
            "    concat(b.prefix,b.bom_no) as bom_no,\n" +
            "    b.billofmaterial_id\n" +
            "from planing_item_dl\n" +
            "inner join public.drawing_logic_doc dld on dld.drawing_logic_doc_id = planing_item_dl.drawing_logic_doc_id\n" +
            "inner join public.billofmaterial b on dld.drawing_logic_doc_id = b.drawing_logic_doc_id\n" +
            "         where planing_item_id=?3) as AA group by drawing_logic_doc_id ",nativeQuery = true)
    List<Map<String,String>> getdetailsByProductId(long id, long companyId,long planingItemId);
}