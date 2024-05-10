package com.erp.mterp.service.country;


import com.erp.mterp.vo.countries.CountriesVo;

import java.util.List;
import java.util.Map;

public interface CountryService {

    Iterable<CountriesVo> findAll();
    
    List<CountriesVo> findAllCountries();

    CountriesVo findByCountriesCode(String countriesCode);

}

