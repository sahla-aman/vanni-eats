package com.example.FullStackBackEnd01.model;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.SequenceGenerator;

@Entity
public class DinnerList {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "dinner_seq")
    @SequenceGenerator(name = "dinner_seq", sequenceName = "dinner_seq", allocationSize = 1)
    private Long id;
    private String name;
    private String description;
    private double price;

    public DinnerList() {
    }

    public DinnerList(String name, String description, double price) {
        this.name = name;
        this.description = description;
        this.price = price;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }
}
