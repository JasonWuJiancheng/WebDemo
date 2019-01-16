package com.jason.entity;

import java.util.ArrayList;

public class Product {

	private int id;
	private int type;
	private String name;
	private String price;
	private String title;
	private String detail;
	private int resnum;
	private String headerimg;
	private ArrayList<String> imgs;
	
	public Product(int id, int type, String name, String price, String title, String detail, int resnum,
			String headerimg, ArrayList<String> imgs) {
		this.id = id;
		this.type = type;
		this.name = name;
		this.price = price;
		this.title = title;
		this.detail = detail;
		this.resnum = resnum;
		this.headerimg = headerimg;
		this.imgs = imgs;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	public int getResnum() {
		return resnum;
	}
	public void setResnum(int resnum) {
		this.resnum = resnum;
	}
	public String getHeaderimg() {
		return headerimg;
	}
	public void setHeaderimg(String headerimg) {
		this.headerimg = headerimg;
	}
	public ArrayList<String> getImgs() {
		return imgs;
	}
	public void setImgs(ArrayList<String> imgs) {
		this.imgs = imgs;
	}
	
	
}
