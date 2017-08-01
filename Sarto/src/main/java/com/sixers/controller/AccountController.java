package com.sixers.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.validation.Valid;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.sixers.customeditor.StudentNameEditor;
import com.sixers.model.Student;


@Controller

public class AccountController {

	@InitBinder
	public void initBinder(WebDataBinder webBinder){
	//	webBinder.setDisallowedFields(new String [] {"studentMobile","address.pincode"});
	SimpleDateFormat simpleDate= new SimpleDateFormat("yyyy****MM**dd");
	webBinder.registerCustomEditor(Date.class,"DOB", new CustomDateEditor(simpleDate, false));
	webBinder.registerCustomEditor(String.class,"studentName", new StudentNameEditor());
	}
	
	
	@RequestMapping(value="/getAdmissionForm" , method=RequestMethod.GET)
	public ModelAndView getAdmissionForm(){
		/*String exceptionName="NULL_POINTER";
		
		if(exceptionName.equalsIgnoreCase("NULL_POINTER")){
			throw new NullPointerException();
		}else if(exceptionName.equalsIgnoreCase("ARITHMATIC_EXCEPTION")) {
			throw new ArithmeticException();
		}
		*/
		
		ModelAndView modelView = new ModelAndView("AdmissionFile");
		return modelView;
		}
	
	@ModelAttribute
	public  void addSameObjects(Model modelView){
		modelView.addAttribute("HEADERNAME","Hi , This is Retail Tao....");
	}
	
	
	@RequestMapping(value="/submitAdmissionForm" , method=RequestMethod.POST)
	public ModelAndView submitAdmissionForm(@Valid @ModelAttribute ("student") Student student,BindingResult result){
		
		if(result.hasErrors()){
			ModelAndView modelView= new ModelAndView("AdmissionFile");
			return modelView;
		}
		
		ModelAndView modelView = new ModelAndView("admissionSucess");
		return modelView;
		}

	
	
	
}
