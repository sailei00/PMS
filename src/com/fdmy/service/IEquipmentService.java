package com.fdmy.service;

import java.util.List;

import com.fdmy.model.Equipment;
import com.fdmy.model.StatisticsVO;

public interface IEquipmentService {

	public void add(Equipment equipment);

	public void delete(String uuid);

	public void update(Equipment equipment);

	public Equipment load(String uuid);

	public List<Equipment> loadByEquipmentNo(String equipmentNo);	

	public List<Equipment> query(Equipment equipment);

	public List<Equipment> queryByProductNo(String productNo);

	public List<StatisticsVO> statistics(String equipmentName);

	public Equipment loadByEquipmentNoInCategory(Equipment paramEquip);


}
