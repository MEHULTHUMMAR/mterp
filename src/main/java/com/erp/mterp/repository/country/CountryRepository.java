package com.erp.mterp.repository.country;


import com.erp.mterp.vo.countries.CountriesVo;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import java.util.List;
import java.util.Map;

public interface CountryRepository extends CrudRepository<CountriesVo, Long> {
   
	CountriesVo findByCountriesCode(String countriesCode);

	@Query(value="select * from loc_countries order by countries_name",nativeQuery = true)
	List<CountriesVo> findAllCountries();

}
