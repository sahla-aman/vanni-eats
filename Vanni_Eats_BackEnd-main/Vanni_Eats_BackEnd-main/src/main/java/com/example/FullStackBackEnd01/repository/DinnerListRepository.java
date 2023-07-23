package com.example.FullStackBackEnd01.repository;

import com.example.FullStackBackEnd01.model.DinnerList;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface DinnerListRepository extends JpaRepository<DinnerList, Long> {
}
