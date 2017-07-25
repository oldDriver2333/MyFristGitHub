package com.istudycloud.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.istudycloud.dao.IRescDao;
import com.istudycloud.datatable.DatatablesRequest;
import com.istudycloud.domain.Resc;
import com.istudycloud.domain.User;
import com.istudycloud.service.IRescService;

@Service("rescService")
public class RescServiceImpl implements IRescService{
	@Resource
	private IRescDao dao;

	public Integer saveResc(Resc resc, User user) {
		int flag = dao.saveResc(resc);
		return flag;
	}

	public List<Resc> queryResc(DatatablesRequest dr) {
		int sum = 0;
		if (dr.getSearchKey() != null && !"".equals(dr.getSearchKey().trim())) {
			sum = dao.queryCountFilte(dr);
			dr.setFilteTotal(sum);
		} else {
			sum = dao.queryCount();
			dr.setTotal(sum);// 总记录数
		}
		return dao.queryResc(dr);
	}

	public Resc getRescById(Long id) {
		return dao.getRescById(id);
	}

	public Integer deleteRescById(Long id, User user) {
		return dao.deleteRescById(id);
	}

	public List<Resc> listAll() {
		return dao.listAll();
	}

	public Integer updateResc(Resc resc, User user) {
		return dao.updateResc(resc);
	}
}
