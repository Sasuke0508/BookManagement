package com.javaweb.bookmanagement.model;

public class Book {

	private int id;
	private String title;
	private String type;
	private String author;
	private float price;

	public Book() {
	}

	public Book(int id, String title, String type, String author, float price) {
		super();
		this.id = id;
		this.title = title;
		this.type = type;
		this.author = author;
		this.price = price;
	}

	public Book(String title, String type, String author, float price) {
		super();
		this.title = title;
		this.type = type;
		this.author = author;
		this.price = price;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public float getPrice() {
		return price;
	}

	public void setPrice(float price) {
		this.price = price;
	}

}
