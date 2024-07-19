package com.erp.mterp.repository.enquire;

import com.erp.mterp.vo.enquire.EnquireVo;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public interface EnquireRepository extends JpaRepository<EnquireVo, Long> {


    @Query(value = "select coalesce(max(enquire_no),'0') from enquire where is_deleted=0 and company_id=?1 and prefix=?2",nativeQuery = true)
    String findNextEnquiryNo(long companyId, String prefix);

    @Query(nativeQuery = true, value = "SELECT\n"
            + "	count(1)\n"
            + "FROM\n"
            + "	enquire \n"
            + "WHERE\n"
            + "		case when ?1='' then 1=1 else \n"
            + "		(LOWER(concat(prefix,enquire_no)) like lower(concat('%',?1,'%')) )\n end"
             + "	AND company_id = ?2 \n"
            + "	AND is_deleted = ?3")
    Integer countOfEnquireDatatable(String serachValue, long companyId, int i);

    @Query(value = "select\n" +
            "    enquire_id,\n" +
            "    enquire_date,\n" +
            "    concat(enquire.prefix,enquire_no) as enquire_no,\n" +
            "    c.company_name\n" +
            "from enquire\n" +
            "inner join public.contact c on c.contact_id = enquire.contact_id\n" +
            "         where enquire.company_id=?1 and enquire.is_deleted=0\n" +
            "and lower(concat(enquire.prefix,enquire_no)) ilike concat('%',?2,'%')"
            + "order by enquire_id desc limit ?3 offset ?4 ",nativeQuery = true)
    List<Map<String, String>> findEnquiryData(long companyId, String serachValue, int length, int offset);

    EnquireVo findByEnquireIdAndCompanyId(long id, long companyId);

    @Query(value = "select concat(prefix,enquire_no) as enquire_no,enquire_id,enquire_date from enquire where is_deleted=0 and company_id=?1",nativeQuery = true)
    List<Map<String, String>> findEnquiryforPlaning(long companyId);
}
