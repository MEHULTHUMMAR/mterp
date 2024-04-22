package com.erp.mterp.controller.pointsetup;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.erp.mterp.config.MenuPermission;
import com.erp.mterp.constant.Constant;
import com.erp.mterp.repository.pointsetup.PointSetupRepository;
import com.erp.mterp.vo.pointSetup.PointSetupVo;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping("/pointsetup")
public class PointSetupController {
	@Autowired
	PointSetupRepository pointSetupRepository;
	

    
    @RequestMapping(value = { "","/"})
    public ModelAndView coupon(HttpServletRequest request,HttpSession session) {

        ModelAndView view = new ModelAndView("pointsetup/pointsetup");
        if (MenuPermission.havePermission(session, Constant.COUPON, Constant.VIEW) == 1) {
        	  long companyId = Long.parseLong(session.getAttribute("companyId").toString());
        	PointSetupVo pointSetupVo=pointSetupRepository.findByCompanyId(companyId);
        	if (pointSetupVo == null) {
                view.addObject("pointRs", "");	
                view.addObject("pointSetupId", 0);
            } else {
            	view.addObject("pointRs", pointSetupVo.getPointRs());	
                view.addObject("pointSetupId", pointSetupVo.getPointSetupId());
            }
        } else {
            view.setViewName("accessdenied/accessdenied");
        }
        	
        return view;
    }
    
    @PostMapping(value = "/create")
    public String create(HttpSession session, @ModelAttribute("pointSetupVo") PointSetupVo pointSetupVo) {
    	  long companyId = Long.parseLong(session.getAttribute("companyId").toString());
    	
    	  pointSetupVo.setCompanyId(companyId);
    	  pointSetupRepository.save(pointSetupVo);
        
        return "redirect:/pointsetup";
    }


}
