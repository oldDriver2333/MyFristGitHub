package com.istudycloud.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.istudycloud.dao.IRoleDao;
import com.istudycloud.datatable.DatatablesRequest;
import com.istudycloud.domain.Role;
import com.istudycloud.domain.User;
import com.istudycloud.service.IRoleService;

@Service("roleService")
public class RoleServiceImpl implements IRoleService{
	@Resource
	private IRoleDao dao;

	public Integer saveRole(Role role, User user) {
		Integer flag = dao.saveRole(role);
		return flag;
	}

	public List<Role> queryRole(DatatablesRequest dr) {
		int sum = 0;
		if (dr.getSearchKey() != null && !"".equals(dr.getSearchKey().trim())) {
			sum = dao.queryCountFilte(dr);
			dr.setFilteTotal(sum);
		} else {
			sum = dao.queryCount();
			dr.setTotal(sum);// 总记录数
		}
		return dao.queryRole(dr);
	}

	public Role getRoleById(Long id) {
		return dao.getRoleById(id);
	}

	public Integer deleteRoleById(Long id, User user) {
		return dao.deleteRoleById(id);
	}

	/**
	 * 列出所有的角色
	 * 
	 * @return
	 */
	public List<Role> listAll() {
		return dao.listAll();
	}

	/**
	 * 通过用户ID查询该角色信息
	 * 
	 * @param id
	 * @return
	 */
	public Role getRoleRescById(Long id) {
		return dao.getRoleRescById(id);
	}

	/**
	 * 添加映射关系
	 * 
	 * @param user_id
	 * @param ids
	 * @return
	 */
	public boolean UpdateRoleResc(Long role_id, String ids, User user) {
		// 先删除映射表中所有的隐射关系
		dao.deleteRoleRescRelationByUserId(role_id);
		if (ids == null || "".equals(ids.trim())) {
			return true;
		}
		// 将ids转成数据类型
		String[] rIds = ids.split(",");
		// 遍历出所有角色的ID，插入到映射表中
		int flag = 0;
		for (String id : rIds) {
			flag = dao.updateRoleRescRelation(role_id, Long.valueOf(id));
			if (flag == 0) {
				return false;
			}
		}
		// 添加日志
		return true;
	}

	/**
	 * 更新角色信息
	 * 
	 * @param role
	 * @return
	 */
	public Integer updateRole(Role role, User user) {
		return dao.updateRole(role);
	}
}
