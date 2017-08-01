package com.sixers.model;

import java.util.ArrayList;
import java.util.Date;

import javax.validation.constraints.Max;
import javax.validation.constraints.Past;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import com.sixers.annotation.IsValidHobby;

public class Student {
	
	
	@Pattern(regexp="[^0-9]*")
	private String studentName;
	
	@Size(min=2 , max=10)
	@IsValidHobby(listOfHobbies="Music|Dance|Cricket")

	private String studentHobby;
	
	@Max(2222)
	private Long studentMobile;
	
	@Past
	private Date DOB;
	

	private ArrayList<String> studentSkills;
	private Address address;
	
	
	
	
	

	public Address getAddress() {
		return address;
	}

	public void setAddress(Address address) {
		this.address = address;
	}

	public ArrayList<String> getStudentSkills() {
		return studentSkills;
	}

	public void setStudentSkills(ArrayList<String> studentSkills) {
		this.studentSkills = studentSkills;
	}

	public Long getStudentMobile() {
		return studentMobile;
	}

	public void setStudentMobile(Long studentMobile) {
		this.studentMobile = studentMobile;
	}

	public Date getDOB() {
		return DOB;
	}

	public void setDOB(Date dOB) {
		DOB = dOB;
	}

	public String getStudentName() {
		return studentName;
	}

	public void setStudentName(String studentName) {
		this.studentName = studentName;
	}

	public String getStudentHobby() {
		return studentHobby;
	}

	public void setStudentHobby(String studentHobby) {
		this.studentHobby = studentHobby;
	};
	
	
	
}
