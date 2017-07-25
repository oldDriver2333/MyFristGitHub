package com.istudycloud.datatable;

/**
 * 服务方法调用返回值消息格式
 *
 * @author Cabby
 */
public class CallbackResult {
	//是否成功
	private boolean	success=false;
	//返回消息
	private String	message;
	//返回对象
	private Object	details;

	public CallbackResult() {
	}

	public CallbackResult(boolean success) {
		this.success = success;
	}
	
	public CallbackResult(boolean success, Object details) {
		super();
		this.success = success;
		this.details = details;
	}

	public CallbackResult(boolean success, String message) {
		this.success = success;
		this.message = message;
	}

	public CallbackResult(boolean success, String message, Object details) {
		this.success = success;
		this.message = message;
		this.details = details;
	}

	public Object getDetails() {
		return details;
	}

	public void setDetails(Object details) {
		this.details = details;
	}

	public boolean isSuccess() {
		return success;
	}

	public void setSuccess(boolean success) {
		this.success = success;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}
}