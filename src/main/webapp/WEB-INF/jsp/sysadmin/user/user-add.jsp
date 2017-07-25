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
<title>创建用户</title>
</head>
<body>
	<div class="pd-20">
		<form action="${pageContext.request.contextPath}/user/async/add" method="post" class="form form-horizontal"
			id="form-customer-add">
			
			<div class="row cl">
				<label class="form-label col-3"><span class="c-red">*</span>用户名：</label>
				<div class="formControls col-5">
					<input type="text" class="input-text" value="" placeholder="请输入用户名"
						id="username" name="name" datatype="*" autocomplete="off"
						nullmsg="用户名不能为空" onblur="checkName();">
				</div>
				<div class="col-4"></div>
			</div>
			
			<div class="row cl">
				<label class="form-label col-3"><span class="c-red">*</span>用户角色：</label>
				<div class="formControls col-5">
					<span class="select-box"> <select class="select" size="1"
						name="role_id" datatype="*" nullmsg="请选择用户角色！">
							<option value="-1" selected>-- 请选择用户角色  --</option>
					 	    <c:forEach items="${roles}" var="role" >
						 	    <option value="${role.role_id}">${role.descn}</option>
					 	    </c:forEach>
					</select>
					</span>
				</div>
				<div class="col-4"></div>
			</div>
			
			
			<div class="row cl">
				<label class="form-label col-3"><span class="c-red">*</span>密码：</label>
				<div class="formControls col-5">
					<input type="password" class="input-text" value="" placeholder="请输入密码"
						id="pwd" name="pwd" datatype="*" autocomplete="off"
						nullmsg="密码不能为空">
				</div>
				<div class="col-4"></div>
			</div>
			
			<div class="row cl">
				<label class="form-label col-3"><span class="c-red">*</span>确认密码：</label>
				<div class="formControls col-5">
					<input type="password" class="input-text" value="" placeholder="请确认密码"
						id="password2" datatype="*" autocomplete="off"
						nullmsg="密码不能为空" recheck="pwd">
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
						$('.Validform_info').html('添加成功！');
						$('.Validform_close').click(function(){
							
							
							window.parent.location.reload();
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
		
		function checkName(){
			var username=$('#username').val();
			if(username!=""){
				var index = layer.load();
				var url = '${pageContext.request.contextPath}/user/async/checkName';
		        $.ajax({
		            'url' : url,
		            'type' : 'post',
		            'dataType' : 'json',
		            'data' : {
		                'username' : username
		            },
		            'success' : function(data, statusText) {
		                if (data.success) {
		                	
		                } else {
		                	layer.alert('用户名已存在！', {icon: 5});
		                	$('#username').val("");
		                	$('#username').focus();
		                }
		            }
		        });
		        layer.close(index); 
			}
		}
		
	</script>
</body>
</html>