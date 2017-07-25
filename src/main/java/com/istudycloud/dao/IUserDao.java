/**
 * This file created at 2016年4月15日.
 *
 * Copyright (c) 2002-2016 Bingosoft, Inc. All rights reserved.
 */
package com.istudycloud.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.istudycloud.domain.User;
import com.istudycloud.domain.UserInfo;

/**
 * <code>{@link IUserDao}</code>
 *
 * TODO : document me
 *
 * @author Administrator
 */
@Repository
public interface IUserDao {
	List<String> queryRoleByUserId(Long user_id);
	
	List<User> queryAll();

	/**
	 * @param username
	 * @return
	 */
	User queryByUsername(String username);

	/**
	 * @param user
	 * @return
	 */
	int updatePwd(User user);

	/**
	 * @return
	 */
	List<User> queryAllNoAdmin();

	/**
	 * @return
	 */
	List<User> queryAllAdmin();

	/**
	 * @param id
	 * @return
	 */
	int updateStatus(Long id);

	/**
	 * @param id
	 * @return
	 */
	int updateStatusFreeze(Long id);
	
	int updateStatusEnable(Long id);

	/**
	 * @param u
	 * @return
	 */
	int insert(User u);
	
	/**
	 * 添加用户信息
	 * @param info
	 * @return
	 */
	int insertUserInfo(UserInfo info);

	/**
	 * @param map
	 */
	int insertUserRole(Map map);
	

	/**
	 * 通过ID查询用户的信息以及基本信息
	 * @param id
	 * @return
	 */
	User getUserById(Long id);
	
	
	/**
	 * 修改用户的基础 
	 * @param info
	 * @return
	 */
	Integer updateUserInfo(UserInfo info);
	
	
	/**
	 * 通过用户ID查询该用户的角色信息
	 * @param id
	 * @return
	 */
	User getUserRoleById(Long id);
	
	/**
	 * 根据用户ID以及角色ID，修改映射
	 * @param user_id
	 * @param id
	 * @return
	 */
	Integer updateUserRoleRelation(@Param("user_id")Long user_id,@Param("role_id")Long id);
	
	/**
	 * 通过用户ID删除用户-角色之间的关联映射
	 * @param user_id
	 * @return
	 */
	Integer deleteUserRoleRelationByUserId(Long user_id);
}
