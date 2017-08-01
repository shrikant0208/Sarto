package com.sixers.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class WelcomeController {

	@RequestMapping("/")
	public ModelAndView index() {
	ModelAndView modelView = new ModelAndView("Login");
		
	//	modelView.addObject("msg","hello arti");
		return modelView;
	}

	
/*	
@RequestMapping(value="/hi")
	public ModelAndView welcome(){
		ModelAndView modelView = new ModelAndView("register");
		
		modelView.addObject("msg","hi world");Mcubenewlogin
		return modelView;
		}*/
}
