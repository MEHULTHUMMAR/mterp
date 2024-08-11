package com.erp.mterp.repository.planing;

import com.erp.mterp.vo.planing.PlaningVo;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;
import java.util.List;
import java.util.Map;

@Repository
public interface PlaningRepository extends JpaRepository<PlaningVo, Long> {


    @Query(value = "select coalesce(max(planing_no),'0') from planing where is_deleted=0 and company_id=?1 and prefix=?2",nativeQuery = true)
    String findNextPlaningNo(long companyId, String prefix);

    @Query(nativeQuery = true, value = "SELECT\n"
            + "	count(1)\n"
            + "FROM\n"
            + "	planing \n"
            + "WHERE\n"
            + "		case when ?1='' then 1=1 else \n"
            + "		(LOWER(concat(prefix,planing_no)) like lower(concat('%',?1,'%')) )\n end"
             + "	AND company_id = ?2 \n"
            + "	AND is_deleted = ?3")
    Integer countOfPlaningDatatable(String serachValue, long companyId, int i);

    @Query(value = "select\n" +
            "    planing_id,\n" +
            "    planing_date,\n" +
            "    planing.status,\n" +
            "    concat(planing.prefix,planing_no) as planing_no,\n" +
            "    concat(q.prefix,enquire_no) as enquire_no,\n" +
            "    q.enquire_id,\n" +
            "    c.company_name\n" +
            "from planing\n" +
            "inner join public.contact c on c.contact_id = planing.contact_id\n" +
            "inner join public.enquire q on q.enquire_id = planing.enquire_id\n" +
            "         where planing.company_id=?1 and planing.is_deleted=0\n" +
            "and lower(concat(planing.prefix,planing_no)) ilike concat('%',?2,'%')"
            + "order by planing_id desc limit ?3 offset ?4 ",nativeQuery = true)
    List<Map<String, String>> findPlaningData(long companyId, String serachValue, int length, int offset);

    PlaningVo findByPlaningIdAndCompanyId(long id, long companyId);

    @Query(value = "update planing_item set cost = (select coalesce(sum(bom_total),0) from billofmaterial where planingitem_id=?1) where planing_item_id=?1\n",nativeQuery = true)
    @Modifying
    @Transactional
    void updateplaningItemCost(Long planingItemId);

    @Query(value = "select concat(prefix,planing_no) as planing_no,planing_id,planing_date from planing where is_deleted=0 and company_id=?1",nativeQuery = true)
    List<Map<String,String>> findPlaningForQuotation(long companyId);
}
