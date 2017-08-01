package com.sixers.annotation;

import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

import javax.validation.Constraint;
import javax.validation.Payload;

import com.sixers.annotationclasses.SkillValidator;

@Documented
@Target({ElementType.FIELD})
@Retention(RetentionPolicy.RUNTIME)
@Constraint(validatedBy=SkillValidator.class)
public @interface IsValidSkill {
	
	
	String[] skills();

	String message() default "Please Provide a Valid Skill : "
			+ "Java,DB,C++ (choose anyone)";

	Class<?>[] groups() default { };

	Class<? extends Payload>[] payload() default { };
	
	
}
