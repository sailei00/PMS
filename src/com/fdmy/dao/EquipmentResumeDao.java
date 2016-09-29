package com.fdmy.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.fdmy.controller.vo.EquipmentResumeVO;
import com.fdmy.model.EquipmentResume;
import com.fdmy.util.SystemContext;
import com.github.pagehelper.PageHelper;

@Repository("equipmentResumeDao")
public class EquipmentResumeDao implements IEquipmentResumeDao {
	private SqlSessionTemplate sessionTemplate;

	@Resource
	public void setSessionTemplate(SqlSessionTemplate sessionTemplate) {
		this.sessionTemplate = sessionTemplate;
	}

	public EquipmentResumeDao() {
	}

	@Override
	public void add(EquipmentResume equipmentResume) {
		sessionTemplate.insert(EquipmentResume.class.getName() + ".add", equipmentResume);
	}

	@Override
	public void addList(List<EquipmentResume> list) {
		sessionTemplate.insert(EquipmentResume.class.getName() + ".addlist", list);
	}

	@Override
	public void delete(String uuid) {
		sessionTemplate.delete(EquipmentResume.class.getName() + ".delete", uuid);
	}

	@Override
	public void update(EquipmentResume equipmentResume) {
		sessionTemplate.update(EquipmentResume.class.getName() + ".update", equipmentResume);
	}

	@Override
	public EquipmentResumeVO load(String uuid) {
		EquipmentResumeVO equipmentResume = sessionTemplate.selectOne(EquipmentResume.class.getName() + ".load", uuid);
		return equipmentResume;
	}

	@Override
	public List<EquipmentResume> queryByProductNo(String productNo) {
		int pageSize = SystemContext.getPageSize();
		int pageNo = SystemContext.getPageNo();
		PageHelper.startPage(pageNo, pageSize);
		List<EquipmentResume> equipmentResume = sessionTemplate.selectList(EquipmentResume.class.getName() + ".queryByProductNo", productNo);
		return equipmentResume;
	}

	@Override
	public List<EquipmentResume> query(EquipmentResume equipmentResume) {
		int pageSize = SystemContext.getPageSize();
		int pageNo = SystemContext.getPageNo();
		PageHelper.startPage(pageNo, pageSize);
		String no = equipmentResume.getProductNo();
		List<EquipmentResume> list = null;
		if (no == null || no.indexOf(",") < 0) {
			list = sessionTemplate.selectList(EquipmentResume.class.getName() + ".query", equipmentResume);
		} else {
			no = no.replace(",", "','");
			no = "'" + no + "'";
			equipmentResume.setProductNo(no);
			list = sessionTemplate.selectList(EquipmentResume.class.getName() + ".queryWithMultiProductNo", equipmentResume);
		}
		return list;
	}

}
