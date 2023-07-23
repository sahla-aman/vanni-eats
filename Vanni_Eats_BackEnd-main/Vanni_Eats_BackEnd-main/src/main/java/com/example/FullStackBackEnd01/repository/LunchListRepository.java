package com.example.FullStackBackEnd01.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.FullStackBackEnd01.model.LunchList;

public interface LunchListRepository extends JpaRepository<LunchList, Long> {

}
