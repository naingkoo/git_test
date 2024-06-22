package com.student.models;

import javax.validation.constraints.NotEmpty;

public class Course {
	@NotEmpty(message="Please Enter Course Id")
	private String id;
	
	@NotEmpty(message="Please Enter Course Name")
	private String course_name;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getCourse_name() {
		return course_name;
	}

	public void setCourse_name(String course_name) {
		this.course_name = course_name;
	}

	@Override
	public String toString() {
		return "Course [id=" + id + ", course_name=" + course_name + "]";
	}
	
	
	
	
	
	
}
