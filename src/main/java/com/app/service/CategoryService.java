package com.app.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.entity.Category;
import com.app.entity.Question;
import com.app.repository.CategoryRepository;
import com.app.repository.QuestionRepository;

@Service
public class CategoryService {
	
	@Autowired
	private CategoryRepository categoryRepository;
	
	@Autowired
	QuestionRepository questionRepository;
	
	public List<Category> findAll(){
		return categoryRepository.findAll();
	}
	
	@Transactional
	public Category findOneWidthQuestions(int id) {
		Category category = categoryRepository.findOne(id);
		List<Question> questions = questionRepository.findByCategory(category);
		category.setQuestions(questions);
		return category;
	}

}
