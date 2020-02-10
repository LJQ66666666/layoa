<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>角色管理</title>
<jsp:include page="/base.jsp"></jsp:include>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<link rel="stylesheet" href="assert/layui/css/layui.css">
<link rel="stylesheet" href="assert/pages/css/custom.css">
</head>
<body style="background-color: #F2F2F2;">
	<div class="layui-fluid">
		<div class="layui-row layui-col-space15">
			<div class="layui-col-md12">
				<div class="layui-card">

					<div class="layui-card-header">
						角色管理
						<!-- 新增按钮开始 -->
						<button type="button" class="layui-btn layui-btn-sm layui-btn-add">
							<i class="layui-icon layui-icon-addition"></i>新增
						</button>
						<!-- 新增按钮结束 -->
					</div>
					<!-- 搜索表单开始 -->
					<div class="layui-card-body">
						<form class="layui-form" id="form_search">
							<div class="layui-search-form">
								<div class="layui-inline">
									<select name="roleKind">
										<option value>角色类型</option>
										<option value="1">超级角色</option>
										<option value="0">普通角色</option>
									</select>
								</div>
								<div class="layui-inline">
									<input name="roleName" placeholder="角色名称" autocomplete="off" class="layui-input">
								</div>
								<div class="layui-inline">
									<!-- 搜索按钮开始 -->
									<button class="layui-btn layui-btn-primary  layui-btn-sm" lay-submit lay-filter="btn_search">
										<i class="layui-icon layui-icon-search"></i>
									</button>
									<!-- 搜索按钮结束 -->
									<!-- 重置按钮开始 -->
									<button class="layui-btn layui-btn-primary  layui-btn-sm">
										<i class="layui-icon layui-icon-refresh"></i>
									</button>
									<!-- 重置按钮结束 -->
								</div>
							</div>
						</form>
						<!-- 搜索表单结束 -->
						<table id="table_role" lay-filter="filter_table_role"></table>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/html" id="roleKindTpl">
  {{#  if(d.roleKind == 1){ }}
    <span class="layui-badge layui-bg-red">超级角色</span>
  {{#  } else { }}
    <span class="layui-badge layui-bg-green">普通角色</span>
  {{#  } }}
</script>
	<!-- 修改删除按钮 -->
	<script type="text/html" id="roleBtnTpl">
<button type="button" class="layui-btn layui-btn-xs layui-btn-warm" lay-event="edit">修改</button>
  {{#  if(d.roleKind == 1){ }}
    <button type="button" class="layui-btn layui-btn-xs layui-btn-disabled layui-btn-danger">删除</button>
  {{#  } else { }}
     <button type="button" class="layui-btn layui-btn-xs layui-btn-danger" lay-event="delete">删除</button>
  {{#  } }}
</script>
</body>
<script type="text/javascript" src="assert/layui/layui.js"></script>

<script type="text/javascript" src="assert/pages/js/role.js"></script>
</html>