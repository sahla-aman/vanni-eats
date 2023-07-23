// com.example.FullStackBackEnd01.repository.BreakfastListRepository.java
package com.example.FullStackBackEnd01.repository;


import com.example.FullStackBackEnd01.model.OrderList;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface OrderListRepository extends JpaRepository<OrderList, Long> {
	
    
}
