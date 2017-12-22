package com.fdmy.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.fdmy.model.UtiCode;

@Repository("utiCodeDao")
public class UtiCodeDao implements IUtiCodeDao {
	private SqlSessionTemplate sessionTemplate;

	@Resource
	public void setSessionTemplate(SqlSessionTemplate sessionTemplate) {
		this.sessionTemplate = sessionTemplate;
	}

	@Override
	public UtiCode load(UtiCode code) {
		return sessionTemplate.selectOne(UtiCode.class.getName() + ".load", code);
	}

	@Override
	public List<UtiCode> getCodesByCodeType(String codeType) {
		return sessionTemplate.selectList(UtiCode.class.getName() + ".getCodesByCodeType", codeType);
	}
	
	@Override
	public List<UtiCode> getCodesByUpperCodeType(UtiCode code){
		return sessionTemplate.selectList(UtiCode.class.getName() + ".getCodesByUpperCodeType", code);
	}

}
