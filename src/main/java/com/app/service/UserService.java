package com.app.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.app.entity.Question;
import com.app.entity.User;
import com.app.repository.QuestionRepository;
import com.app.repository.UserRepository;

@Service
@Transactional
public class UserService {

	@Autowired
	private UserRepository userRepository;

	@Autowired
	QuestionRepository questionRepository;

	public List<User> findAll() {
		return userRepository.findAll();
	}

	public User findOne(int id) {
		return userRepository.findOne(id);
	}
	
	public User findByName(String name) {
		return userRepository.findByName(name);
	}


	@Transactional
	public User findOneWidthQuestions(int id) {
		User user = this.findOne(id);
		List<Question> questions = questionRepository.findByUser(user);
		user.setQuestions(questions);
		return user;
	}

	public User findOneWidthQuestions(String name) {
		User user = userRepository.findByName(name);
		return this.findOneWidthQuestions(user.getId());
	}

	public void save(User user) {
		user.setEnabled(true);
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		user.setPassword(encoder.encode(user.getPassword()));
		user.setRole("ROLE_USER");
		userRepository.save(user);
	}

}
