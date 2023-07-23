package com.example.FullStackBackEnd01.controller;


import com.example.FullStackBackEnd01.model.TeaTimeEvening;

import com.example.FullStackBackEnd01.repository.TeaTimeEveningRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/evening")
public class TeaTimeEveningController {
    
    @Autowired
    private TeaTimeEveningRepository teaTimeEveningtRepository;

 // Get all breakfasts
    @GetMapping
    public List<TeaTimeEvening> getAllBreakfasts() {
        return teaTimeEveningtRepository.findAll();
    }


    // Get a specific breakfast by ID
    @GetMapping("/{id}")
    public TeaTimeEvening getBreakfastById(@PathVariable Long id) {
        return teaTimeEveningtRepository.findById(id).orElseThrow(() -> new RuntimeException("Breakfast not found"));
    }

    // Create a new breakfast
    @PostMapping
    public TeaTimeEvening createBreakfast(@RequestBody TeaTimeEvening teatimeList) {
        return teaTimeEveningtRepository.save(teatimeList);
    }

//    // Update an existing breakfast
//    @PutMapping("/{id}")
//    public BreakfastList updateBreakfast(@PathVariable Long id, @RequestBody BreakfastList updatedBreakfast) {
//        BreakfastList breakfastList = breakfastListRepository.findById(id).orElseThrow(() -> new RuntimeException("Breakfast not found"));
//        breakfastList.setname(updatedBreakfast.getname());
//        return breakfastListRepository.save(breakfastList);
//    }

    // Delete a breakfast by ID
    @DeleteMapping("/{id}")
    public void deleteBreakfast(@PathVariable Long id) {
    	teaTimeEveningtRepository.deleteById(id);
    }
}
