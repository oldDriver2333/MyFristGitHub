/**
 * This file created at 2016年5月22日.
 *
 * Copyright (c) 2002-2016 Bingosoft, Inc. All rights reserved.
 */
package com.istudycloud.domain;

import java.util.Date;
import java.util.List;

import org.codehaus.jackson.map.annotate.JsonSerialize;

/**
 * <code>{@link Role}</code>
 *
 * TODO : document me
 *
 * @author Administrator
 */
public class Role extends BaseDomain{
	private static final long serialVersionUID = -1746103657682953719L;
	private Long role_id;
	private String role_name;
	private String descn;
	private List<Resc> rescs;	//权限集合
	protected Long created_by;
	protected Date created_date;
	protected Long last_updated_by;
	protected Date last_updated_date;
	
	public String getHtml() {
		String str = "<a title='授权' onclick='grantPermission("+role_id+")' ><span class='Hui-iconfont'>&#xe6df;</span></a>";
		str = str + "<a style='text-decoration:none;margin-left:15px' onClick='updateRole("+role_id+")'  title='编辑'><i class='Hui-iconfont'>&#xe603;</i></a>";
		str = str + "<a style='margin-left:20px' title='删除' href='javascript:;' onclick='deleteRole("+role_id+")' class='ml-5' style='text-decoration:none'><i class='Hui-iconfont'>&#xe6e2;</i></a>";
		return str;
	}



	/**
	 * 
	 */
	public Role() {
		// TODO Auto-generated constructor stub
	}

	
	public Long getRole_id() {
		return role_id;
	}


	public void setRole_id(Long role_id) {
		this.role_id = role_id;
	}


	public String getRole_name() {
		return role_name;
	}


	public void setRole_name(String role_name) {
		this.role_name = role_name;
	}


	/**
	 * @return the descn
	 */
	public String getDescn() {
		return descn;
	}

	/**
	 * @param descn the descn to set
	 */
	public void setDescn(String descn) {
		this.descn = descn;
	}

	public List<Resc> getRescs() {
		return rescs;
	}

	public void setRescs(List<Resc> rescs) {
		this.rescs = rescs;
	}

	public Long getCreated_by() {
		return created_by;
	}

	public void setCreated_by(Long created_by) {
		this.created_by = created_by;
	}
	
	public Date getCreated_date() {
		return created_date;
	}

	public void setCreated_date(Date created_date) {
		this.created_date = created_date;
	}

	public Long getLast_updated_by() {
		return last_updated_by;
	}

	public void setLast_updated_by(Long last_updated_by) {
		this.last_updated_by = last_updated_by;
	}
	
	public Date getLast_updated_date() {
		return last_updated_date;
	}

	public void setLast_updated_date(Date last_updated_date) {
		this.last_updated_date = last_updated_date;
	}
	
	

}
