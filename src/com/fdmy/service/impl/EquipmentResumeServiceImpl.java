package com.fdmy.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.fdmy.dao.EquipmentResumeDao;
import com.fdmy.dao.IEquipmentDao;
import com.fdmy.dao.IEquipmentResumeDao;
import com.fdmy.model.Equipment;
import com.fdmy.model.EquipmentResume;
import com.fdmy.service.IEquipmentResumeService;

@Service("equipmentResumeService")
public class EquipmentResumeServiceImpl implements IEquipmentResumeService {

	private IEquipmentResumeDao equipmentResumeDao;
	private IEquipmentDao equipmentDao;

	public IEquipmentResumeDao getEquipmentResumeDao() {
		return equipmentResumeDao;
	}

	@Resource
	public void setEquipmentResumeDao(EquipmentResumeDao equipmentResumeDao) {
		this.equipmentResumeDao = equipmentResumeDao;
	}

	public IEquipmentDao getEquipmentDao() {
		return equipmentDao;
	}

	@Resource
	public void setEquipmentDao(IEquipmentDao equipmentDao) {
		this.equipmentDao = equipmentDao;
	}

	/*
	 * 保存设备履历时，同步更新设备信息中的责任人、使用状态、使用日期、安装地点。
	 */
	@Override
	public void add(EquipmentResume equipmentResume) {
		Equipment equip = this.equipmentDao.loadByEquipmentNoInCategory(equipmentResume);
		if (equip != null) {
			equip.setPrincipal(equipmentResume.getPrincipal());
			equip.setStatus(equipmentResume.getStatus());
			equip.setUseDate(equipmentResume.getOptDate()); // 使用登记日期作为最后一次使用的日期
			equip.setAddress(equipmentResume.getAddress());
			equipmentDao.update(equip);
		}
		equipmentResumeDao.add(equipmentResume);
	}
	
	@Override
	public void addList(List<EquipmentResume> equipmentResumeList) {
		equipmentResumeDao.addList(equipmentResumeList);
	}

	@Override
	public void delete(String uuid) {
		equipmentResumeDao.delete(uuid);
	}

	@Override
	public void update(EquipmentResume equipmentResume) {
		equipmentResumeDao.update(equipmentResume);
	}

	@Override
	public EquipmentResume load(String uuid) {
		return equipmentResumeDao.load(uuid);
	}

	@Override
	public List<EquipmentResume> queryByProductNo(String productNo) {
		return equipmentResumeDao.queryByProductNo(productNo);
	}

	@Override
	public List<EquipmentResume> query(EquipmentResume equipmentResuome) {
		return equipmentResumeDao.query(equipmentResuome);
	}

}
