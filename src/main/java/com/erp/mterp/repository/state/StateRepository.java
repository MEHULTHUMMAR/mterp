package com.erp.mterp.repository.state;

import com.erp.mterp.vo.state.StateVo;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public interface StateRepository extends CrudRepository<StateVo, Long> {
    
	@Query("from StateVo where countriesCode =:id")
    Iterable<StateVo> findByCountriesCode(@Param("id") String id);

    StateVo findByStateCode(String stateCode);
}