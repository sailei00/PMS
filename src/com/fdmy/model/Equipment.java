package com.fdmy.model;

import java.util.Date;

public class Equipment {
	private String id; // id
	private String equipmentNo; // 设备编号
	private String equipmentName; // 设备名称
	private String category; // 设备分类
	private String model; // 型号
	private String factory; // 生产厂家
	private String status; // 使用状态
	private String techFeature; // 技术参数
	private String unit; // 单位
	private int count; // 数量
	private String productNo; // 出厂编号
	private Date productDate; // 出厂日期
	private Date buyDate; // 购置日期
	private Date useDate; // 使用日期
	private Date inputDate; // 录入日期
	private Date validDate; // 鉴定过期日期
	private String department; // 使用部门
	private String address; // 安装地点
	private String principal; // 包机责任人

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = "".equals(id) ? null : id;
	}

	public String getPrincipal() {
		return principal;
	}

	public void setPrincipal(String principal) {
		this.principal = "".equals(principal) ? null : principal;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = "".equals(address) ? null : address;
	}

	public String getEquipmentNo() {
		return equipmentNo;
	}

	public void setEquipmentNo(String equipmentNo) {
		this.equipmentNo = killBlank(equipmentNo);
	}

	public String getEquipmentName() {
		return equipmentName;
	}

	public void setEquipmentName(String equipmentName) {
		this.equipmentName = killBlank(equipmentName);
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String equipmentCategory) {
		this.category = killBlank(equipmentCategory);
	}

	public String getModel() {
		return model;
	}

	public void setModel(String model) {
		this.model = killBlank(model);
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = "".equals(status) ? null : status;
	}

	public String getFactory() {
		return factory;
	}

	public void setFactory(String factory) {
		this.factory = killBlank(factory);
	}

	public String getTechFeature() {
		return techFeature;
	}

	public void setTechFeature(String techFeature) {
		this.techFeature = killBlank(techFeature);
	}

	public String getUnit() {
		return unit;
	}

	public void setUnit(String unit) {
		this.unit = unit;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public String getProductNo() {
		return productNo;
	}

	public void setProductNo(String productNo) {
		this.productNo = killBlank(productNo);
	}

	public Date getProductDate() {
		return productDate;
	}

	public void setProductDate(Date productDate) {
		this.productDate = productDate;
	}

	public Date getBuyDate() {
		return buyDate;
	}

	public void setBuyDate(Date buyDate) {
		this.buyDate = buyDate;
	}

	public Date getUseDate() {
		return useDate;
	}

	public void setUseDate(Date useDate) {
		this.useDate = useDate;
	}

	public Date getInputDate() {
		return inputDate;
	}

	public void setInputDate(Date inputDate) {
		this.inputDate = inputDate;
	}

	public void setValidDate(Date validDate) {
		this.validDate = validDate;
	}

	public Date getValidDate() {
		return validDate;
	}

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = killBlank(department);
	}

	private String killBlank(String field) {
		if ("".equals(field)) {
			return null;
		}
		return field;
	}

	@Override
	public String toString() {
		return "Equipment [id=" + id + ", equipmentNo=" + equipmentNo + ", equipmentName=" + equipmentName + ", category=" + category + ", model="
				+ model + ", factory=" + factory + ", status=" + status + ", techFeature=" + techFeature + ", unit=" + unit + ", count=" + count
				+ ", productNo=" + productNo + ", productDate=" + productDate + ", buyDate=" + buyDate + ", useDate=" + useDate + ", inputDate="
				+ inputDate + ", validDate=" + validDate + ", department=" + department + ", address=" + address + ", principal=" + principal + "]";
	}

}