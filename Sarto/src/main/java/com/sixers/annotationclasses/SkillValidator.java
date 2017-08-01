package com.sixers.annotationclasses;

import java.util.ArrayList;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

import com.sixers.annotation.IsValidSkill;

public class SkillValidator implements ConstraintValidator<IsValidSkill,ArrayList<String>>{

	@Override
	public void initialize(IsValidSkill constraintAnnotation) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public boolean isValid(ArrayList<String> value, ConstraintValidatorContext context) {
		// TODO Auto-generated method stub
		return false;
	}

	
}
 