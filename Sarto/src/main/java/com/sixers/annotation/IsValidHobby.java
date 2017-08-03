package com.sixers.annotation;

import static java.lang.annotation.ElementType.FIELD;
import static java.lang.annotation.RetentionPolicy.RUNTIME;

import java.lang.annotation.Documented;
import java.lang.annotation.Retention;
import java.lang.annotation.Target;

import javax.validation.Constraint;
import javax.validation.Payload;

import com.sixers.annotationclasses.HobbyValidator;


@Target({FIELD})
@Retention(RUNTIME)
@Documented
@Constraint(validatedBy = HobbyValidator.class)
public @interface IsValidHobby {
	
	/*CHECKING THE HOBBY VALID OR NOT*/
	
	String listOfHobbies() default ("Football|Tennis|Pool ");
	
	
	String message() default "Please Provide a Valid Hobby : "
			+ "Music, Dance,Cricket (choose anyone)";

	Class<?>[] groups() default { };

	Class<? extends Payload>[] payload() default { };
	
	
	

}
