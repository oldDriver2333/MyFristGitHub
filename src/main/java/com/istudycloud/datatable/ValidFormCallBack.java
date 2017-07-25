/**
 * This file created at 2016年4月21日.
 *
 * Copyright (c) 2002-2016 Bingosoft, Inc. All rights reserved.
 */
package com.istudycloud.datatable;

/**
 * ValidForm ajax提交数据返回json格式
 * @author Cabby
 */
public class ValidFormCallBack {
	private String info;
	private String status;//   y / n
	
	/**
	 * @param info
	 * @param status
	 */
	public ValidFormCallBack(String info, String status) {
		this.info = info;
		this.status = status;
	}
	
	
	/**
	 * @return the info
	 */
	public String getInfo() {
		return info;
	}
	/**
	 * @param info the info to set
	 */
	public void setInfo(String info) {
		this.info = info;
	}
	/**
	 * @return the status
	 */
	public String getStatus() {
		return status;
	}
	/**
	 * @param status the status to set
	 */
	public void setStatus(String status) {
		this.status = status;
	}
	
	/**
	 * @param status
	 */
	public ValidFormCallBack(String status) {
		super();
		this.status = status;
	}
	/**
	 * 
	 */
	public ValidFormCallBack() {
		// TODO Auto-generated constructor stub
	}
	
}
