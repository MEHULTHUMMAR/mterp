package com.erp.mterp.service.state;


import com.erp.mterp.vo.state.StateVo;

import java.util.List;
import java.util.Map;

public interface StateService {

    Iterable<StateVo> findByAll(String id);

    Iterable<StateVo> findAll();

    StateVo findByStateCode(String stateCode);

}