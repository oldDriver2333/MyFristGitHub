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

<!--第一步：引入Javascript / CSS （CDN）-->
<!-- DataTables CSS -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/DataTables/media/css/jquery.dataTables.css">
<!-- jQuery -->
<script type="text/javascript" charset="utf8" src="${pageContext.request.contextPath}/DataTables/media/js/jquery.js"></script>
<!-- DataTables -->
<script type="text/javascript" charset="utf8" src="${pageContext.request.contextPath}/DataTables/media/js/jquery.dataTables.js"></script>
<!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css" >
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.min.js" ></script>
<title>所有角色</title>
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
	<div class="pd-10">
		<div class="mt-5">
			<table id="table_id"
				class="table table-border table-bordered table-hover table-bg table-sort">
				<thead>
					<tr class="text-c" >
						<th width="">编号</th>
						<th width="">角色名</th>
						<th width="">描述</th>
						<th width="">创建时间</th>
						<th width="">创建人</th> 
						<th width="8%">最后修改人</th>
						<th width="">最后修改时间</th>
						<th width="">操作</th>
					</tr>
				</thead>
				<tbody>
				</tbody>
			</table>
		</div>
	</div>
	<script type="text/javascript">
	//使用DataTable分页
	$(function() {
		//-------------加载表格数据-----------------
		$('#table_id').dataTable( {
	    	"processing": true, //打开数据加载时的等待效果  
	        "serverSide": true,//打开后台分页  
	        "ajax": {  
	            "url": "${pageContext.request.contextPath}/role/async/query",   
	            "dataSrc": "aaData",   
	            "type": "POST",
	            "data": function ( d ) {  
	              //  var level1 = $('#level1').val();  
	                //添加额外的参数传给服务器  
	              //  d.extra_search = level1;  
	            }  
	        },  
	        'columns': [
	                   { data: 'role_id' },
	                   { data: 'role_name' },
	                   { data: 'descn' },
		               { data: 'created_by' },
		               { data: 'created_date' },
		               { data: 'last_updated_by' },
		               { data: 'last_updated_date' },
		               { data: null}
	              ],
            'columnDefs': [{
                //   指定第最后一列
                targets: 7,
		        //修改列中的参数，在此其中：row代表这一行的数据
                render: function(data, type, row, meta) {
                	var str = '<a type="button"  href="#" onclick="del('+"'"+row.role_id+"'"+')" >删除</a>';
                	str = str + '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
                	str = str + '<a type="button"  href="#" onclick="del('+"'"+row.role_id+"'"+')" >删除</a>';
                	return str;
                }
            }]
	    } ); 
	});
	
	//删除方法
	function del(id) {
		alert(id);
	}
	
	</script>
</body>
</html>