/**
 * This file created at 2016年4月19日.
 *
 * Copyright (c) 2002-2016 Bingosoft, Inc. All rights reserved.
 */
package com.istudycloud.datatable;

/**
 * Datatables.js 
 * Ajax json数据模型
 * 
 * @author Cabby
 */
public class DatatablesJson {
	private boolean success;//状态
	private Object aaData;//数据
	
	/**
	 * 
	 */
	public DatatablesJson() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * @param success
	 * @param aaData
	 */
	public DatatablesJson(boolean success, Object aaData) {
		this.success = success;
		this.aaData = aaData;
	}

	/**
	 * @return the success
	 */
	public boolean isSuccess() {
		return success;
	}

	/**
	 * @param success the success to set
	 */
	public void setSuccess(boolean success) {
		this.success = success;
	}

	/**
	 * @return the aaData
	 */
	public Object getAaData() {
		return aaData;
	}

	/**
	 * @param aaData the aaData to set
	 */
	public void setAaData(Object aaData) {
		this.aaData = aaData;
	}
	
	
}
