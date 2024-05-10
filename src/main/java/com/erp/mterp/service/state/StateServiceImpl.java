package com.erp.mterp.service.state;

import com.erp.mterp.repository.state.StateRepository;
import com.erp.mterp.vo.state.StateVo;
import lombok.extern.java.Log;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.exception.ExceptionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Optional;

@Service
@Log
public class StateServiceImpl implements StateService {
    @Autowired
    StateRepository stateRepository;

    public Iterable<StateVo> findByAll(String id) {//System.out.println(pointtableRepository.findByleadsource("LS").toString());
        return stateRepository.findByCountriesCode(id);

    }

    public Iterable<StateVo> findAll() {//System.out.println(pointtableRepository.findByleadsource("LS").toString());
        return stateRepository.findAll();

    }

    @Override
    public StateVo findByStateCode(String stateCode) {
        // TODO Auto-generated method stub
        return stateRepository.findByStateCode(stateCode);
    }

}


