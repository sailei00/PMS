package com.fdmy.dao;

import java.util.List;

import com.fdmy.model.EquipmentResume;

public interface IEquipmentResumeDao {

	public void add(EquipmentResume equipmentResume);

	public void delete(String uuid);

	public void update(EquipmentResume equipmentResume);

	public EquipmentResume load(String uuid);
	
	public List<EquipmentResume> queryByProductNo(String productNo);

	public List<EquipmentResume> query(EquipmentResume equipmentResume);

	void addList(List<EquipmentResume> list);

}
