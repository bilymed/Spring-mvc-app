package com.app.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
//import org.springframework.data.jpa.repository.Query;


import com.app.entity.Category;
import com.app.entity.Question;
import com.app.entity.User;

public interface QuestionRepository extends JpaRepository<Question, Integer> {

	// @Query("select q from Question q where q.user = ?1")
	List<Question> findByUser(User user);
	
	List<Question> findByCategory(Category category);

}
