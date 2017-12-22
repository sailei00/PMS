package com.fdmy.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fdmy.model.Equipment;
import com.fdmy.model.EquipmentResume;
import com.fdmy.model.StatisticsVO;
import com.fdmy.model.User;
import com.fdmy.model.UtiCode;
import com.fdmy.model.ValidationInfo;
import com.fdmy.service.IEquipmentResumeService;
import com.fdmy.service.IEquipmentService;
import com.fdmy.service.IUtiCodeService;
import com.github.pagehelper.PageInfo;
import com.google.gson.Gson;

/*
 * 设备管理控制器
 */
@Controller("equipmentController")
@RequestMapping("/equipment")
public class EquipmentController {
	private IEquipmentService equipmentService;
	private IEquipmentResumeService equipmentResumeService;
	private IUtiCodeService utiCodeService;
	

	public IEquipmentResumeService getEquipmentResumeService() {
		return equipmentResumeService;
	}

	@Resource
	public void setEquipmentResumeervice(IEquipmentResumeService equipmentResumeervice) {
		this.equipmentResumeService = equipmentResumeervice;
	}

	public IEquipmentService getEquipmentService() {
		return equipmentService;
	}

	@Resource
	public void setEquipmentService(IEquipmentService equipmentService) {
		this.equipmentService = equipmentService;
	}

	public IUtiCodeService getUtiCodeService() {
		return utiCodeService;
	}

	@Resource
	public void setUtiCodeService(IUtiCodeService utiCodeService) {
		this.utiCodeService = utiCodeService;
	}

	public EquipmentController() {

	}

	@RequestMapping("/index")
	public String index(Model model) {
		return "/equipment/index";
	}

	@RequestMapping(value = "/query", method = RequestMethod.GET)
	public String query(Equipment equipment, Model model) {
		List<Equipment> list = equipmentService.query(equipment);
		PageInfo<Equipment> page = new PageInfo<Equipment>(list);
		model.addAttribute("equipmentList", list);
		model.addAttribute("querybean", equipment);
		model.addAttribute("pageInfo", page);
		return "/equipment/index";
	}

	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String toAdd(Model model) {
		Equipment equipment = new Equipment();
		equipment.setInputDate(Calendar.getInstance().getTime());
		List<UtiCode> categoryList = new ArrayList<UtiCode>();
		categoryList = utiCodeService.getCodesByCodeType("category");
		model.addAttribute("categoryList", categoryList);
		model.addAttribute("equipment", equipment);
		return "/equipment/equipmentpage";
	}

	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public String add(Equipment equipment, Model model, HttpServletRequest request) throws IOException {
		equipmentService.add(equipment);
		model.addAttribute("equipment", equipment);
		return "redirect:/equipment/query?equipmentNo=" + equipment.getEquipmentNo();
	}

	@RequestMapping(value = "/{equipmentNo}/update", method = RequestMethod.GET)
	public String toUpdate(@PathVariable String equipmentNo, Model model) throws Exception {
		Equipment equipment = equipmentService.load(equipmentNo);
		equipment.setInputDate(Calendar.getInstance().getTime());
		List<EquipmentResume> list = equipmentResumeService.queryByProductNo(equipment.getProductNo());
		PageInfo<EquipmentResume> page = new PageInfo<EquipmentResume>(list);
		List<UtiCode> categoryList = new ArrayList<UtiCode>();
		categoryList = utiCodeService.getCodesByCodeType("category");
		List<UtiCode> equipmentNameList = new ArrayList<UtiCode>();
		UtiCode code = new UtiCode();
		code.setCodeType("equipmentname");
		code.setUpperCodeType("category");
		code.setUpperCodeCode(equipment.getCategory());
		equipmentNameList = utiCodeService.getCodesByUpperCodeType(code);
		model.addAttribute("categoryList", categoryList);
		model.addAttribute("equipmentNameList", equipmentNameList);
		model.addAttribute("equipmentResumeList", list);
		model.addAttribute("pageInfo", page);
		model.addAttribute("equipment", equipment);
		return "/equipment/equipmentpage";
	}

	// RequestMapping的value中指定的equipmentNo参数，可以当作表单中传递的值对待，此处自动赋值到对象中的equipmentNo字段

	@RequestMapping(value = "/{equipmentNo}/update", method = RequestMethod.POST)
	public String update(@PathVariable String equipmentNo, Equipment equipment) throws Exception {
		equipmentService.update(equipment);
		return "redirect:/equipment/query?id=" + equipmentNo;
	}

	@RequestMapping(value = "/validation", method = RequestMethod.GET)
	@ResponseBody
	public String validate(Equipment paramEquip, String action) throws Exception {
		Gson gson = new Gson();
		ValidationInfo info = new ValidationInfo();
		System.out.println("验证对象：" + paramEquip);
		if (paramEquip.getEquipmentNo() != null) {
			Equipment equip = this.equipmentService.loadByEquipmentNoInCategory(paramEquip);		//查找同设备类型、设备名称中是否有重复设备编码
			if (action.equals("update")) {		//如果是修改记录
				Equipment oldEquip = this.equipmentService.load(paramEquip.getId());			//取原数据
				if (paramEquip.getEquipmentNo().equals(oldEquip.getEquipmentNo())) {			//如果设备编号没有变更，直接通过验证
					info.setValid(true);
				} else if (equip == null) {					//设备编号有变更，并且同设备类型、设备名称中没有重复设备编码
					info.setValid(true);
				} else {												//设备编号有变更，且变更后的编号被使用
					info.setValid(false);
				}
			} else {										//如果是新增记录
				if (equip != null) {					//如果同设备类型、设备名称中存在该设备编码
					info.setValid(false);
				} else {									//同设备类型、设备名称中没有重复设备编码
					info.setValid(true);
				}
			}
		}
//		if (paramEquip.getProductNo() != null) {
//			Equipment equip = this.equipmentService.loadByProductNo(paramEquip.getProductNo());
//			if (action.equals("update")) {
//				Equipment oldEquip = this.equipmentService.load(paramEquip.getId());
//				if (paramEquip.getProductNo().equals(oldEquip.getProductNo())) {
//					info.setValid(true);
//				} else if (equip == null) {
//					info.setValid(true);
//				} else {
//					info.setValid(false);
//				}
//			} else {
//				if (equip != null) {
//					info.setValid(false);
//				} else {
//					info.setValid(true);
//				}
//			}
//
//		}
		return gson.toJson(info);
	}

	@RequestMapping(value = "/statistics", method = RequestMethod.GET)
	public String statistics(HttpServletRequest request, Model model) throws Exception {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("loginuser");
		List<StatisticsVO> statisticsList= equipmentService.statistics(user.getDepartment());
		model.addAttribute("statisticsList", statisticsList);
		return "/equipment/statistics";
	}
	
	
	@RequestMapping(value = "/getequipmentnamelist", method = RequestMethod.POST, produces = { "application/json;charset=UTF-8" })
	@ResponseBody
	public String getEquipmentNameList(String upperCodeCode) throws Exception { 
		Gson gson = new Gson();
		List<UtiCode> equipmentNameList = new ArrayList<UtiCode>();
		UtiCode code = new UtiCode();
		code.setCodeType("equipmentname");
		code.setUpperCodeType("category");
		code.setUpperCodeCode(upperCodeCode);
		equipmentNameList = utiCodeService.getCodesByUpperCodeType(code);
		return gson.toJson(equipmentNameList);
	}
}
