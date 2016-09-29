package com.fdmy.controller.vo;

import java.math.BigDecimal;

public class ReportVO {
	private String itemCode;
	private String itemName;
	private String model;
	private String department;
	private String month;
	private double number; // 数量
	private double price; // 单价
	private double amount; // 金额

	public String getMonth() {
		return month;
	}

	public void setMonth(String month) {
		this.month = month;
	}

	public String getItemCode() {
		return itemCode;
	}

	public void setItemCode(String itemCode) {
		this.itemCode = "".equals(itemCode) ? null : itemCode;
	}

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		itemName = "".equals(itemName) ? null : itemName;
		this.itemName = itemName;
	}

	public String getModel() {
		return model;
	}

	public void setModel(String model) {
		model = "".equals(model) ? null : model;
		this.model = model;
	}

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		department = "".equals(department) ? null : department;
		this.department = department;
	}

	public double getNumber() {
		return number;
	}

	public void setNumber(double number) {
		this.number = number;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public double getAmount() {
		return amount;
	}

	public void setAmount(double amount) {
		this.amount = amount;
	}

	public boolean getCheckAmount() {
		BigDecimal amount = new BigDecimal(String.valueOf(this.amount));
		BigDecimal price = new BigDecimal(String.valueOf(this.price));
		BigDecimal number = new BigDecimal(String.valueOf(this.number));
		int result = amount.compareTo(price.multiply(number));
		if (result == 0) {
			return true;
		} else {
			return false;
		}
	}

}
