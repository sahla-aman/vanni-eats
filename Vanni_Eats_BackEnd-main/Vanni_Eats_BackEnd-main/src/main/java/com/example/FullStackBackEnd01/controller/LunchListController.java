package com.example.FullStackBackEnd01.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import com.example.FullStackBackEnd01.model.LunchList;
import com.example.FullStackBackEnd01.repository.LunchListRepository;

@RestController
@RequestMapping("/lunch")
public class LunchListController {

    @Autowired
    private LunchListRepository lunchListRepository;

    // Get all lunch items
    @GetMapping("/list")
    public List<LunchList> getAllLunchItems() {
        return lunchListRepository.findAll();
    }

    // Create a new lunch item
    @PostMapping("/create")
    public LunchList createLunchItem(@RequestBody LunchList lunchItem) {
        return lunchListRepository.save(lunchItem);
    }

    // Update an existing lunch item
    @PutMapping("/update/{id}")
    public ResponseEntity<LunchList> updateLunchItem(@PathVariable Long id, @RequestBody LunchList lunchItem) {
        Optional<LunchList> lunchItemOptional = lunchListRepository.findById(id);

        if (!lunchItemOptional.isPresent()) {
            return ResponseEntity.notFound().build();
        }

        lunchItem.setId(id);
        LunchList updatedLunchItem = lunchListRepository.save(lunchItem);
        return new ResponseEntity<>(updatedLunchItem, HttpStatus.OK);
    }

    // Delete a lunch item
    @DeleteMapping("/delete/{id}")
    public ResponseEntity<LunchList> deleteLunchItem(@PathVariable Long id) {
        Optional<LunchList> lunchItemOptional = lunchListRepository.findById(id);

        if (!lunchItemOptional.isPresent()) {
            return ResponseEntity.notFound().build();
        }

        lunchListRepository.delete(lunchItemOptional.get());
        return ResponseEntity.ok().build();
    }
}
