package com.example.FullStackBackEnd01.controller;

import com.example.FullStackBackEnd01.model.BreakfastList;
import com.example.FullStackBackEnd01.repository.BreakfastListRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/breakfasts")
public class BreakfastListController {
    
    @Autowired
    private BreakfastListRepository breakfastListRepository;

 // Get all breakfasts
    @GetMapping
    public List<BreakfastList> getAllBreakfasts() {
        return breakfastListRepository.findAll();
    }


    // Get a specific breakfast by ID
    @GetMapping("/{id}")
    public BreakfastList getBreakfastById(@PathVariable Long id) {
        return breakfastListRepository.findById(id).orElseThrow(() -> new RuntimeException("Breakfast not found"));
    }

    // Create a new breakfast
    @PostMapping
    public BreakfastList createBreakfast(@RequestBody BreakfastList breakfastList) {
        return breakfastListRepository.save(breakfastList);
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
        breakfastListRepository.deleteById(id);
    }
}
