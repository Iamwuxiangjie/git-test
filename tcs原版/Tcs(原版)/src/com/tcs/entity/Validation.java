package com.tcs.entity;

import java.io.Serializable;

public class Validation implements Serializable {
	private static final long serialVersionUID = 1L;
	private int validationId;// 验证码ID
	private String validationNum;// 验证码
	private String validationAddress;// 验证区域

	public Validation(int validationId, String validationNum,
			String validationAddress) {
		super();
		this.validationId = validationId;
		this.validationNum = validationNum;
		this.validationAddress = validationAddress;
	}

	public Validation() {
		super();
	}

	public int getValidationId() {
		return validationId;
	}

	public void setValidationId(int validationId) {
		this.validationId = validationId;
	}

	public String getValidationNum() {
		return validationNum;
	}

	public void setValidationNum(String validationNum) {
		this.validationNum = validationNum;
	}

	public String getValidationAddress() {
		return validationAddress;
	}

	public void setValidationAddress(String validationAddress) {
		this.validationAddress = validationAddress;
	}

}
