package com.fdmy.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
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

import com.fdmy.controller.vo.EquipmentResumeVO;
import com.fdmy.model.Equipment;
import com.fdmy.model.EquipmentResume;
import com.fdmy.model.User;
import com.fdmy.service.IEquipmentResumeService;
import com.fdmy.service.IEquipmentService;
import com.fdmy.util.SystemContext;
import com.github.pagehelper.PageInfo;
import com.google.gson.Gson;

/*
 * 设备履历信息控制器
 */
@Controller("equipmentResumeController")
@RequestMapping("/equipmentresume")
public class EquipmentResumeController {
	private IEquipmentResumeService equipmentResumeService;

	private IEquipmentService equipmentService;

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

	public void setEquipmentResumeService(IEquipmentResumeService equipmentResumeService) {
		this.equipmentResumeService = "".equals(equipmentResumeService) ? null : equipmentResumeService;
	}

	public EquipmentResumeController() {

	}

	@RequestMapping("/index")
	public String index(Model model) {
		return "/equipmentresume/index";
	}

	@RequestMapping(value = "/query", method = RequestMethod.GET)
	public String query(EquipmentResumeVO equipmentResume, Model model) {
		List<EquipmentResume> list = equipmentResumeService.query(equipmentResume);
		PageInfo<EquipmentResume> page = new PageInfo<EquipmentResume>(list);
		model.addAttribute("equipmentResumeList", list);
		model.addAttribute("querybean", equipmentResume);
		model.addAttribute("pageInfo", page);
		return "/equipmentresume/index";
	}

	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String toAdd(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("loginuser");
		EquipmentResumeVO equipmentResume = new EquipmentResumeVO();
		equipmentResume.setOptDate(Calendar.getInstance().getTime());
		if (user != null) {
			equipmentResume.setInputName(user.getUsername());
		}
		model.addAttribute("equipmentResume", equipmentResume);
		return "/equipmentresume/equipmentresumepage";
	}

	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public String add(EquipmentResumeVO equipmentResume, Model model) throws IOException {
		equipmentResumeService.add(equipmentResume);
		return "redirect:/equipmentresume/query?productNo=" + equipmentResume.getProductNo();
	}

	@RequestMapping(value = "/{uuid}/update", method = RequestMethod.GET)
	public String update(@PathVariable String uuid, Model model) throws Exception {
		EquipmentResume equipmentResume = equipmentResumeService.load(uuid);
		model.addAttribute("equipmentResume", equipmentResume);
		return "/equipmentresume/equipmentresumepage";
	}

	// RequestMapping的value中指定的equipmentNo参数，可以当作表单中传递的值对待，此处自动赋值到对象中的uuid字段
	@RequestMapping(value = "/{uuid}/update", method = RequestMethod.POST)
	public String update(@PathVariable String uuid, EquipmentResumeVO equipmentResume) throws Exception {
		equipmentResumeService.update(equipmentResume);
		return "redirect:/equipmentresume/query?uuid=" + uuid;
	}

	// 根据出厂编号带出相关设备信息
	@RequestMapping(value = "/getequipmentinfo", method = RequestMethod.GET, produces = { "application/json;charset=UTF-8" })
	@ResponseBody
	public String getEquipmentInfo(String productNo) throws Exception {
		Gson gson = new Gson();
		List<Equipment> equipment = equipmentService.loadByEquipmentNo(productNo);
		String result = gson.toJson(equipment);
		return result;
	}

	// 查询指定出厂编号是否存在，多个编号之间用逗号分隔
	@RequestMapping(value = "/checkequipmentexsit", method = RequestMethod.GET, produces = { "application/json;charset=UTF-8" })
	@ResponseBody
	public String checkProductNoExsit(String productNo) throws Exception {
		productNo += ",";
		productNo = productNo.trim().replaceAll("[,	， ]+", ","); // 删除首尾空格，把中英文的逗号、空格、TAB替换为英文逗号
		// 把出厂编号用逗号分隔开，拆分成单个的编号
		String[] productNoArr = productNo.split(",");
		List<String> productNoList = Arrays.asList(productNoArr);
		List<Equipment> equipment = null;
		String invalidNo = "";
		// 对填写的设备编号列表进行循环校验
		for (String no : productNoList) {
			equipment = null;
			equipment = equipmentService.loadByEquipmentNo(no);
			if (equipment.size() <= 0) { // 如果设备编号不存在，从字符串中去掉该编号，合并到invalidNo中
				productNo = productNo.replaceAll(no + ",", "");
				invalidNo = invalidNo + no + ",";
			}
		}
		if (productNo.indexOf(",") > 0) { // 如果设备编号字符串有逗号，则去掉最后一位的逗号
			productNo = productNo.substring(0, productNo.length() - 1);
		}
		if (invalidNo.indexOf(",") > 0) { // 如果异常编号字符串中有逗号，则去掉最后一位的逗号
			invalidNo = invalidNo.substring(0, invalidNo.length() - 1);
		}
		return productNo + "|" + invalidNo; // 返回 : 正常编号|异常编号
	}

	@RequestMapping(value = "/validation", method = RequestMethod.GET)
	@ResponseBody
	public String validate(EquipmentResume equipmentResume, String action) throws Exception {
		if (equipmentResume.getProductNo() != null) {
			List<Equipment> equip = this.equipmentService.loadByEquipmentNo(equipmentResume.getProductNo());
			if (equip.size() > 0) {
				return "true";
			} else {
				return "false";
			}
		}
		return "true";
	}

	@RequestMapping(value = "/addlist", method = RequestMethod.GET)
	public String toAddList(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("loginuser");
		EquipmentResumeVO equipmentResume = new EquipmentResumeVO();
		equipmentResume.setOptDate(Calendar.getInstance().getTime());
		if (user != null) {
			equipmentResume.setInputName(user.getUsername());
		}
		model.addAttribute("equipmentResume", equipmentResume);
		return "/equipmentresume/addlistpage";
	}

	@RequestMapping(value = "/addlist", method = RequestMethod.POST)
	public String addList(EquipmentResume param, String invalidNo, Model model) {
		String productNo = param.getProductNo();
		productNo = productNo.trim().replaceAll("[,	， ]+", ","); // 删除首尾空格，把中英文的逗号、空格、TAB替换为英文逗号
		// 把出厂编号用逗号分隔开，拆分成单个的编号
		String[] productNoArr = productNo.split(",");
		List<String> productNoList = Arrays.asList(productNoArr);
		// 每个出厂编号封装一个resume对象，optDate是当前时间，责任人principal是null，address为null，remark为temp
		List<EquipmentResume> pojoList = new ArrayList<EquipmentResume>();
		for (String no : productNoList) {
			EquipmentResume pojo = new EquipmentResume();
			pojo.setProductNo(no);
			pojo.setInputName(param.getInputName());
			pojo.setOptDate(Calendar.getInstance().getTime());
			pojo.setStatus(param.getStatus());
			pojo.setPrincipal(null);
			pojo.setAddress(null);
			pojo.setRemark(SystemContext.TEMPFLAG); // 快速添加的临时数据的常量标记
			pojoList.add(pojo);
		}
		this.equipmentResumeService.addList(pojoList);
		String message = "成功添加设备编号为：" + param.getProductNo() + "的履历。";
		if (!"".equals(invalidNo) && invalidNo != null) {
			message = message + "<br>" + "编号为：" + invalidNo + "的设备没有登记设备信息";
		}
		model.addAttribute("message", message);
		return "redirect:/equipmentresume/query?productNo=" + param.getProductNo();
	}
}
