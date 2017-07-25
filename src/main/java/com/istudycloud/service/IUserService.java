package com.istudycloud.service;

import java.util.List;

import com.istudycloud.domain.Role;
import com.istudycloud.domain.User;
import com.istudycloud.domain.UserInfo;

public interface IUserService {
	public List<User> list();
	
	public User queryByUsername(String username);

	/**
	 * 查询所有用户
	 * @return
	 */
	public List<User> queryAll();

	/**
	 * 密码校验
	 * @param oldPassword
	 * @return
	 */
	public boolean queryByPwd(String oldPassword,User u);
	/**
	 * 修改密码
	 * @param oldPassword
	 * @param user
	 * @return
	 */
	public boolean updatePwd(String newPassword, User user);
	

	/**
	 * 冻结用户
	 * @param id
	 * @return
	 */
	public boolean freezeUser(Long id,User user);
	
	/**
	 * 启用用户
	 * @param id
	 * @return
	 */
	public boolean useUser(Long id,User user);

	/**
	 * 检查用户名是否存在
	 * @param username
	 * @return true 不存在
	 */
	public boolean checkName(String username);
	/**
	 * 添加用户
	 * @param u
	 * @param role_id 
	 * @return
	 */
	public boolean addUser(User u, Long role_id,User user);

	/**
	 * 查询所有用户角色
	 * @return
	 */
	public List<Role> queryAllRole();
	
	
	/**
	 * 通过用户ID查询该用户的信息以及基本信息
	 * @param id
	 * @return
	 */
	public User getUserById(Long id);
	
	/**
	 * 编辑个人信息
	 * @param info
	 * @return
	 */
	public Integer updateUserInfo(UserInfo info,User user);
	
	
	/**
	 * 通过用户ID查询该用户的角色信息
	 * @param id
	 * @return
	 */
	public User getUserRoleById(Long id);
	/**
	 * 添加映射关系
	 * @param user_id
	 * @param ids
	 * @return
	 */
	public boolean UpdateUserRole(Long user_id,String ids,User user);
}
