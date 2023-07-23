package com.example.FullStackBackEnd01.controller;

import com.example.FullStackBackEnd01.model.DesertList;
import com.example.FullStackBackEnd01.model.DinnerList;
import com.example.FullStackBackEnd01.repository.DesertListRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/desert")
public class DesertListController {

    @Autowired
    private DesertListRepository desertListRepository;

    @GetMapping
    public List<DesertList> getAllDinnerLists() {
        return desertListRepository.findAll();
    }

    @GetMapping("/{id}")
    public DesertList getDinnerListById(@PathVariable Long id) {
        return desertListRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Dinner list not found"));
    }

    @PostMapping
    public DesertList createDinnerList(@RequestBody DesertList desertList) {
        return desertListRepository.save(desertList);
    }

    @PutMapping("/{id}")
    public DesertList DinnerListupdateDinnerList(@PathVariable Long id, @RequestBody DinnerList updatedDinnerList) {
    	DesertList dinnerList = desertListRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Dinner list not found"));

        dinnerList.setName(updatedDinnerList.getName());
        dinnerList.setDescription(updatedDinnerList.getDescription());
        dinnerList.setPrice(updatedDinnerList.getPrice());

        return desertListRepository.save(dinnerList);
    }

    @DeleteMapping("/{id}")
    public void deleteDinnerList(@PathVariable Long id) {
        DesertList desertList = desertListRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Dinner list not found"));

        desertListRepository.delete(desertList);
    }
}
