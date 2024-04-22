package com.erp.mterp.controller.dashboard;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class DashboardController {

	@GetMapping(value = { "/dashboard", "", "/" })
	public ModelAndView dashboard(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("dashboard/dashboard");
		return mv;
	}
}
