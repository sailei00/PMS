package com.fdmy.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.fdmy.model.Equipment;
import com.fdmy.model.EquipmentResume;
import com.fdmy.model.StatisticsVO;
import com.fdmy.util.SystemContext;
import com.github.pagehelper.PageHelper;

@Repository("equipmentDao")
public class EquipmentDao implements IEquipmentDao {
	private SqlSessionTemplate sessionTemplate;

	@Resource
	public void setSessionTemplate(SqlSessionTemplate sessionTemplate) {
		this.sessionTemplate = sessionTemplate;
	}

	public EquipmentDao() {
	}

	@Override
	public void add(Equipment equipment) {
		sessionTemplate.insert(Equipment.class.getName() + ".add", equipment);
	}

	@Override
	public void delete(String code) {
		sessionTemplate.delete(Equipment.class.getName() + ".delete", code);
	}

	@Override
	public void update(Equipment equipment) {
		sessionTemplate.update(Equipment.class.getName() + ".update", equipment);
	}

	@Override
	public Equipment load(String id) {
		Equipment equipment = sessionTemplate.selectOne(Equipment.class.getName() + ".load", id);
		return equipment;
	}
	
	@Override
	public List<Equipment> loadByEquipmentNo(String equipmentNo) {
		List<Equipment> equipment = sessionTemplate.selectList(Equipment.class.getName() + ".loadByEquipmentNo", equipmentNo);
		return equipment;
	}
	
	@Override
	public Equipment loadByEquipmentNoInCategory(Equipment paramEquip) {
		Equipment equipment = sessionTemplate.selectOne(Equipment.class.getName() + ".loadByEquipmentNoInCategory", paramEquip);
		return equipment;
	}
	
	
	/*	
	 
	 *  
	 *  在增加履历时，使用履历对象传递参数，需要根据ProductNo、equipemntName、Category带出设备信息。
	 *  
	 *  存在问题： 设备履历中使用productNo为编号，但是设备信息中有equipmentNo和productNo两个编号，并且以equipmentNo为主键，今后需要统一
	 *  
	 */
	@Override
	public Equipment loadByEquipmentNoInCategory(EquipmentResume paramEquipResume) {
		Equipment paramEquip = new Equipment();
		paramEquip.setProductNo(paramEquipResume.getProductNo());
		paramEquip.setEquipmentName(paramEquipResume.getEquipmentName());
		paramEquip.setCategory(paramEquipResume.getCategory());
		Equipment equipment = sessionTemplate.selectOne(Equipment.class.getName() + ".loadByProductNoInCategory", paramEquip);
		return equipment;
	}
	
	@Override
	public List<Equipment> queryByProductNo(String productNo) {
		List<Equipment> equipment = sessionTemplate.selectList(Equipment.class.getName() + ".queryByProductNo", productNo);
		return equipment;
	}
	

	@Override
	public List<Equipment> query(Equipment equipment) {
		int pageSize = SystemContext.getPageSize();
		int pageNo = SystemContext.getPageNo();
		PageHelper.startPage(pageNo, pageSize);
		List<Equipment> list = sessionTemplate.selectList(Equipment.class.getName() + ".query", equipment);

		return list;
	}

	@Override
	public List<StatisticsVO> statistics(String department) {
		List<StatisticsVO> list = sessionTemplate.selectList(Equipment.class.getName() + ".statistics", department);
		return list;
	}

}
