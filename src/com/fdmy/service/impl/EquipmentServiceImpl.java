package com.fdmy.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.fdmy.dao.IEquipmentDao;
import com.fdmy.model.Equipment;
import com.fdmy.model.StatisticsVO;
import com.fdmy.service.IEquipmentService;

@Service("equipmentService")
public class EquipmentServiceImpl implements IEquipmentService {

	private IEquipmentDao equipmentDao;

	public IEquipmentDao getEquipmentDao() {
		return equipmentDao;
	}

	@Resource
	public void setEquipmentDao(IEquipmentDao equipmentDao) {
		this.equipmentDao = equipmentDao;
	}

	@Override
	public void add(Equipment equipment) {
		equipmentDao.add(equipment);
	}

	@Override
	public void delete(String deviceNo) {
		equipmentDao.delete(deviceNo);
	}

	@Override
	public void update(Equipment equipment) {
		equipmentDao.update(equipment);
	}

	@Override
	public Equipment load(String id) {
		return equipmentDao.load(id);
	}

	@Override
	public List<Equipment> loadByEquipmentNo(String equipmentNo) {
		return equipmentDao.loadByEquipmentNo(equipmentNo);
	}

	@Override
	public Equipment loadByEquipmentNoInCategory(Equipment paramEquip) {
		return equipmentDao.loadByEquipmentNoInCategory(paramEquip);
	}

	@Override
	public List<Equipment> queryByProductNo(String productNo) {
		return equipmentDao.queryByProductNo(productNo);
	}

	@Override
	public List<Equipment> query(Equipment equipment) {
		return equipmentDao.query(equipment);
	}

	@Override
	public List<StatisticsVO> statistics(String department) {
		return equipmentDao.statistics(department);
	}

}
