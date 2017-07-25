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
<script type="text/javascript"
		src="${pageContext.request.contextPath}/lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript"
		src="${pageContext.request.contextPath}/lib/layer/1.9.3/layer.js"></script>
<!--[if IE 6]>
<script type="text/javascript" src="http://lib.h-ui.net/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<title>所有权限</title>

<style>
.table td{
	text-align: center;
}
td span.Hui-iconfont{
	font-size: 18px;
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
		权限管理 <span class="c-gray en">&gt;</span> 所有权限  <a
			class="btn btn-primary radius r mr-20"
			style="line-height: 1.3em; margin-top: 3px"
			href="javascript:layer.load();location.replace(location.href);" title="刷新"><i
			class="Hui-iconfont">&#xe68f;</i></a>
	</nav>
	<div class="pd-10">
		<div class="cl pd-5 bg-1 bk-gray">
			<span class="l"> <a href="javascript:;"
				onclick="layer_show('添加权限','${pageContext.request.contextPath}/resc/view/add','','510')"
				class="btn btn-primary radius"><i class="Hui-iconfont">&#xe600;</i>
					添加权限</a>
			</span> 
		</div>
		<div class="mt-5">
			<table id="table_id"
				class="table table-border table-bordered table-hover table-bg table-sort">
				<thead>
					<tr class="text-c" >
						<th width="">编号</th>
						<th width="">资源名</th>
						<th width="">资源类型</th>
						<th width="">资源路径</th>
						<th width="">优先级</th> 
						<th width="">描述</th>
						<th width="">操作</th>
					</tr>
				</thead>
				<tbody>
				</tbody>
			</table>
		</div>
	</div>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/lib/My97DatePicker/WdatePicker.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/lib/datatables/1.10.0/jquery.dataTables.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/H-ui.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/H-ui.admin.js"></script>
	<script type="text/javascript">
	/*编辑权限*/
	function updateResc(resc_id){
		layer_show('权限更新','${pageContext.request.contextPath}/resc/view/update/'+resc_id,'800','500');
	}
	
	/*删除权限*/
	function deleteResc(id){
		layer.msg('确认删除该权限？', {
			  time: 0 //不自动关闭
			  ,btn: ['确定', '取消']
			  ,yes: function(index){
				  var index = layer.load(1);
				  $.ajax({
					  url : '${pageContext.request.contextPath}/resc/async/deleteResc',
					  type : 'post',
					  dataType : 'json',
					  data : {
						  'id' : id 
					  },
					  success : function(data){
						  if(data.success){
							  layer.msg('删除成功');
							  //删除成功
							  setTimeout(function(){
								  window.location.reload();
							  }, 1000);
						  }else{
							 layer.msg('删除失败');
						  }
					  },
					  error : function(data){
						  layer.msg('系统出错');
					  },
					  complete : function(){
						  layer.close(index);
					  }
				  });
			  }
		});
	}
	//授进入授权页面
	function grantPermission(role_id){
		layer_show('角色授权','${pageContext.request.contextPath}/role/view/to_grantDesc/'+role_id,'','510')
	}
	
	//使用DataTable分页
	$(function() {
		//-------------加载表格数据-----------------
		$('#table_id').dataTable( {
			"aaSorting": [[ 0, "desc" ]],//默认第几个排序
		// 	"bStateSave": true,//状态保存
			"aoColumnDefs": [
			  //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
			  {"orderable":false,"aTargets":[1,2,3,4,5]}// 不参与排序
			],
			"deferRender": true,//延迟渲染
			//"pagingType": "simple_numbers",//设置分页控件的模式  
	         searching: true,//屏蔽datatales的查询框  
	     //    aLengthMenu:[10],//设置一页展示10条记录  
	     //    "bLengthChange": false,//屏蔽tables的一页展示多少条记录的下拉列表  
	            "oLanguage": {  //对表格国际化  
	            "sLengthMenu": "每页显示 _MENU_条",    
	            "sZeroRecords": "没有找到符合条件的数据",    
	        //  "sProcessing": "&lt;img src=’./loading.gif’ /&gt;",    
	        //    "sInfo": "当前第 _START_ - _END_ 条　共计 _TOTAL_ 条",    
	            "sInfoEmpty": "木有木有记录",    
	            "sInfoFiltered": "(从 _MAX_ 条记录中过滤)",    
	            "sSearch": "关键字搜索：",    
	            "oPaginate": {    
	            "sFirst": "首页",    
	            "sPrevious": "上一页",    
	            "sNext": "下一页",    
	            "sLast": "尾页"    
	                   
	            }    
	        },  
	    "processing": true, //打开数据加载时的等待效果  
	        "serverSide": true,//打开后台分页  
	        "ajax": {  
	            "url": "${pageContext.request.contextPath}/resc/async/query",   
	            "dataSrc": "aaData",   
	            "type": "POST",
	            "data": function ( d ) {  
	              //  var level1 = $('#level1').val();  
	                //添加额外的参数传给服务器  
	              //  d.extra_search = level1;  
	            }  
	        },  
	        columns: [
	                   { data: 'resc_id' },
	                   { data: 'resc_name' },
	                   { data: 'res_type' },
		               { data: 'res_string' },
		               { data: 'priority' },
		               { data: 'descn' }
	              ]
	    } ); 
	});
	</script>
</body>
</html>