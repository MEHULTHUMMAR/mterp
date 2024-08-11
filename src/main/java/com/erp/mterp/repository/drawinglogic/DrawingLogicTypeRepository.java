package com.erp.mterp.repository.drawinglogic;

import com.erp.mterp.dto.dl_type.DLTypeCUSTOMSelectItemDTO;
import com.erp.mterp.vo.drawinglogic.DrawingLogicTypeVo;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface DrawingLogicTypeRepository extends JpaRepository<DrawingLogicTypeVo, Long> {

    @Query(value = "select drawing_logic_type_id as id,\n" +
            "       concat(dl_type_code,' - ',dl_type_name) as text,\n" +
            "       dl_type_code as code,\n" +
            "       dl_type_name as name,\n" +
            "       dl_type as type from drawing_logic_type where company_id=?2 and dl_type=?3 and concat(dl_type_code,dl_type_name) ilike concat('%',?1,'%')\n", nativeQuery = true)
    List<DLTypeCUSTOMSelectItemDTO> findDLTypeData(String searchValue, long companyId, String type);
}
