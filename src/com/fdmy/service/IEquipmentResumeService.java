package com.fdmy.service;

import java.util.List;

import com.fdmy.model.EquipmentResume;

public interface IEquipmentResumeService {

	public void add(EquipmentResume equipmentResume);

	public void addList(List<EquipmentResume> equipmentResumeList);

	public void delete(String uuid);

	public void update(EquipmentResume equipmentResume);

	public EquipmentResume load(String uuid);

	public List<EquipmentResume> queryByProductNo(String productNo);

	public List<EquipmentResume> query(EquipmentResume equipmentResume);

}
