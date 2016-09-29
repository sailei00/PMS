package com.fdmy.controller;

import java.io.IOException;
import java.util.Calendar;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fdmy.model.Equipment;
import com.fdmy.model.EquipmentResume;
import com.fdmy.model.ValidationInfo;
import com.fdmy.service.IEquipmentResumeService;
import com.fdmy.service.IEquipmentService;
import com.github.pagehelper.PageInfo;
import com.google.gson.Gson;

/*
 * 文档管理控制器
 */
@Controller("equipmentController")
@RequestMapping("/equipment")
public class EquipmentController {
	private IEquipmentService equipmentService;
	private IEquipmentResumeService equipmentResumeService;

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
	public String validate(Equipment equipment, String action) throws Exception {
		Gson gson = new Gson();
		ValidationInfo info = new ValidationInfo();
		System.out.println("验证对象：" + equipment);
		if (equipment.getEquipmentNo() != null) {
			Equipment equip = this.equipmentService.loadByEquipmentNo(equipment.getEquipmentNo());
			if (action.equals("update")) {
				Equipment oldEquip = this.equipmentService.load(equipment.getId());
				if (equipment.getEquipmentNo().equals(oldEquip.getEquipmentNo())) {
					info.setValid(true);
				} else if (equip == null) {
					info.setValid(true);
				} else {
					info.setValid(false);
				}
			} else {
				if (equip != null) {
					info.setValid(false);
				} else {
					info.setValid(true);
				}
			}
		}
		if (equipment.getProductNo() != null) {
			Equipment equip = this.equipmentService.loadByProductNo(equipment.getProductNo());
			if (action.equals("update")) {
				Equipment oldEquip = this.equipmentService.load(equipment.getId());
				if (equipment.getProductNo().equals(oldEquip.getProductNo())) {
					info.setValid(true);
				} else if (equip == null) {
					info.setValid(true);
				} else {
					info.setValid(false);
				}
			} else {
				if (equip != null) {
					info.setValid(false);
				} else {
					info.setValid(true);
				}
			}

		}
		return gson.toJson(info);
	}

}
