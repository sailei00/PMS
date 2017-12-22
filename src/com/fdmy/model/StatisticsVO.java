package com.fdmy.model;

public class StatisticsVO {
	private String equipmentName;
	private int used;
	private int notUsed;
	private int test;
	private int borken;
	private int repairing;
	private int scrap;
	private int total;

	public String getEquipmentName() {
		return equipmentName;
	}

	public void setEquipmentName(String equipmentName) {
		this.equipmentName = "".equals(equipmentName) ? null : equipmentName;
	}

	public int getUsed() {
		return used;
	}

	public void setUsed(int used) {
		this.used = used;
	}

	public int getNotUsed() {
		return notUsed;
	}

	public void setNotUsed(int notUsed) {
		this.notUsed = notUsed;
	}

	public int getTest() {
		return test;
	}

	public void setTest(int test) {
		this.test = test;
	}

	public int getBorken() {
		return borken;
	}

	public void setBorken(int borken) {
		this.borken = borken;
	}

	public int getRepairing() {
		return repairing;
	}

	public void setRepairing(int repairing) {
		this.repairing = repairing;
	}

	public int getScrap() {
		return scrap;
	}

	public void setScrap(int scrap) {
		this.scrap = scrap;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

}
