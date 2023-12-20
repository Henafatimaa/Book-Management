package com.nagarro.training.model;



import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
/**Author HenaFatima*/

@Entity
@Table(name = "records")
public class Records implements Serializable  {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    
    @Column(name = "title", nullable=false)
    private String title;


    @Column(name = "quantity", nullable=false)
    private String quantity;

    @Column(name = "size",nullable=false)
    private String size;
    
    @Column(name = "image",nullable=false)
    private String image;
	
	public Records() {
		
	}

	public Records(int id, String title, String quantity, String size, String image) {

		this.id = id;
		this.title = title;
		this.quantity = quantity;
		this.size = size;
		this.image = image;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getQuantity() {
		return quantity;
	}

	public void setQuantity(String quantity) {
		this.quantity = quantity;
	}

	public String getSize() {
		return size;
	}

	public void setSize(String size) {
		this.size = size;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public int getId() {
		return id;
	}

	

	
	
}
