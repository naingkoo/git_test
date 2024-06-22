package com.student.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.student.models.Login;
import com.student.models.User;
import com.student.persistance.UserRepository;

@Controller
public class Logincontrol {
	@Autowired
	UserRepository userRepo;
	
	@GetMapping("/home")
	public String homepage(Model m) {

		return "welcomeHomePage";
		
	}



		@GetMapping("/")
		public ModelAndView login(HttpSession session) {
			User loginedUser=(User) session.getAttribute("loginedUser");
			if(loginedUser==null) {
				return new ModelAndView("index", "login", new Login());
			}else {
				return new ModelAndView("frame", "loginedUser", loginedUser);
			}
		}
		
	@PostMapping("loginSubmit")
	public String loginSubmit(@Validated @ModelAttribute("login") Login login, BindingResult bresult,Model m,HttpSession session) {
		if (bresult.hasErrors()) {
			return "index";
		} else {
			User user = userRepo.getByUsername(login.getUsername(), login.getPassword());
			if (user != null) {
				// create session 
				session.setAttribute("loginedUser", user);
				
				return "welcomeHomePage";
			} else {
				m.addAttribute("login_error", "Invalid username or password");
				return "index";
			}

		}

	}
	
	@GetMapping("logOut")
	public String logOut(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}

}
