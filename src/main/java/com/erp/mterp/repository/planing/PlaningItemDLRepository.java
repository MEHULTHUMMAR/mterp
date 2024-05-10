package com.erp.mterp.repository.planing;

import com.erp.mterp.vo.planing.PlaningItemDLVo;
import com.erp.mterp.vo.planing.PlaningVo;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public interface PlaningItemDLRepository extends JpaRepository<PlaningItemDLVo, Long> {



}
