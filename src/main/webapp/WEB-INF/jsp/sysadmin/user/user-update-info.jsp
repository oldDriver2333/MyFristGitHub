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
<link href="${pageContext.request.contextPath}/css/H-ui.min.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/H-ui.admin.css"
	rel="stylesheet" type="text/css" />
<link
	href="${pageContext.request.contextPath}/lib/Hui-iconfont/1.0.1/iconfont.css"
	rel="stylesheet" type="text/css" />
<!--[if IE 6]>
<script type="text/javascript" src="http://lib.h-ui.net/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<title>创建用户</title>
</head>
<body>
	<div class="pd-20">
		<form
			action="${pageContext.request.contextPath}/user/async/updateInfo"
			method="post" class="form form-horizontal" id="form-customer-add">
			
			<!-- 隐藏域ID -->
			<input name="infoId"  value="${USER_IN_REQUEST.userInfo.infoId}" style="display:none">
			<input name="userId" value="${USER_IN_REQUEST.user_id}" style="display:none">
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3"><span
					class="c-red">*</span>性别：</label>
				<div class="formControls col-xs-8 col-sm-9 skin-minimal">
					<div class="radio-box">
						<input name="sex" type="radio" id="sex-1" value="001" checked > <label
							for="sex-1" >男</label>
					</div>
					<div class="radio-box">
						<input type="radio" id="sex-2" name="sex" value="002"> <label
							for="sex-2" value="002" >女</label>
					</div>
					<div class="radio-box">
						<input type="radio" id="sex-3" name="sex" value="003"> <label
							for="sex-3"  >保密</label>
					</div>
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3"><span
					class="c-red">*</span>手机：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<input type="text" class="input-text" placeholder=""
						id="mobile" name="phone" value="${USER_IN_REQUEST.userInfo.phone}">
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3"><span
					class="c-red">*</span>QQ号码：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<input type="text" class="input-text" placeholder=""
						id="mobile" name="qq" value="${USER_IN_REQUEST.userInfo.qq}">
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3"><span
					class="c-red">*</span>邮箱：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<input type="text" class="input-text"  value="${USER_IN_REQUEST.userInfo.email}" placeholder="@" name="email"
						id="email">
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3">备注：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<textarea name="remark" cols="" rows="" class="textarea"
						placeholder="说点什么...最少输入10个字符" onKeyUp="textarealength(this,100)">${USER_IN_REQUEST.userInfo.remark}</textarea>
					<p class="textarea-numberbar">
						<em class="textarea-length">0</em>/100
					</p>
				</div>
			</div>

			<div class="row cl">
				<div class="col-9 col-offset-3">
					<input class="btn btn-primary radius" type="submit"
						value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
				</div>
			</div>
		</form>
	</div>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/lib/jquery/1.9.1/jquery.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/lib/Validform/5.3.2/Validform.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/lib/layer/1.9.3/layer.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/js/H-ui.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/js/H-ui.admin.js"></script>
	<script type="text/javascript">
		$(function() {
			$("#form-customer-add").Validform(
					{
						tiptype : 2,
						ajaxPost : true,//使用ajax方式提交表单数据
						//showAllError:true,//提交表单时所有错误提示信息都会显示
						postonce : true,//开启二次提交防御，数据成功提交后，表单将不能再继续提交
						callback : function(data) {
							if (data.status == 'y') {
								$('.Validform_title').css('background-color',
										'#5EB95E');
								$('.Validform_info').html('添加成功！');
								$('.Validform_close').click(function() {

									window.parent.location.reload();
									//window.location.reload();
									//关闭弹出窗
									layer_close();
									//刷新父窗口
									//window.parent.location.reload();
								});

							} else {
								$('.Validform_title').css('background-color',
										'#DD514C');
								$('.Validform_info').html('失败！' + data.info);
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