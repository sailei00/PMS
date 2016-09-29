package com.fdmy.dao;

import java.util.List;

import com.fdmy.model.Equipment;

public interface IEquipmentDao {

	public void add(Equipment equipment);

	public void delete(String id);

	public void update(Equipment equipment);

	public Equipment load(String id);
	
	public Equipment loadByEquipmentNo(String equipmentNo);

	public List<Equipment> query(Equipment equipment);

	public Equipment loadByProductNo(String productNo);

}
