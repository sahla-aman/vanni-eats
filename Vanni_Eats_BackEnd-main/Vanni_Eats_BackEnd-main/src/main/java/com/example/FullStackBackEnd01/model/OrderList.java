package com.example.FullStackBackEnd01.model;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.SequenceGenerator;

@Entity
public class OrderList {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "orderlist_seq")
    @SequenceGenerator(name = "breakfast_seq", sequenceName = "orderlist_seq", allocationSize = 1)
    private Long id;
    private long userid;
    private String foodname;
    private String date;
    private String time;
    private String location;
    private String count;
    private double price;
    private String foodType;
    private String status;

   

    public OrderList() {
    }

    public OrderList(String name, String location, String date, String time,String foodname, double price,long userid, String foodType,String status) {
        this.setFoodname(foodname);
        this.setUserid(userid);
        this.price = price;
        this.location=location;
        this.setTime(time);
        this.date=date;
        this.foodType=foodType;
        this.status=status;
        		
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

  

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getCount() {
		return count;
	}

	public void setCount(String count) {
		this.count = count;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getFoodname() {
		return foodname;
	}

	public void setFoodname(String foodname) {
		this.foodname = foodname;
	}

	public long getUserid() {
		return userid;
	}

	public void setUserid(long userid) {
		this.userid = userid;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getFoodType() {
		return foodType;
	}

	public void setFoodType(String foodType) {
		this.foodType = foodType;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
}
