package com.app.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.entity.Answer;
import com.app.entity.Category;
import com.app.entity.Question;
import com.app.entity.User;
import com.app.repository.AnswerRepository;
import com.app.repository.CategoryRepository;
import com.app.repository.QuestionRepository;
import com.app.repository.UserRepository;

@Service
public class QuestionService {

	@Autowired
	private QuestionRepository questionRepository;

	@Autowired
	private CategoryRepository categoryRepository;

	@Autowired
	private AnswerRepository answerRepository;

	@Autowired
	private UserRepository userRepository;

	public List<Question> findAll() {
		return questionRepository.findAll();
	}

	public List<Question> findByUser(User user) {
		return questionRepository.findByUser(user);
	}

	public List<Question> findByCategory(Category category) {
		return questionRepository.findByCategory(category);
	}

	public Question findOne(int id) {
		return questionRepository.findOne(id);
	}

	public Question findWithAnswers(int id) {
		Question question = this.findOne(id);
		List<Answer> answers = answerRepository.findByQuestion(question);
		question.setAnswers(answers);
		return question;
	}

	public void save(Question question, String name, Integer catId) {
		User user = userRepository.findByName(name);
		Category category = categoryRepository.findById(catId);
		question.setUser(user);
		question.setCategory(category);
		questionRepository.save(question);
	}

	public void remove(int id) {
		questionRepository.delete(id);
	}

}
