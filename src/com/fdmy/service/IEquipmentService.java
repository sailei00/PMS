package com.fdmy.service;

import java.util.List;

import com.fdmy.model.Equipment;

public interface IEquipmentService {

	public void add(Equipment equipment);

	public void delete(String uuid);

	public void update(Equipment equipment);

	public Equipment load(String uuid);

	public Equipment loadByEquipmentNo(String equipmentNo);

	public List<Equipment> query(Equipment equipment);

	public Equipment loadByProductNo(String productNo);

}
