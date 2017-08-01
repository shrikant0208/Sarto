package com.sixers.controller;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.sixers.model.SartoUser;

@Controller
public class UserTransactionController {

	@RequestMapping(value="/submitUserApplication" , method=RequestMethod.POST)
	public ModelAndView submitAdmissionForm(@Valid @ModelAttribute ("sartouser") SartoUser sartouser,BindingResult result){
		System.out.println("in controller");
		System.out.println(sartouser.getFirstName());
		
		if(result.hasErrors()){
			System.out.println("binding error:: "+result.getAllErrors());
			ModelAndView modelView= new ModelAndView("registration");
			return modelView;
		}
		
		ModelAndView modelView = new ModelAndView("admissionSucess");
		return modelView;
		}

	
}
