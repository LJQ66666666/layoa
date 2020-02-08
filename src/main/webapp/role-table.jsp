<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>layui-table</title>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<link rel="stylesheet" href="assert/layui/css/layui.css">
</head>
<body>
	<button type="button" class="layui-btn" id="btn_add">新增</button>
	<table id="demo" lay-filter="table_role"></table>
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

<script type="text/javascript">
	layui.use(['layer','table','form'], function() {
		var $ = layui.$;
		var layer = layui.layer;
		var table = layui.table;
		var form = layui.form;
		table.render({
			elem : '#demo',
			//height : 600,
			url : 'role',
			limit:10,
			page : true,
			cols : [ [ //表头
			{
				field : 'rowId',
				title : 'ID',
				width : 80,
				sort : true,
				fixed : 'left'
			}, {
				field : 'roleName',
				title : '角色名称',
				width : 180
			}, {
				field : 'roleCode',
				title : '角色编号',
				width : 180,
				sort : true
			}, {
				field : 'roleKind',
				title : '角色类别',
				width : 180,
				align : 'center',
				templet : '#roleKindTpl'
			}, {
				field : 'roleInfo',
				title : '角色简介',
				width : 177
			}, {
				field : '',
				title : '操作',
				width : 120,
				templet : '#roleBtnTpl'
			}
			/* ,{field: 'score', title: '评分', width: 80, sort: true}
			,{field: 'classify', title: '职业', width: 80}
			,{field: 'wealth', title: '财富', width: 135, sort: true}  */
			] ]
		});
		//对table里面的按钮进行绑定
		table.on('tool(table_role)', function(obj) { //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
			var data = obj.data; //获得当前行数据
			var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
			var rowId = data.rowId;
			switch (layEvent) {
			case 'edit':
				console.log("准备执行修改");
				//
				$.ajax({
					url:'role/'+rowId,
					type:'get',
					success:function(role){
						if(role){
							  $.ajax({
									url:'role/edit',
									type:'get',
									success:function(htmlDate){
										console.log(htmlDate);
										layer.open({
											  type: 1, //1表示弹出的是页面层
											  title:'修改角色',
											  area: '800px',//设置宽度，高度自适应
											  content: htmlDate, //这里content是一个DOM
											  success:function(){
												  form.render(null,'form_role_add_edit');
												  $('lay-verify').remove();
												  var roleName=role.roleName;
												  //如何跳过当前数据的唯一性校验呢？
												  $('#roleName').val(roleName)/* .attr('lay-verify',roleName) */;
												  $('#roleCode').val(role.roleCode);
												  $('#roleKind').val(role.roleKind);
												  $('#roleInfo').val(role.roleInfo);
												  $('#rowId').val(role.rowId);
											  }
										});
									}
								});
							
						}
					}
				});
				// 
			/* $.ajax({
					url:'role/edit',
					type:'get',
					success:function(htmlDate){
						console.log(htmlDate);
						layer.open({
							  type: 1, //1表示弹出的是页面层
							  title:'修改角色',
							  area: '800px',//设置宽度，高度自适应
							  content: htmlDate, //这里content是一个DOM
							  success:function(){
								  form.render(null,'form_role_add_edit');
							  }
						});
					}
				}); */
				break;
			case 'delete':
				if (confirm('你确定要删除吗？')) {
					$.ajax({
						url:'role/'+rowId,
						type:'delete',
						success:function(result){
							table.reload('demo');
						}
						
					});
				}
				break;
			default:
				break;
			}
		});
		//绑定新增按钮
		$('#btn_add').off('click').on('click',function(){
			//alert("1111");
			$.ajax({
				url:'role/goadd',
				type:'get',
				success:function(htmlDate){
					console.log(htmlDate);
					layer.open({
						  type: 1, //1表示弹出的是页面层
						  title:'新增角色',
						  area: '800px',//设置宽度，高度自适应
						  content: htmlDate, //这里content是一个DOM
						  success:function(){
							  form.render(null,'form_role_add_edit');
						  }
					});
				}
			});
			/* layer.open({
			  type: 1, //1表示弹出的是页面层
			  title:'新增角色',
			  content: '传入任意的文本或html' //这里content是一个普通的String
			}); */
		});
	});
</script>
</html>