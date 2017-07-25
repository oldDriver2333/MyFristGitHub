/**
 * This file created at 2016年8月16日.
 *
 * Copyright (c) 2002-2016 Bingosoft, Inc. All rights reserved.
 */
package com.istudycloud.domain;

import java.util.Date;
import java.util.List;

/**
 * <code>{@link User}</code>
 * 
 * TODO : document me
 * 
 * @author cow
 */
public class User extends BaseDomain {
	/**
	 * 
	 */
	private static final long serialVersionUID = 223977505644014597L;
	private Long user_id	;
	private String username	;
	private String password	;
	private String descn	;
	private Integer status	;
	private Date last_login_date	;
	private Date created_date	;
	private Long created_by	;
	private Date last_updated_date	;
	private Long last_updated_by	;
	private String created_by_username;
	private UserInfo userInfo;
	private List<Role> roles;
	
	private List<String> userRoles;

	public List<String> getUserRoles() {
		return userRoles;
	}

	public void setUserRoles(List<String> userRoles) {
		this.userRoles = userRoles;
	}
	
	/**
	 * 用户状态
	 * @return
	 */
	public String getStatusHtml(){
		if(status == 1){
			return "<span class='label label-success radius'>已启用</span>";
		}else{
			return "<span class='label label-defaunt radius'>已冻结</span>";
		}
	}
	
	public String getHtml() {
		String ret = "<a style='text-decoration:none' onClick='useUser("+user_id+")'  title='启用'><i class='Hui-iconfont'>&#xe603;</i></a>";
		ret = ret + "<a style='padding-left:20px' title='冻结'  onclick='freezeUser("+user_id+")'><i class='Hui-iconfont'>&#xe631;</i></a>";
		ret = ret + "<a style='padding-left:15px' title='编辑' href='javascript:;' onclick=\"admin_edit('编辑','800','500','"+user_id+"')\" class='ml-5' style='text-decoration:none'><i class='Hui-iconfont'>&#xe6df;</i></a>";
		ret = ret + "<a style='padding-left:15px' title='赋予角色' href='javascript:;' onclick=\"admin_role('角色编辑','500','500','"+user_id+"')\" class='ml-5' style='text-decoration:none'><i class='Hui-iconfont'>&#xe615;</i></a>";
		return ret;
	}
	
	/**
	 * 
	 */
	public User() {
		// TODO Auto-generated constructor stub
	}
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
	 * @return the username
	 */
	public String getUsername() {
		return username;
	}
	/**
	 * @param username the username to set
	 */
	public void setUsername(String username) {
		this.username = username;
	}
	/**
	 * @return the password
	 */
	public String getPassword() {
		return password;
	}
	/**
	 * @param password the password to set
	 */
	public void setPassword(String password) {
		this.password = password;
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
	/**
	 * @return the status
	 */
	public Integer getStatus() {
		return status;
	}
	/**
	 * @param status the status to set
	 */
	public void setStatus(Integer status) {
		this.status = status;
	}
	/**
	 * @return the last_login_date
	 */
	public Date getLast_login_date() {
		return last_login_date;
	}
	/**
	 * @param last_login_date the last_login_date to set
	 */
	public void setLast_login_date(Date last_login_date) {
		this.last_login_date = last_login_date;
	}
	/**
	 * @return the created_date
	 */
	public Date getCreated_date() {
		return created_date;
	}
	/**
	 * @param created_date the created_date to set
	 */
	public void setCreated_date(Date created_date) {
		this.created_date = created_date;
	}
	/**
	 * @return the created_by
	 */
	public Long getCreated_by() {
		return created_by;
	}
	/**
	 * @param created_by the created_by to set
	 */
	public void setCreated_by(Long created_by) {
		this.created_by = created_by;
	}
	/**
	 * @return the last_updated_date
	 */
	public Date getLast_updated_date() {
		return last_updated_date;
	}
	/**
	 * @param last_updated_date the last_updated_date to set
	 */
	public void setLast_updated_date(Date last_updated_date) {
		this.last_updated_date = last_updated_date;
	}
	/**
	 * @return the last_updated_by
	 */
	public Long getLast_updated_by() {
		return last_updated_by;
	}
	/**
	 * @param last_updated_by the last_updated_by to set
	 */
	public void setLast_updated_by(Long last_updated_by) {
		this.last_updated_by = last_updated_by;
	}
	public UserInfo getUserInfo() {
		return userInfo;
	}
	public void setUserInfo(UserInfo userInfo) {
		this.userInfo = userInfo;
	}

	public String getCreated_by_username() {
		return created_by_username;
	}

	public void setCreated_by_username(String created_by_username) {
		this.created_by_username = created_by_username;
	}

	/**
	 * @return the roles
	 */
	public List<Role> getRoles() {
		return roles;
	}

	/**
	 * @param roles the roles to set
	 */
	public void setRoles(List<Role> roles) {
		this.roles = roles;
	}
	
	

}
