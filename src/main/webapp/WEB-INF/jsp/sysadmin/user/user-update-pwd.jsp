<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" import="cabby.pojo.*,cabby.pojo.response.*"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,member-scalable=no" />
<meta http-equiv="Cache-Control" content="no-store" />
<!--[if lt IE 9]>
<script type="text/javascript" src="lib/html5.js"></script>
<script type="text/javascript" src="lib/respond.min.js"></script>
<script type="text/javascript" src="lib/PIE_IE678.js"></script>
<![endif]-->
<link href="${pageContext.request.contextPath}/css/H-ui.min.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/H-ui.admin.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/lib/Hui-iconfont/1.0.1/iconfont.css" rel="stylesheet"
	type="text/css" />
<!--[if IE 6]>
<script type="text/javascript" src="http://lib.h-ui.net/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<title>修改密码</title>
</head>
<body>
	<div class="pd-20">
		<form action="${pageContext.request.contextPath}/user/async/pwd/update" method="post" class="form form-horizontal"
			id="form-customer-add">
			
			<div class="row cl">
				<label class="form-label col-3"><span class="c-red">*</span>原密码：</label>
				<div class="formControls col-5">
					<input type="password" class="input-text" value="" placeholder="请输入原密码"
						id="oldPassword" name="oldPassword" datatype="*" autocomplete="off"
						nullmsg="原密码不能为空">
				</div>
				<div class="col-4"></div>
			</div>
			
			<div class="row cl">
				<label class="form-label col-3"><span class="c-red">*</span>新密码：</label>
				<div class="formControls col-5">
					<input type="password" class="input-text" value="" placeholder="请输入新密码"
						name="newPassword" datatype="*" autocomplete="off"
						nullmsg="新密码不能为空" >
				</div>
				<div class="col-4"></div>
			</div>
			
			<div class="row cl">
				<label class="form-label col-3"><span class="c-red">*</span>确认新密码：</label>
				<div class="formControls col-5">
					<input type="password" class="input-text" value="" placeholder="请确认新密码"
						id="password2" datatype="*" autocomplete="off"
						nullmsg="新密码不能为空" recheck="newPassword">
				</div>
				<div class="col-4"></div>
			</div>
			
			<div class="row cl">
				<div class="col-9 col-offset-3">
					<input class="btn btn-primary radius" type="submit"
						value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
				</div>
			</div>
		</form>
	</div>
	<script type="text/javascript" src="${pageContext.request.contextPath}/lib/jquery/1.9.1/jquery.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/lib/Validform/5.3.2/Validform.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/lib/layer/1.9.3/layer.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/H-ui.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/H-ui.admin.js"></script>
	<script type="text/javascript">
		$(function() {
			$("#form-customer-add").Validform({
				tiptype : 2,
				ajaxPost:true,//使用ajax方式提交表单数据
				//showAllError:true,//提交表单时所有错误提示信息都会显示
				postonce:true,//开启二次提交防御，数据成功提交后，表单将不能再继续提交
				callback : function(data) {
					if(data.status=='y'){
						$('.Validform_title').css('background-color','#5EB95E');
						$('.Validform_info').html('修改成功！');
						$('.Validform_close').click(function(){
							
							
							
							//window.location.reload();
							//关闭弹出窗
							layer_close();
							//刷新父窗口
							//window.parent.location.reload();
						});
						
						
					}else{
						$('.Validform_title').css('background-color','#DD514C');
						$('.Validform_info').html('失败！'+data.info);
					}
					
					/* 
					form[0].submit();
					var index = parent.layer.getFrameIndex(window.name);
					parent.$('.btn-refresh').click();
					parent.layer.close(index); */
				}
			});
		});
	</script>
</body>
</html>