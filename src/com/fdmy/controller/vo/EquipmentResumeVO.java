package com.fdmy.controller.vo;

import com.fdmy.model.EquipmentResume;

public class EquipmentResumeVO extends EquipmentResume {
	private String equipmentName;
	private String department;
	private String model;

	public String getEquipmentName() {
		return equipmentName;
	}

	public void setEquipmentName(String equipmentName) {
		this.equipmentName = "".equals(equipmentName) ? null : equipmentName;
	}

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = "".equals(department) ? null : department;
	}

	public String getModel() {
		return model;
	}

	public void setModel(String model) {
		this.model = "".equals(model) ? null : model;
	}

}
