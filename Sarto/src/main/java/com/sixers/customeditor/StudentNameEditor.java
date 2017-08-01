package com.sixers.customeditor;

import java.beans.PropertyEditorSupport;

public class StudentNameEditor extends PropertyEditorSupport{

@Override
public void setAsText(String studentNames){
	
	if(studentNames.contains("Mr.") || studentNames.contains("Ms.")){
		setValue(studentNames);
		
	}else{
		studentNames="Ms."+studentNames;
	setValue(studentNames);
	}
		
}


}
