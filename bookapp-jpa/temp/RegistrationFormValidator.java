package com.janani.validator;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.janani.form.RegistrationForm;

@Component
public class RegistrationFormValidator implements Validator{

	@Override
	public boolean supports(Class<?> clazz) {
		return RegistrationForm.class.equals(clazz);
	}

	@Override
	public void validate(Object obj, Errors e) {
		ValidationUtils.rejectIfEmptyOrWhitespace(e, "name", "Invalid Name");
		ValidationUtils.rejectIfEmptyOrWhitespace(e, "email", "Invalid Email" );
		ValidationUtils.rejectIfEmptyOrWhitespace(e, "password", "Invalid Password" );
		
	}

}
