package com.istudycloud.service;

import java.util.List;

import com.istudycloud.datatable.DatatablesRequest;
import com.istudycloud.domain.Resc;
import com.istudycloud.domain.User;

public interface IRescService {

	public Integer saveResc(Resc resc, User user);

	public List<Resc> queryResc(DatatablesRequest dr);

	public Resc getRescById(Long id);

	public Integer deleteRescById(Long id, User user);

	public List<Resc> listAll();

	public Integer updateResc(Resc resc, User user);
	
}
