package com.istudycloud.service;

import java.util.List;

import com.istudycloud.datatable.DatatablesRequest;
import com.istudycloud.domain.Role;
import com.istudycloud.domain.User;

public interface IRoleService {

	public Integer saveRole(Role role, User user);

	public List<Role> queryRole(DatatablesRequest dr) ;

	public Role getRoleById(Long id);

	public Integer deleteRoleById(Long id, User user);

	/**
	 * 列出所有的角色
	 * 
	 * @return
	 */
	public List<Role> listAll();

	/**
	 * 通过用户ID查询该角色信息
	 * 
	 * @param id
	 * @return
	 */
	public Role getRoleRescById(Long id);

	/**
	 * 添加映射关系
	 * 
	 * @param user_id
	 * @param ids
	 * @return
	 */
	public boolean UpdateRoleResc(Long role_id, String ids, User user);

	/**
	 * 更新角色信息
	 * 
	 * @param role
	 * @return
	 */
	public Integer updateRole(Role role, User user);
}
