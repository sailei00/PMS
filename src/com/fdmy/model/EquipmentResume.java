package com.fdmy.model;

import java.util.Date;

public class EquipmentResume {
	private String uuid; // uuid
	private String productNo; // 出厂编号
	private String inputName; // 登记人
	private String status; // 设备状态（在用、备用、待修、送修、送检、报废）
	private Date inputDate; // 录入日期
	private String principal; // 包机责任人
	private String address; // 使用地点
	private String remark; // 备注

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = "".equals(remark) ? null : remark;
	}

	public String getUuid() {
		return uuid;
	}

	public void setUuid(String uuid) {
		this.uuid = "".equals(uuid) ? null : uuid;
	}

	public String getInputName() {
		return inputName;
	}

	public void setInputName(String inputName) {
		this.inputName = "".equals(inputName) ? null : inputName;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = "".equals(status) ? null : status;
	}

	public String getProductNo() {
		return productNo;
	}

	public void setProductNo(String productNo) {
		this.productNo = killBlank(productNo);
	}

	public Date getInputDate() {
		return inputDate;
	}

	public void setInputDate(Date inputDate) {
		this.inputDate = inputDate;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = "".equals(address) ? null : address;
	}

	public void setPrincipal(String principal) {
		this.principal = "".equals(principal) ? null : principal;
	}

	public String getPrincipal() {
		return principal;
	}

	private String killBlank(String field) {
		if ("".equals(field)) {
			return null;
		}
		return field;
	}

}