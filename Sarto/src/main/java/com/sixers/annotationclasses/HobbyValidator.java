package com.sixers.annotationclasses;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

import com.sixers.annotation.IsValidHobby;

public class HobbyValidator implements ConstraintValidator<IsValidHobby,String> {

	private String listOfHobbies;
	@Override
	public void initialize(IsValidHobby constraintAnnotation) {
		// TODO Auto-generated method stub
		this.listOfHobbies=constraintAnnotation.listOfHobbies();
	}

	@Override
	public boolean isValid(String studentHobby, ConstraintValidatorContext context) {
		// TODO Auto-generated method stub
		if(studentHobby==null)
			return false;
		if(studentHobby.matches(listOfHobbies))
			return true;
		else
		return false;
	}

	
}
