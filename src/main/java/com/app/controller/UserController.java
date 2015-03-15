package com.app.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.app.entity.User;
import com.app.service.UserService;

@Controller
public class UserController {

	@Autowired
	private UserService userService;

	User user = new User();

	@RequestMapping("/users")
	public String users(Model model) {
		model.addAttribute("users", userService.findAll());
		return "users";
	}

	@RequestMapping(value = "/user")
	public String addQuestion(Model model, Principal principal) {
		model.addAttribute("user", userService.findByName(principal.getName()));
		return "user";
	}

	@RequestMapping("/users/{id}")
	public String user(Model model, @PathVariable int id) {
		// model.addAttribute("user", userService.findOneWidthQuestions(id));
		model.addAttribute("user", userService.findOne(id));
		return "user";
	}

}
