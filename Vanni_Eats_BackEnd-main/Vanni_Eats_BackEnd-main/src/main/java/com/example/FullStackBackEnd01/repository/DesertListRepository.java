// com.example.FullStackBackEnd01.repository.BreakfastListRepository.java
package com.example.FullStackBackEnd01.repository;

import com.example.FullStackBackEnd01.model.DesertList;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface DesertListRepository extends JpaRepository<DesertList, Long> {
}
