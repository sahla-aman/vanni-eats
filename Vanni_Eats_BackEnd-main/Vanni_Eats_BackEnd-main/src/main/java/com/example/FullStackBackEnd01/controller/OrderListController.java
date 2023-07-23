package com.example.FullStackBackEnd01.controller;


import com.example.FullStackBackEnd01.model.OrderList;

import com.example.FullStackBackEnd01.repository.OrderListRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/order")
public class OrderListController {
    
    @Autowired
    private OrderListRepository orderListRepository;

 // Get all breakfasts
    @GetMapping
    public List<OrderList> getAllBreakfasts() {
        return orderListRepository.findAll();
    }


    // Get a specific breakfast by ID
    @GetMapping("/{id}")
    public OrderList getBreakfastById(@PathVariable Long id) {
        return orderListRepository.findById(id).orElseThrow(() -> new RuntimeException("Breakfast not found"));
    }

    // Create a new breakfast
    @PostMapping
    public OrderList createBreakfast(@RequestBody OrderList orderList) {
        return orderListRepository.save(orderList);
    }

//    // Update an existing breakfast
//    @PutMapping("/{id}")
//    public BreakfastList updateBreakfast(@PathVariable Long id, @RequestBody BreakfastList updatedBreakfast) {
//        BreakfastList breakfastList = breakfastListRepository.findById(id).orElseThrow(() -> new RuntimeException("Breakfast not found"));
//        breakfastList.setname(updatedBreakfast.getname());
//        return breakfastListRepository.save(breakfastList);
//    }

 
    
    @PutMapping("/{id}")
    public OrderList updateOrder(@PathVariable Long id, @RequestBody OrderList updatedOrder) {
        OrderList order = orderListRepository.findById(id).orElseThrow(() -> new RuntimeException("Order not found"));
        order.setFoodname(updatedOrder.getFoodname());
        order.setLocation(updatedOrder.getLocation());
        order.setDate(updatedOrder.getDate());
        order.setTime(updatedOrder.getTime());
        order.setCount(updatedOrder.getCount());
        order.setPrice(updatedOrder.getPrice());
        order.setFoodType(updatedOrder.getFoodType());
        order.setStatus(updatedOrder.getStatus());
        return orderListRepository.save(order);
    }
    
  

  

}
