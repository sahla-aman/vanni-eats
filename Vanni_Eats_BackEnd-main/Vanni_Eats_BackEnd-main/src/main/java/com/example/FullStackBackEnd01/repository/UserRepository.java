package com.example.FullStackBackEnd01.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.FullStackBackEnd01.model.User;

public interface UserRepository extends JpaRepository <User,Long>{
	User findByUsernameAndEmail(String username, String email);

}
