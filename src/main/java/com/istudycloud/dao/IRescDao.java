package com.istudycloud.dao;

import java.util.List;

import com.istudycloud.datatable.DatatablesRequest;
import com.istudycloud.domain.Resc;

/**
 * 权限管理
 * @author Administrator
 *
 */
public interface IRescDao {
	
	List<Resc> findAll();
	/**
	 * 保存权限信息
	 * @param Resc 备份信息
	 * @return
	 */
	Integer saveResc(Resc resc);
	
	/**
	 * 查询某个权限的基本信息
	 * @param id
	 * @return
	 */
	Resc getRescById(Long id);
	
	/**
	 * 分页列出Resc的信息
	 * @return
	 */
	List<Resc> queryResc(DatatablesRequest dr);
	
	/**
	 * 获取记录总数
	 */
	Integer queryCount();
	
	/**
	 * 获取过滤后的权限总数
	 */
	int queryCountFilte(DatatablesRequest dr);
	
	/**
	 * 列出所有权限
	 * @return
	 */
	List<Resc> listAll();
	
	/**
	 * 根据ID删除权限
	 * @param id
	 * @return
	 */
	Integer deleteRescById(Long id);  
	
	/**
	 * 更新权限信息
	 * @param resc
	 * @return
	 */
	Integer updateResc(Resc resc);
	
	
}

