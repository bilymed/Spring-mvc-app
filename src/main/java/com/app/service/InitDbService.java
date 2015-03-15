package com.app.service;

import javax.annotation.PostConstruct;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.app.entity.Answer;
import com.app.entity.Category;
import com.app.entity.User;
import com.app.repository.AnswerRepository;
import com.app.repository.CategoryRepository;
import com.app.repository.QuestionRepository;
import com.app.repository.UserRepository;
import com.app.entity.Question;

@Transactional
@Service
public class InitDbService {

	@Autowired
	private UserRepository userRepository;

	@Autowired
	private QuestionRepository questionRepository;

	@Autowired
	private CategoryRepository categoryRepository;

	@Autowired
	private AnswerRepository answerRepository;

	@PostConstruct
	public void init() {

		if (userRepository.findByName("admin") == null) {

			BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();

			User userAdmin = new User();
			userAdmin.setName("admin");
			userAdmin.setRole("ROLE_ADMIN");
			userAdmin.setEnabled(true);
			userAdmin.setPassword(encoder.encode("admin"));
			userRepository.save(userAdmin);

			User user1 = new User();
			user1.setName("user1");
			user1.setRole("ROLE_USER");
			user1.setEnabled(true);
			user1.setPassword(encoder.encode("password"));
			userRepository.save(user1);

			User user2 = new User();
			user2.setName("user2");
			user2.setRole("ROLE_USER");
			user2.setEnabled(true);
			user2.setPassword(encoder.encode("password2"));
			userRepository.save(user2);
			
			User user3 = new User();
			user3.setName("user3");
			user3.setRole("ROLE_USER");
			user3.setEnabled(true);
			user3.setPassword(encoder.encode("password3"));
			userRepository.save(user3);

			Category category1 = new Category();
			category1.setName("Java EE");
			categoryRepository.save(category1);

			Category category2 = new Category();
			category2.setName(".Net Framework");
			categoryRepository.save(category2);

			Category category3 = new Category();
			category3.setName("Play framework");
			categoryRepository.save(category3);
			
			Category category5 = new Category();
			category5.setName("Vaadin");
			categoryRepository.save(category5);
			
			Category category4 = new Category();
			category4.setName("GWT");
			categoryRepository.save(category4);
			
			

			Question question1 = new Question();
			question1.setTitle("JPA OneToMany not deleting child ?");
			question1.setContent("I have a problem with a simple OneToMany " + "mapping between a parent and a child entity. All works well, "
					+ "only that child records are not deleted when i remove them " + "from the collection.");
			question1.setCategory(category1);
			question1.setUser(user1);
			questionRepository.save(question1);

			Question question2 = new Question();
			question2.setTitle("Problems with Self-referencing classes in Hibernate");
			question2.setContent("I have an entity that models the parent/child structure, here is my hibernate mapping file"
					+ "My problem is that the association many-to-one generates exception whenever I try to display the object in the view");
			question2.setCategory(category1);
			question2.setUser(user2);
			questionRepository.save(question2);

			Question question3 = new Question();
			question3.setTitle("RESTful on Play framework");
			question3.setContent("We are planning a project primarily serving content to mobile apps, but need to have a website."
					+ " My question is whether is makes sense to use Jersey or Restlet to develop REST APIs for our mobile apps, and then use Play! to serve the website.");
			question3.setCategory(category3);
			question3.setUser(user3);
			questionRepository.save(question3);

			Answer answer1 = new Answer();
			answer1.setContent("You need to either use vendor-specific extensions " + "to force this behaviour or explicitly delete the child " + "AND remove it from the parent's collection.");
			answer1.setQuestion(question1);
			answer1.setUser(user2);
			answerRepository.save(answer1);

			Answer answer2 = new Answer();
			answer2.setContent("answer2");
			answer2.setQuestion(question3);
			answer2.setUser(user1);
			answerRepository.save(answer2);

		}
	}

}
