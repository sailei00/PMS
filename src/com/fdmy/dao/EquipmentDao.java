package com.fdmy.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.fdmy.model.Equipment;
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
	public Equipment loadByEquipmentNo(String equipmentNo) {
		Equipment equipment = sessionTemplate.selectOne(Equipment.class.getName() + ".loadByEquipmentNo", equipmentNo);
		return equipment;
	}
	
	@Override
	public Equipment loadByProductNo(String productNo) {
		Equipment equipment = sessionTemplate.selectOne(Equipment.class.getName() + ".loadByProductNo", productNo);
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

}
