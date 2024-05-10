package com.erp.mterp.repository.city;

import com.erp.mterp.vo.city.CityVo;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.data.jpa.datatables.repository.DataTablesRepository;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import java.util.List;
import java.util.Map;


public interface CityRepository extends CrudRepository<CityVo, Long>, DataTablesRepository<CityVo, Long>, JpaRepository<CityVo, Long> {

    
	@Query("from CityVo where stateCode =:id")
    List<CityVo> findByStateCode(@Param("id") String id);

	@Cacheable(cacheNames ="City", key = "#cityCode",unless="#result == null")
    CityVo findByCityCode(String cityCode);


}
