package com.app.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.entity.Answer;
import com.app.entity.Question;
import com.app.entity.User;
import com.app.repository.AnswerRepository;
import com.app.repository.QuestionRepository;
import com.app.repository.UserRepository;

@Service
public class AnswerService {

	@Autowired
	private AnswerRepository answerRepository;
	
	@Autowired
	private QuestionRepository questionRepository;
	
	@Autowired
	private UserRepository userRepository;

	public List<Answer> findAll() {
		return answerRepository.findAll();
	}

	public List<Answer> findByQuestion(Question question) {
		return answerRepository.findByQuestion(question);
	}
	
	public void save(Answer answer, int id, String name){
		User user = userRepository.findByName(name);
		Question question = questionRepository.findOne(id);
		answer.setQuestion(question);
		answer.setUser(user);
		answerRepository.save(answer);
	}

}
