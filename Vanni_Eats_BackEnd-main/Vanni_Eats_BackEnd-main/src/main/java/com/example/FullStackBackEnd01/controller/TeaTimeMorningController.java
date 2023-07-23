package com.example.FullStackBackEnd01.controller;


import com.example.FullStackBackEnd01.model.TeaTimeMorning;

import com.example.FullStackBackEnd01.repository.TeaTimeMorningRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/morning")
public class TeaTimeMorningController {
    
    @Autowired
    private TeaTimeMorningRepository teaTimeMorningRepository;

 // Get all breakfasts
    @GetMapping
    public List<TeaTimeMorning> getAllBreakfasts() {
        return teaTimeMorningRepository.findAll();
    }


    // Get a specific breakfast by ID
    @GetMapping("/{id}")
    public TeaTimeMorning getBreakfastById(@PathVariable Long id) {
        return teaTimeMorningRepository.findById(id).orElseThrow(() -> new RuntimeException("Breakfast not found"));
    }

    // Create a new breakfast
    @PostMapping
    public TeaTimeMorning createBreakfast(@RequestBody TeaTimeMorning teatimeList) {
        return teaTimeMorningRepository.save(teatimeList);
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
    	teaTimeMorningRepository.deleteById(id);
    }
}
