package com.app.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.app.entity.Answer;
import com.app.entity.Question;
import com.app.service.AnswerService;
import com.app.service.CategoryService;
import com.app.service.QuestionService;
import com.app.service.UserService;

@Controller
public class QuestionController {

	@Autowired
	private UserService userService;
	@Autowired
	private QuestionService questionService;
	@Autowired
	private CategoryService categoryService;
	@Autowired
	private AnswerService answerService;

	@ModelAttribute("question")
	public Question constructQuestion() {
		return new Question();
	}

	@RequestMapping("/index")
	public String home(Model model) {
		model.addAttribute("categories", categoryService.findAll());
		return "index";
	}

	@RequestMapping("/questions/{id}")
	public String question(Model model, @PathVariable int id) {
		model.addAttribute("question", questionService.findWithAnswers(id));
		return "question";
	}

	@RequestMapping("/userquestions")
	public String account(Model model, Principal principal) {
		String name = principal.getName();
		model.addAttribute("user", userService.findOneWidthQuestions(name));
		model.addAttribute("categories", categoryService.findAll());
		return "userquestions";
	}

	@RequestMapping(value = "/userquestions", method = RequestMethod.POST)
	public String addQuestion(@ModelAttribute("question") Question question, Principal principal, @RequestParam Integer catId) {
		String name = principal.getName();
		questionService.save(question, name, catId);
		return "redirect:/userquestions.html";
	}

	@RequestMapping("/userquestiondetail/{id}")
	public String userquestiondetail(Model model, Principal principal, @PathVariable int id) {
		model.addAttribute("question", questionService.findWithAnswers(id));
		return "userquestiondetail";
	}

	@RequestMapping(value = "/question/remove/{id}")
	public String removeQuestion(@PathVariable int id) {
		questionService.remove(id);
		return "redirect:/userquestions.html";
	}

	@ModelAttribute("answer")
	public Answer constructAnswer() {
		return new Answer();
	}

	@RequestMapping(value = "/questions/{id}", method = RequestMethod.POST)
	public String addAnswer(@ModelAttribute("answer") Answer answer, @PathVariable int id, Principal principal) {
		Answer newanswer = new Answer();
		newanswer.setContent(answer.getContent());
		String name = principal.getName();
		answerService.save(newanswer, id, name);
		return "redirect:/questions/{id}.html";
	}

}
