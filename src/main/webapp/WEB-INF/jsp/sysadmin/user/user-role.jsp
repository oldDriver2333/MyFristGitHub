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
<link href="${pageContext.request.contextPath}/css/common_style.css" rel="stylesheet" type="text/css">
<!--[if IE 6]>
<script type="text/javascript" src="http://lib.h-ui.net/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<title>授予角色</title>
</head>
<body>
	
	<div class="pd-20">
		<table cellspacing="0" style="margin-bottom:25px" cellpadding="0" width="100%" align="left" border="0">
			<tr>
				<td>
					<select class="ui_multiselect01 all_roles" multiple="multiple">
					 	<c:forEach items="${roles}" var="role">
					 		<option value="${role.role_id}">${role.role_name}</option>
					 	</c:forEach>
					 </select>
				</td>
				<td align="center">
					<input style="margin-bottom: 5px" type="button" id="select" value="添加" class="left2right btn btn-success"/>
					<input style="margin-bottom: 5px" type="button" id="selectAll" value="添加全部" class="left2right btn btn-success"/>
					<input style="margin-bottom: 5px" type="button" id="deselect" value="删除" class="left2right btn btn-default"/>
					<input type="button" id="deselectAll" value="删除全部" class="left2right btn btn-default"/>
				</td>
				<td>
					<select id="ids" class="ui_multiselect01 selected_roles" multiple="multiple">
					 	<c:forEach items="${USER_IN_REQUEST.roles}" var="role">
					 		<option selected="selected" value="${role.role_id}">${role.role_name}</option>
					 	</c:forEach>
					</select>
				</td>
			</tr>
		</table>
	
		<form action="${pageContext.request.contextPath}/user/async/updateRoles" onsubmit="updateUserRoles()"   method="post" class="form form-horizontal"
			id="form-customer-add">
			<!-- 隐藏域，标示用户ID -->
			<input type="text" id="user_id" value="${USER_IN_REQUEST.user_id}"  name="user_id" style="display:none">
			<input type="text" id="rolesId" name="ids" style="display:none">
			<div class="row cl">
				<div class="col-12">
					<input class="btn btn-primary radius" type="button" onclick="updateUserRoles()"
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
	
		function updateUserRoles(){
			var obj = $('#ids option');
			var user_id = $('#user_id').val();
			if(obj.length > 0){
				var ids = obj[0].value;
			}
			for(var index = 1 ; index < obj.length ; index++){
				ids = ids+","+obj[index].value;
			}
			var index = layer.load(1);
			$.ajax({
				url : '${pageContext.request.contextPath}/user/async/updateRoles',
				type : 'post',
				dateType : 'json',
				data : {
					'user_id' : user_id,
					'ids' : ids
				},
				success : function(data){
					if(data.success){
						layer.msg('修改成功');
						setTimeout(function(){
							window.parent.location.reload();
						}, 1500);
					}
				},
				error : function(data){
					layer.msg('系统出错');
				},
				complete : function(){
					layer.close(index);
				}
			})
			
		}
				
		
		$(function(){
			$("#select").click(function(){
				$(".all_roles option:selected").appendTo(".selected_roles");
			});
			
			$("#selectAll").click(function(){
				$(".all_roles option").appendTo(".selected_roles");
			});
			
			$("#deselect").click(function(){
				$(".selected_roles option:selected").appendTo(".all_roles");
			});
			
			$("#deselectAll").click(function(){
				$(".selected_roles option").appendTo(".all_roles");
			});
			
			$("#editForm").submit(function(){
				if($(".selected_roles option:selected").size()!=$(".selected_roles option")){
					$(".selected_roles option").prop("selected",true);
				}
			});
			
			if($(".selected_roles option").size()>0){
				var arr=$.map($(".selected_roles option"),function(option){
					return $(option).attr("value");
				});
				$(".all_roles option").filter(function(index){
					return $.inArray($(this).attr("value"),arr)>=0;
				}).remove();
			}
		})
		
	</script>
	
</body>
</html>