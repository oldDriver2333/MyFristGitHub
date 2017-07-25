package com.istudycloud.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.istudycloud.datatable.DatatablesRequest;
import com.istudycloud.domain.Role;

/**
 * 角色管理
 * @author Administrator
 *
 */
public interface IRoleDao {
	
	List<String> queryByResc(Long resc_id);
	/**
	 * 保存新的角色信息
	 * @param Role 备份信息
	 * @return
	 */
	Integer saveRole(Role role);
	
	/**
	 * 查询某个角色的信息----权限---
	 * @param id
	 * @return
	 */
	Role getRoleById(Long id);
	
	/**
	 * 分页列出Role的信息
	 * @return
	 */
	List<Role> queryRole(DatatablesRequest dr);
	
	/**
	 * 获取记录总数
	 */
	Integer queryCount();
	
	/**
	 * 获取过滤后的备份总数
	 */
	int queryCountFilte(DatatablesRequest dr);

	/**
	 * 根据ID删除角色 
	 * @param id
	 * @return
	 */
	Integer deleteRoleById(Long id);
	
	/**
	 * 列出所有的角色
	 * @return
	 */
	List<Role> listAll();
	
	
	
	/**
	 * 通过用户ID查询该用户的角色信息
	 * @param id
	 * @return
	 */
	Role getRoleRescById(Long id);
	
	/**
	 * 根据用户ID以及角色ID，修改映射
	 * @param user_id
	 * @param id
	 * @return
	 */
	Integer updateRoleRescRelation(@Param("role_id")Long role_id,@Param("resc_id")Long resc_id);
	
	/**
	 * 通过用户ID删除用户-角色之间的关联映射
	 * @param user_id
	 * @return
	 */
	Integer deleteRoleRescRelationByUserId(Long role_id);
	
	/**
	 * 更新角色
	 * @param role
	 * @return
	 */
	Integer updateRole(Role role);
}
