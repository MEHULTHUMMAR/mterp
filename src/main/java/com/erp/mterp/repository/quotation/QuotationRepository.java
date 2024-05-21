package com.erp.mterp.repository.quotation;

import com.erp.mterp.vo.planing.PlaningVo;
import com.erp.mterp.vo.quotation.QuotationVo;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;
import java.util.List;
import java.util.Map;

@Repository
public interface QuotationRepository extends JpaRepository<QuotationVo, Long> {


    @Query(value = "select coalesce(max(quotation_no),'0') from quotation where is_deleted=0 and company_id=?1 and prefix=?2",nativeQuery = true)
    String findNextQuotationNo(long companyId, String prefix);

    @Query(nativeQuery = true, value = "SELECT\n"
            + "	count(1)\n"
            + "FROM\n"
            + "	quotation \n"
            + "WHERE\n"
            + "		case when ?1='' then 1=1 else \n"
            + "		(LOWER(concat(prefix,quotation_no)) like lower(concat('%',?1,'%')) )\n end"
             + "	AND company_id = ?2 \n"
            + "	AND is_deleted = ?3")
    Integer countOfQuotationDatatable(String serachValue, long companyId, int i);

    @Query(value = "select\n" +
            "    quotation_id,\n" +
            "    quotation_date,\n" +
            "    quotation.status,\n" +
            "    concat(quotation.prefix,quotation_no) as quotation_no,\n" +
            "    concat(p.prefix,planing_no) as planing_no,\n" +
            "    p.planing_id,\n" +
            "    c.name,\n" +
            "    total\n" +
            "from quotation\n" +
            "inner join public.contact c on c.contact_id = quotation.contact_id\n" +
            "inner join public.planing p on p.planing_id = quotation.planing_id\n" +
            "         where quotation.company_id=?1 and quotation.is_deleted=0\n" +
            "and lower(concat(quotation.prefix,quotation_no)) ilike concat('%',?2,'%')"
            + "order by quotation_id desc limit ?3 offset ?4 ",nativeQuery = true)
    List<Map<String, String>> findQuotationData(long companyId, String serachValue, int length, int offset);

//    PlaningVo findByPlaningIdAndCompanyId(long id, long companyId);

    @Query(value = "update planing_item set cost = (select coalesce(sum(bom_total),0) from billofmaterial where planingitem_id=?1) where planing_item_id=?1\n",nativeQuery = true)
    @Modifying
    @Transactional
    void updateplaningItemCost(Long planingItemId);

    QuotationVo findByQuotationIdAndCompanyId(long id, long companyId);
}
