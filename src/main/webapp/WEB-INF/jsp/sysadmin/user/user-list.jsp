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
	content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<!--[if lt IE 9]>
<script type="text/javascript" src="lib/html5.js"></script>
<script type="text/javascript" src="lib/respond.min.js"></script>
<script type="text/javascript" src="lib/PIE_IE678.js"></script>
<![endif]-->
<link href="${pageContext.request.contextPath}/css/H-ui.min.css" rel="stylesheet"
	type="text/css" />
<link href="${pageContext.request.contextPath}/css/H-ui.admin.css" rel="stylesheet"
	type="text/css" />
<link href="${pageContext.request.contextPath}/lib/Hui-iconfont/1.0.1/iconfont.css"
	rel="stylesheet" type="text/css" />
<!--[if IE 6]>
<script type="text/javascript" src="http://lib.h-ui.net/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<title>所有用户</title>

<style>
tr.text-c {
	cursor: pointer;
}
tr span{
	font-size: 16px;
}
.table td {
    text-align: center;
}
a:hover{
	text-decoration: none;
}
.dataTables_wrapper .dataTables_length .select {
    width: 70px;
}
</style>
</head>
<body>
	<nav class="breadcrumb">
		<i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span>
		用户管理 <span class="c-gray en">&gt;</span> 所有用户 <a
			class="btn btn-success radius r mr-20"
			style="line-height: 1.6em; margin-top: 3px"
			href="javascript:location.replace(location.href);" title="刷新"><i
			class="Hui-iconfont">&#xe68f;</i></a>
	</nav>
	<div class="pd-15">
		<div class="cl pd-5 bg-1 bk-gray">
			<span class="l"> <a href="javascript:;"
				onclick="layer_show('添加用户','${pageContext.request.contextPath}/user/view/add','','510')"
				class="btn btn-primary radius"><i class="Hui-iconfont">&#xe600;</i>
					添加用户</a>
			</span> 
		</div>
		<div class="mt-5">
			<table id="table_id"
				class="table table-border table-bordered table-hover table-bg table-sort text-c ">
				<thead>
					<tr class="text-c">
						<th width="">ID&nbsp;</th>
						<th width="">用户名</th>
						<th width="">创建者</th>
						<th width="">描述</th>
						<th width="150">邮箱</th>
						<th width="90">手机</th>
						<th width="">创建时间</th>
						<th width="">状态</th>
						<th width="">启用/冻结</th>
					</tr>
				</thead>
				<tbody>
				
				</tbody>
			</table>
		</div>
	</div>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/lib/jquery/1.9.1/jquery.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/lib/layer/1.9.3/layer.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/lib/laypage/1.2/laypage.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/lib/datatables/1.10.0/jquery.dataTables.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/H-ui.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/H-ui.admin.js"></script>
	<script type="text/javascript">
		$(function() {
			//-------------加载表格数据-----------------
			$('#table_id').dataTable( {
		        "bProcessing": true,
		        "sAjaxSource": '${pageContext.request.contextPath}/user/async/all',        //key应该是“aaData”
		        columns: [
		                  { data: 'user_id' },
		                  { data: 'username'},
		                  { data: 'created_by_username'},
		                  { data: 'descn' },
		                  { data: 'userInfo.email'},
		                  { data: 'userInfo.phone'},
		                  { data: 'created_date'},
		                  { data: 'statusHtml' },
		                  { data: 'html' }
		              ]
		    } );
		});
		
		/*管理员-编辑*/
		function admin_edit(title,w,h,id){
			layer_show(title,'${pageContext.request.contextPath}/user/view/updateInfo/'+id,w,h);
		}
		
		/*用户-角色*/
		function admin_role(title,w,h,id){
			layer_show(title,'${pageContext.request.contextPath}/user/view/updateRole/'+id,w,h);
		}
		
		//冻结用户
		function freezeUser(id){
			layer.confirm('确认冻结该用户?', {icon: 3, title:'提示'}, function(index){
				  var i = layer.load();
				  var url = '${pageContext.request.contextPath}/user/async/freeze/'+id;
			        $.ajax({
			            'url' : url,
			            'type' : 'post',
			            'dataType' : 'json',
			            'success' : function(data, statusText) {
			                if (data.success) {
			                	layer.alert('成功！', {icon: 6});
			                } else {
			                	layer.alert('失败！', {icon: 5});
			                }
			            }
			        });
			        
			      layer.close(i);
				  layer.close(index);
				  window.location.reload();
				});
		}
		//启用用户
		function useUser(id){
			layer.confirm('确认启用该用户?', {icon: 3, title:'提示'}, function(index){
				  var i = layer.load();
				  var url = '${pageContext.request.contextPath}/user/async/use/'+id;
			        $.ajax({
			            'url' : url,
			            'type' : 'post',
			            'dataType' : 'json',
			            'success' : function(data, statusText) {
			                if (data.success) {
			                	layer.alert('成功！', {icon: 6});
			                } else {
			                	layer.alert('失败！', {icon: 5});
			                }
			            }
			        });
			        
			      layer.close(i);
				  layer.close(index);
				  window.location.reload();
				});
		}
	</script>
</body>
</html>