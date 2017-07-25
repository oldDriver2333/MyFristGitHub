<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" import="cabby.pojo.*,cabby.pojo.response.*"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,member-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<!--[if lt IE 9]>
<script type="text/javascript" src="lib/html5.js"></script>
<script type="text/javascript" src="lib/respond.min.js"></script>
<script type="text/javascript" src="lib/PIE_IE678.js"></script>
<![endif]-->
<link href="${pageContext.request.contextPath}/css/H-ui.min.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/H-ui.admin.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/lib/icheck/icheck.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/lib/Hui-iconfont/1.0.1/iconfont.css" rel="stylesheet" type="text/css" />
<!--[if IE 6]>
<script type="text/javascript" src="http://lib.h-ui.net/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<script type="text/javascript" src="${pageContext.request.contextPath}/lib/My97DatePicker/WdatePicker.js"></script>
<title>新增权限</title>
</head>
<body>
<nav class="breadcrumb">
		<i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span>
		系统管理 <span class="c-gray en">&gt;</span> 新增权限
</nav>
<div class="pd-20">
  <form action="${pageContext.request.contextPath}/resc/async/add" method="post" class="form form-horizontal" 
  id="form-salesMan-add" >
  	<!-- 权限名称 -->
    <div class="row cl">
      <label class="form-label col-3">权限名称:</label>
      <div class="formControls col-5">
        <input type="text" class="input-text" value=""  autocomplete="off"
         placeholder="权限名称" id="resc_name" name="resc_name">
      </div> 
      <div class="col-4"> </div>
    </div>
    
    <!-- 权限类型 -->
    <div class="row cl">
      <label class="form-label col-3">权限类型:</label>
      <div class="formControls col-5">
        <input type="text" class="input-text" value=""  autocomplete="off"
         placeholder="权限类型" id="res_type" name="res_type">
      </div> 
      <div class="col-4"> </div>
    </div>
    
    <!-- 资源路径 -->
    <div class="row cl">
      <label class="form-label col-3">资源路径:</label>
      <div class="formControls col-5">
        <input type="text" class="input-text" value=""  autocomplete="off"
         placeholder="资源路径" id="res_string" name="res_string">
      </div> 
      <div class="col-4"> </div>
    </div>
    
     <!-- 优先级 -->
    <div class="row cl">
      <label class="form-label col-3">优先级:</label>
      <div class="formControls col-5">
        <input type="number" class="input-text" value=""  autocomplete="off"
         placeholder="优先级" id="priority" name="priority">
      </div> 
      <div class="col-4"> </div>
    </div>
    
    
    
    <!-- 权限描述 -->
    <div class="row cl">
      <label class="form-label col-3">权限描述:</label>
      <div class="formControls col-5">
        <input type="text" class="input-text" value=""  autocomplete="off"
         placeholder="权限描述" id="descn" name="descn">
      </div> 
      <div class="col-4"> </div>
    </div>
    
    <div class="row cl">
      <div class="col-9 col-offset-3">
        <input class="btn btn-primary radius" type="submit" value="&nbsp;&nbsp;确定提交&nbsp;&nbsp;">
      </div>
    </div>
  </form>
</div>
<script type="text/javascript" src="${pageContext.request.contextPath}/lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath}/lib/icheck/jquery.icheck.min.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath}/lib/Validform/5.3.2/Validform.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/lib/layer/1.9.3/layer.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/H-ui.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath}/js/H-ui.admin.js"></script>
<script type="text/javascript">
$(function(){
	$("#form-salesMan-add").Validform({
		tiptype : 2,
		ajaxPost:true,//使用ajax方式提交表单数据
		//showAllError:true,//提交表单时所有错误提示信息都会显示
		postonce:true,//开启二次提交防御，数据成功提交后，表单将不能再继续提交
		callback : function(data) {
			if(data.status=='y'){
				$('.Validform_title').css('background-color','#5EB95E');
				$('.Validform_info').html('添加成功！');
				$('.Validform_close').click(function(){
					
					//window.location.reload();
					//刷新父窗口
					window.parent.location.reload();
					//关闭弹出窗
					layer_close();
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