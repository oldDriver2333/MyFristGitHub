package com.istudycloud.domain;

/**
 * 权限管理
 * 
 * @author Administrator
 *
 */
public class Resc extends BaseDomain{
	private static final long serialVersionUID = -369520764921212854L;
	private Long resc_id;
	private String resc_name;
	private String res_type;
	private String res_string;
	private Integer priority;
	private String descn;
	
	public String getHtml(){
		String str = "<a title='编辑' onclick='updateResc("+resc_id+")' ><span class='Hui-iconfont'>&#xe6df;</span></a>";
		str = str + "<a style='margin-left:20px' title='删除权限' href='javascript:;' onclick='deleteResc("+resc_id+")' class='ml-5' style='text-decoration:none'><i class='Hui-iconfont'>&#xe6e2;</i></a>";
		return str;
	}
	
	public Long getResc_id() {
		return resc_id;
	}
	public void setResc_id(Long resc_id) {
		this.resc_id = resc_id;
	}
	public String getResc_name() {
		return resc_name;
	}
	public void setResc_name(String resc_name) {
		this.resc_name = resc_name;
	}
	public String getRes_type() {
		return res_type;
	}
	public void setRes_type(String res_type) {
		this.res_type = res_type;
	}
	public String getRes_string() {
		return res_string;
	}
	public void setRes_string(String res_string) {
		this.res_string = res_string;
	}
	public Integer getPriority() {
		return priority;
	}
	public void setPriority(Integer priority) {
		this.priority = priority;
	}
	public String getDescn() {
		return descn;
	}
	public void setDescn(String descn) {
		this.descn = descn;
	}
	
	

}
