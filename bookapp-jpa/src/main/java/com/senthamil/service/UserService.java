package com.senthamil.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.senthamil.form.RegistrationForm;
import com.senthamil.model.User;
import com.senthamil.repository.UserRepository;
import com.senthamil.util.EmailUtil;

@Service
public class UserService {

	@Autowired
	private UserRepository userRepository;

	@Autowired
	private EmailUtil emailUtil;
	
	PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();

	public User findByEmailAndPassword(String email, String password) {
		User u=userRepository.findByEmail(email);
		boolean isValid = passwordEncoder.matches(password,u.getPassword());
		if(isValid)
		return userRepository.findByEmailAndPassword(email,u.getPassword());
		else 
			return null;
	}

	public void register(RegistrationForm regUserForm) throws Exception {

		User user = userRepository.findByEmail(regUserForm.getEmail());
		System.out.println("Is email already exists? " + user);
		if (user != null) {
			throw new Exception("Email already exists!!!");
		}
		
		String hashedPassword = passwordEncoder.encode(regUserForm.getPassword());
		System.out.println(hashedPassword);
		User userObj = new User();
		userObj.setName(regUserForm.getName());
		userObj.setEmail(regUserForm.getEmail());
		userObj.setPassword(hashedPassword);
		userObj.setActive(true);

		userRepository.save(userObj);

		// Send Registration Notification Mail
		String subject = "Your account has been created";
		String body = "Welcome to Revature ! You can login to your account !";
		// emailUtil.send(user.getEmail(), subject, body);

	}

	public List<User> findAll() {
		return userRepository.findAll();
	}

	public User findOne(Long id) {
		return userRepository.findOne(id);
	}

}
