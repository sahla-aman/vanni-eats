package com.example.FullStackBackEnd01.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.example.FullStackBackEnd01.exception.UserNotFoundException;
import com.example.FullStackBackEnd01.model.User;
import com.example.FullStackBackEnd01.repository.UserRepository;

@RestController

/*This will be using passing data from react project*/
@CrossOrigin("http://localhost:3000")
public class UserController {
	
	@Autowired
	private UserRepository userRepository;
	
	@PostMapping("/user")
	User newUser(@RequestBody User newUser) {
		return userRepository.save(newUser);
	}
	
	@GetMapping("/users")
	List<User> getAllUsers(){
		return userRepository.findAll();
	}
	
	
	@GetMapping("/user/{id}")
    User getUserById(@PathVariable Long id) {
        return userRepository.findById(id)
                .orElseThrow(() -> new UserNotFoundException(id));
    } 
	/*Edit user*/

	@PutMapping("/user/{id}")
	User updateUser(@RequestBody User newUser, @PathVariable Long id) {
	    return userRepository.findById(id)
	            .map(user -> {
	                user.setName(newUser.getName());
	                user.setEmail(newUser.getEmail());
	                user.setUsername(newUser.getUsername()); // Update username
	                // Update other fields as needed
	                return userRepository.save(user);
	            })
	            .orElseThrow(() -> new UserNotFoundException(id));
	}
	
	@PostMapping("/login")
	User loginUser(@RequestBody Map<String, String> loginData) {
	    String username = loginData.get("username");
	    String email = loginData.get("email");
	    User user = userRepository.findByUsernameAndEmail(username, email);
	    if (user == null) {
	        // handle invalid credentials
	    }
	    // handle valid credentials
	    return user;
	}

	
}
