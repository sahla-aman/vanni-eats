package com.example.FullStackBackEnd01.controller;

import com.example.FullStackBackEnd01.model.DinnerList;
import com.example.FullStackBackEnd01.repository.DinnerListRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/dinner-list")
public class DinnerListController {

    @Autowired
    private DinnerListRepository dinnerListRepository;

    @GetMapping
    public List<DinnerList> getAllDinnerLists() {
        return dinnerListRepository.findAll();
    }

    @GetMapping("/{id}")
    public DinnerList getDinnerListById(@PathVariable Long id) {
        return dinnerListRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Dinner list not found"));
    }

    @PostMapping
    public DinnerList createDinnerList(@RequestBody DinnerList dinnerList) {
        return dinnerListRepository.save(dinnerList);
    }

    @PutMapping("/{id}")
    public DinnerList updateDinnerList(@PathVariable Long id, @RequestBody DinnerList updatedDinnerList) {
        DinnerList dinnerList = dinnerListRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Dinner list not found"));

        dinnerList.setName(updatedDinnerList.getName());
        dinnerList.setDescription(updatedDinnerList.getDescription());
        dinnerList.setPrice(updatedDinnerList.getPrice());

        return dinnerListRepository.save(dinnerList);
    }

    @DeleteMapping("/{id}")
    public void deleteDinnerList(@PathVariable Long id) {
        DinnerList dinnerList = dinnerListRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Dinner list not found"));

        dinnerListRepository.delete(dinnerList);
    }
}
