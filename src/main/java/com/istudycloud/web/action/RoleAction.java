package com.istudycloud.web.action;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.istudycloud.datatable.DatatablesRequest;
import com.istudycloud.datatable.DatatablesResponse;
import com.istudycloud.domain.Role;
import com.istudycloud.service.IRescService;
import com.istudycloud.service.IRoleService;

@Controller
@RequestMapping("/role")
public class RoleAction {
	@Resource(name="roleService")
	private IRoleService service;
	@Resource(name="rescService")
	private IRescService rescService;
	
	@ResponseBody
	@RequestMapping("/async/query")
	public DatatablesResponse<Role> all(HttpServletRequest request) {
		DatatablesRequest dr = new DatatablesRequest(request);
		List<Role> list = service.queryRole(dr);
		DatatablesResponse<Role> resp = new DatatablesResponse<Role>();
		resp.setAaData(list);
		resp.setiTotalDisplayRecords(dr.getFilteTotal());
		resp.setiTotalRecords(dr.getTotal());
		return resp;
	}
	
	@RequestMapping("/view/all")
	public ModelAndView allView() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("sysadmin/role/role-list");
		return mv;
	}
	
}
