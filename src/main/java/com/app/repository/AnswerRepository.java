package com.app.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.app.entity.Answer;
import com.app.entity.Question;

public interface AnswerRepository extends JpaRepository<Answer, Integer> {
	
	List<Answer> findByQuestion(Question question);

}
