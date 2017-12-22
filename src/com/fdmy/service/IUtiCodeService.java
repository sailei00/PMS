package com.fdmy.service;

import java.util.List;

import com.fdmy.model.UtiCode;

public interface IUtiCodeService {

//	public void add(Item item);
//
//	public void delete(String code);
//
//	public void update(Item item) ;

	public UtiCode load(UtiCode code) ;

	public List<UtiCode> getCodesByCodeType(String codeType);
	
	public List<UtiCode> getCodesByUpperCodeType(UtiCode code);
	

}
