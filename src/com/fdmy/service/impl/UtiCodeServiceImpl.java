package com.fdmy.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.fdmy.dao.IUtiCodeDao;
import com.fdmy.dao.UtiCodeDao;
import com.fdmy.model.UtiCode;
import com.fdmy.service.IUtiCodeService;

@Service("utiCodeService")
public class UtiCodeServiceImpl implements IUtiCodeService {

	private IUtiCodeDao utiCodeDao;

	public IUtiCodeDao getUtiCodeDao() {
		return utiCodeDao;
	}

	@Resource
	public void setUtiCodeDao(UtiCodeDao utiCodeDao) {
		this.utiCodeDao = utiCodeDao;
	}

	@Override
	public UtiCode load(UtiCode code) {
		return utiCodeDao.load(code);
	}

	@Override
	public List<UtiCode> getCodesByCodeType(String codeType) {
		return utiCodeDao.getCodesByCodeType(codeType);
	}

	@Override
	public List<UtiCode> getCodesByUpperCodeType(UtiCode code) {
		return utiCodeDao.getCodesByUpperCodeType(code);
	}

}
