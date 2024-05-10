package com.erp.mterp.repository.bom;

import com.erp.mterp.vo.bom.BillOfMaterialVo;
import com.erp.mterp.vo.enquire.EnquireVo;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Repository
public interface BOMRepository extends JpaRepository<BillOfMaterialVo, Long> {


    @Query(value = "select coalesce(max(bom_no),'0') from billofmaterial where is_deleted=0 and company_id=?1 and prefix=?2",nativeQuery = true)
    String findNextBOMNo(long companyId, String prefix);

    @Query(nativeQuery = true, value = "SELECT\n"
            + "	count(1)\n"
            + "FROM\n"
            + "	billofmaterial \n"
            + "WHERE\n"
            + "		case when ?1='' then 1=1 else \n"
            + "		(LOWER(concat(prefix,bom_no)) like lower(concat('%',?1,'%')) )\n end"
             + "	AND company_id = ?2 \n"
            + "	AND is_deleted = ?3")
    Integer countOfBOMDatatable(String serachValue, long companyId, int i);

    @Query(value = "select\n" +
            "    billofmaterial_id,\n" +
            "    bom_date,\n" +
            "    concat(billofmaterial.prefix,bom_no) as bom_no,\n" +
            "    concat(dl.prefix,drawing_logic_doc_no) as drawing_logic_doc_no,\n" +
            "    dl.drawing_logic_doc_id\n" +
            "    bom_total \n" +
            "from billofmaterial\n" +
            "inner join public.drawing_logic_doc dl on dl.drawing_logic_doc_id = billofmaterial.drawing_logic_doc_id\n" +
            "         where billofmaterial.company_id=?1 and billofmaterial.is_deleted=0\n" +
            "and lower(concat(billofmaterial.prefix,bom_no)) ilike concat('%',?2,'%')"
            + "order by billofmaterial_id desc limit ?3 offset ?4 ",nativeQuery = true)
    List<Map<String, String>> findBOMData(long companyId, String serachValue, int length, int offset);



    BillOfMaterialVo findByBillofmaterialIdAndCompanyId(long id, long companyId);


}
