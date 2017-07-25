/**
 * This file created at 2016年4月29日.
 *
 * Copyright (c) 2002-2016 Bingosoft, Inc. All rights reserved.
 */
package com.istudycloud.datatable;

import java.util.List;

/**
 * <code>{@link DatatablesResponse}</code>
 *
 * TODO : document me
 *
 * @author Administrator
 */
public class DatatablesResponse<T> {
	private List<T> aaData; //aaData 与datatales 加载的“dataSrc"对应  
    private int iTotalDisplayRecords;   
    private int iTotalRecords;  
	
	
	/**
	 * 
	 */
	public DatatablesResponse() {
		// TODO Auto-generated constructor stub
	}


	/**
	 * @return the aaData
	 */
	public List<T> getAaData() {
		return aaData;
	}


	/**
	 * @param aaData the aaData to set
	 */
	public void setAaData(List<T> aaData) {
		this.aaData = aaData;
	}


	/**
	 * @return the iTotalDisplayRecords
	 */
	public int getiTotalDisplayRecords() {
		return iTotalDisplayRecords;
	}


	/**
	 * @param iTotalDisplayRecords the iTotalDisplayRecords to set
	 */
	public void setiTotalDisplayRecords(int iTotalDisplayRecords) {
		this.iTotalDisplayRecords = iTotalDisplayRecords;
	}


	/**
	 * @return the iTotalRecords
	 */
	public int getiTotalRecords() {
		return iTotalRecords;
	}


	/**
	 * @param iTotalRecords the iTotalRecords to set
	 */
	public void setiTotalRecords(int iTotalRecords) {
		this.iTotalRecords = iTotalRecords;
	}
	
	
	
	
}
