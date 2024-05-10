package com.erp.mterp.service.country;

import com.erp.mterp.repository.country.CountryRepository;
import com.erp.mterp.vo.countries.CountriesVo;
import lombok.extern.java.Log;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;

@Service
@Transactional
@Log
public class CountryServiceImpl implements CountryService {
    @Autowired
    CountryRepository countryRepository;



    public Iterable<CountriesVo> findAll() {//System.out.println(pointtableRepository.findByleadsource("LS").toString());
        return countryRepository.findAll();

    }

    @Override
	public List<CountriesVo> findAllCountries() {
		// TODO Auto-generated method stub
		return countryRepository.findAllCountries();
	}



	@Override
    public CountriesVo findByCountriesCode(String countriesCode) {
        // TODO Auto-generated method stub
        try {
            return countryRepository.findByCountriesCode(countriesCode);
        } catch (Exception e) {
            // TODO: handle exception
            return new CountriesVo();
        }

    }
}
