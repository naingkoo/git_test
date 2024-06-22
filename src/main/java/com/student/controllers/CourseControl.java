package com.student.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.student.models.Course;
import com.student.persistance.CourseRepository;

@Controller
public class CourseControl {
	@Autowired
	CourseRepository courseRepo;
	
	@GetMapping("preAddCourse")
	public ModelAndView addcourse() {
		return new ModelAndView("course_reg","course",new Course());
		
	}
	
	@PostMapping("addCourse")
	public String addCourse(@Validated @ModelAttribute("course")Course course,BindingResult bresult, Model m) {
		System.out.println(course);
		if(bresult.hasErrors()) {
			
			return "course_reg";
		}else if(courseRepo.addCourse(course)!=0){
				m.addAttribute("result_msg","Registered Succesfully !");
				System.out.println("Registered Succesfully !");
				return "course_reg";
			}else {
				m.addAttribute("result_msg","insert error !");
				System.out.println("insert error !");
				return "course_reg";
			}
		}
		
	}


