package com.fdmy.dao;

import java.util.List;

import com.fdmy.model.Equipment;
import com.fdmy.model.EquipmentResume;
import com.fdmy.model.StatisticsVO;

public interface IEquipmentDao {

	public void add(Equipment equipment);

	public void delete(String id);

	public void update(Equipment equipment);

	public Equipment load(String id);

	public List<Equipment> loadByEquipmentNo(String equipmentNo);

	public List<Equipment> query(Equipment equipment);

	public List<StatisticsVO> statistics(String equipmentName);

	public Equipment loadByEquipmentNoInCategory(Equipment paramEquip);
	
	public Equipment loadByEquipmentNoInCategory(EquipmentResume paramEquipResume);

	public List<Equipment> queryByProductNo(String productNo);

}
