package com.istudycloud.service.impl;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.istudycloud.dao.IUserDao;
import com.istudycloud.domain.Role;
import com.istudycloud.domain.User;
import com.istudycloud.domain.UserInfo;
import com.istudycloud.service.IUserService;
import com.istudycloud.utils.PasswordUtil;

@Service("userService")
public class UserServiceImpl implements IUserService{
	@Resource
	private IUserDao dao;
	
	public List<User> list(){
		return dao.queryAll();
	}
	
	public User queryByUsername(String username){
		return dao.queryByUsername(username);
	}

	/**
	 * 查询所有用户
	 * @return
	 */
	public List<User> queryAll() {
		return dao.queryAll();
	}

	/**
	 * 密码校验
	 * @param oldPassword
	 * @return
	 */
	public boolean queryByPwd(String oldPassword,User u) {
		return PasswordUtil.encryptPassword(oldPassword,u.getUsername()).equals(u.getPassword());
	}

	/**
	 * 修改密码
	 * @param oldPassword
	 * @param user
	 * @return
	 */
	public boolean updatePwd(String newPassword, User user) {
		user.setPassword(PasswordUtil.encryptPassword(newPassword,user.getUsername()));
		if(dao.updatePwd(user)==1){
			return true;
		}
		return false;
	}
	

	/**
	 * 冻结用户
	 * @param id
	 * @return
	 */
	public boolean freezeUser(Long id,User user) {
		if(dao.updateStatusFreeze(id)==1){
			return true;
		}
		return false;
	}
	
	/**
	 * 启用用户
	 * @param id
	 * @return
	 */
	public boolean useUser(Long id,User user) {
		if(dao.updateStatusEnable(id)==1){
			return true;
		}
		return false;
	}

	/**
	 * 检查用户名是否存在
	 * @param username
	 * @return true 不存在
	 */
	public boolean checkName(String username) {
		List<User> users=dao.queryAll();
		for(User u:users){
			if(u.getUsername().equals(username))
				return false;
		}
		return true;
	}

	/**
	 * 添加用户
	 * @param u
	 * @param role_id 
	 * @return
	 */
	public boolean addUser(User u, Long role_id,User user) {
		u.setCreated_date(new Date());
		if(role_id==1){
			u.setDescn("超级用户");
		}
		else{
			u.setDescn("普通用户");
		}
		//MD5加密
		String pwd=PasswordUtil.encryptPassword(u.getPassword(),u.getUsername());
		u.setPassword(pwd);
		u.setCreated_by(user.getUser_id());
		if(dao.insert(u)==1){
			UserInfo info = new UserInfo();
			//创建用户信息表
			info.setUserId(u.getUser_id());
			dao.insertUserInfo(info);
			// Map map=new HashMap();
			// map.put("user_id", u.getUser_id());
			// map.put("role_id", role_id);
			// dao.insertUserRole(map);
			return true;
		}
		return false;
	}

	/**
	 * 查询所有用户角色
	 * @return
	 */
	public List<Role> queryAllRole() {
		// TODO implement UserService.queryAllRole
		return null;
	}
	
	
	/**
	 * 通过用户ID查询该用户的信息以及基本信息
	 * @param id
	 * @return
	 */
	public User getUserById(Long id){
		return dao.getUserById(id);
	}
	
	/**
	 * 编辑个人信息
	 * @param info
	 * @return
	 */
	public Integer updateUserInfo(UserInfo info,User user){
		return dao.updateUserInfo(info);
	}
	
	
	/**
	 * 通过用户ID查询该用户的角色信息
	 * @param id
	 * @return
	 */
	public User getUserRoleById(Long id){
		return dao.getUserRoleById(id);
	}
	
	/**
	 * 添加映射关系
	 * @param user_id
	 * @param ids
	 * @return
	 */
	public boolean UpdateUserRole(Long user_id,String ids,User user){
		//先删除映射表中所有的隐射关系
		dao.deleteUserRoleRelationByUserId(user_id);
		if(ids == null || "".equals(ids.trim())){
			return true;
		}
		//将ids转成数据类型
		String[] rIds = ids.split(","); 
		//遍历出所有角色的ID，插入到映射表中
		int flag = 0;
		for(String id : rIds){
			flag = dao.updateUserRoleRelation(user_id, Long.valueOf(id));
			if(flag == 0){
				return false;
			}
		}
		return true;
	}
	
}
