package com.fdmy.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.fdmy.model.UtiCode;
import com.fdmy.service.IUtiCodeService;

@Controller("utiCodeController")
@RequestMapping("/uticode")
public class UtiCodeController {
	private IUtiCodeService utiCodeService;
	
	public IUtiCodeService getUtiCodeService() {
		return utiCodeService;
	}

	@Resource
	public void setUtiCodeService(IUtiCodeService utiCodeService) {
		this.utiCodeService = utiCodeService;
	}

	public UtiCodeController() {
		System.out.println("a new UtiCodeController");
	}

}
