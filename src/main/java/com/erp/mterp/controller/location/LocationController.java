package com.erp.mterp.controller.location;

import com.erp.mterp.service.city.CityService;
import com.erp.mterp.service.country.CountryService;
import com.erp.mterp.service.state.StateService;
import com.erp.mterp.vo.city.CityVo;
import com.erp.mterp.vo.countries.CountriesVo;
import com.erp.mterp.vo.state.StateVo;
import lombok.extern.java.Log;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Log
@Controller
@RequestMapping("/location")
public class LocationController {
	@Autowired
	CountryService countryService;
	@Autowired
	CityService cityService;
	@Autowired
	StateService stateService;



	@RequestMapping("/city/{id}")
	@ResponseBody
	public Iterable<CityVo> findcity(@PathVariable(value = "id") String id) {

		return cityService.findByAll(id);
	}

	@RequestMapping("/state/{id}")
	@ResponseBody
	@Transactional(readOnly = true)
	public Iterable<StateVo> findState(@PathVariable(value = "id") String id) {
		return stateService.findByAll(id);
	}

	@RequestMapping("/country")
	@ResponseBody
	@Transactional(readOnly = true)
	public List<CountriesVo> findCountry() {
		return countryService.findAllCountries();
	}


}
