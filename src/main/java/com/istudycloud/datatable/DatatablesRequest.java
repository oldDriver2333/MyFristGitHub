/**
 * This file created at 2016年4月30日.
 *
 * Copyright (c) 2002-2016 Bingosoft, Inc. All rights reserved.
 */
package com.istudycloud.datatable;

import javax.servlet.http.HttpServletRequest;

import com.istudycloud.domain.BaseDomain;

/**
 * Datatables 服务端分页参数模型
 * 
 * @author Cabby
 */
public class DatatablesRequest extends BaseDomain{
	private HttpServletRequest request;//初始化的请求
	//-------请求参数模型----------------
	private Integer start;//起始记录
	private Integer length;//每页数据量
	private String sortColumnIndex;//要排序的列索引
	private String sortColumnType;//排序规则 asc desc
	private String sortColumnName;//排序的列名 
	private String searchKey;//搜索关键字   
	
	//--------SQL参数模型-----------------
	private int total;//总记录数 
	private int filteTotal;//过滤后的总记录数
	private Long user_id;//用户id
	
	
	
	
	/**
	 * @return the user_id
	 */
	public Long getUser_id() {
		return user_id;
	}




	/**
	 * @param user_id the user_id to set
	 */
	public void setUser_id(Long user_id) {
		this.user_id = user_id;
	}




	/**
	 * @return the filteTotal
	 */
	public int getFilteTotal() {
		return filteTotal;
	}




	/**
	 * @param filteTotal the filteTotal to set
	 */
	public void setFilteTotal(int filteTotal) {
		this.filteTotal = filteTotal;
	}




	/**
	 * 构造器
	 * @param request
	 */
	public DatatablesRequest(HttpServletRequest request) {
		this.request = request;
		this.sortColumnIndex=request.getParameter("order[0][column]");//要排序的列索引
		this.sortColumnType=request.getParameter("order[0][dir]");//排序规则 asc desc
		this.sortColumnName=request.getParameter("columns["+sortColumnIndex+"][data]");//排序的列名
		if(this.sortColumnName!=null && this.sortColumnName.endsWith("_str")){
			 this.sortColumnName= this.sortColumnName.replace("_str", "");
		}
		this.searchKey=request.getParameter("search[value]");//搜索的关键字
		if(request.getParameter("start")!=null)
			this.start=Integer.parseInt(request.getParameter("start"));
		if(request.getParameter("length")!=null)
			this.length=Integer.parseInt(request.getParameter("length"));
		
	}
	
	
	
	
	/**
	 * @return the searchKey
	 */
	public String getSearchKey() {
		if(searchKey!=null)
			return searchKey.trim();
		return searchKey;  
	}




	/**
	 * @param searchKey the searchKey to set
	 */
	public void setSearchKey(String searchKey) {
		this.searchKey = searchKey;
	}





	/**
	 * @return the total
	 */
	public int getTotal() {
		return total;
	}




	/**
	 * @param total the total to set
	 */
	public void setTotal(int total) {
		this.total = total;
		this.filteTotal=total;
	}




	/**
	 * @return the request
	 */
	public HttpServletRequest getRequest() {
		return request;
	}

	/**
	 * @param request the request to set
	 */
	public void setRequest(HttpServletRequest request) {
		this.request = request;
	}

	/**
	 * @return the sortColumnIndex
	 */
	public String getSortColumnIndex() {
		return sortColumnIndex;
	}

	/**
	 * @param sortColumnIndex the sortColumnIndex to set
	 */
	public void setSortColumnIndex(String sortColumnIndex) {
		this.sortColumnIndex = sortColumnIndex;
	}

	/**
	 * @return the sortColumnType
	 */
	public String getSortColumnType() {
		return sortColumnType;
	}

	/**
	 * @param sortColumnType the sortColumnType to set
	 */
	public void setSortColumnType(String sortColumnType) {
		this.sortColumnType = sortColumnType;
	}

	/**
	 * @return the sortColumnName
	 */
	public String getSortColumnName() {
		return sortColumnName;
	}

	/**
	 * @param sortColumnName the sortColumnName to set
	 */
	public void setSortColumnName(String sortColumnName) {
		this.sortColumnName = sortColumnName;
	}

	

	/**
	 * 
	 */
	public DatatablesRequest() {
		// TODO Auto-generated constructor stub
	}
	
	/**
	 * @return the start
	 */
	public Integer getStart() {
		return start;
	}

	/**
	 * @param start the start to set
	 */
	public void setStart(Integer start) {
		this.start = start;
	}

	/**
	 * @return the length
	 */
	public Integer getLength() {
		return length;
	}

	/**
	 * @param length the length to set
	 */
	public void setLength(Integer length) {
		this.length = length;
	}
	
	
}
