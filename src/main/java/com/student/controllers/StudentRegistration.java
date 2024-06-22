package com.student.controllers;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.student.models.Course;
import com.student.models.Student;
import com.student.persistance.CourseRepository;
import com.student.persistance.StudentRepository;
import com.student.persistance.UserRepository;

@Controller
public class StudentRegistration {
	@Autowired
	StudentRepository studentRepo;
	@Autowired
	CourseRepository courseRepo;

	@GetMapping("StudentRegistration")
	public ModelAndView addstudent(Model model) {
		Map<String, String> genderOptions = new LinkedHashMap<>();
        genderOptions.put("M", "Male");
        genderOptions.put("F", "Female");
        genderOptions.put("O", "Other");
        model.addAttribute("genders", genderOptions.entrySet());
        
        List<String> education=new ArrayList<>();
        education.add("Bachelor of Information Technology");
        education.add("Diploma in IT");
        education.add("Bachelor of Computer Science");
        model.addAttribute("education", education);
        
        System.out.println("call course");
      model.addAttribute("allcourses",courseRepo.getAll());
      
        
		return new ModelAndView("student_Registration","student",new Student());
	}

	@PostMapping("addStudent")
	public String addsStudent(@ModelAttribute("student")Student student,Model m) {
		System.out.println(student.getCourse());
		if(studentRepo.addStudent(student)!=0) {
			m.addAttribute("addStudentMsg","Registered Succesfully !");
		}
		
		return "student_Registration";
		
	}
	
	@GetMapping("SearchStudent")
	public ModelAndView searchStudent() {
		
		
		return new ModelAndView("searchStudent","student",new Student());
		
	}
}
