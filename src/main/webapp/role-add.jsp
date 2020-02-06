<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>角色新增</title>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<title>开始使用layui</title>
<link rel="stylesheet" href="assert/layui/css/layui.css">
</head>
<body>
	<form class="layui-form" lay-filter="form_role">
		<div class="layui-form-item">
			<label class="layui-form-label">角色名称</label>
			<div class="layui-input-block">
				<input name="roleName" required lay-verify="required|checkrolename" placeholder="请输入角色名称" autocomplete="off" class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">角色编号</label>
			<div class="layui-input-block">
				<input name="roleCode" required lay-verify="required" placeholder="请输入角色编号" autocomplete="off" class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">角色类别</label>
			<div class="layui-input-block">
				<input type="radio" name="roleKind" value="1" title="超级角色"> 
				<input type="radio" name="roleKind" value="0" title="普通角色" checked>
			</div>
		</div>
		<div class="layui-form-item layui-form-text">
    <label class="layui-form-label">角色简介</label>
    <div class="layui-input-block">
      <textarea name="roleInfo" placeholder="请输入内容" class="layui-textarea"></textarea>
    </div>
  </div>


		<div class="layui-form-item">
			<div class="layui-input-block">
				<button class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>
				<button type="reset" class="layui-btn layui-btn-primary">重置</button>
			</div>
		</div>
	</form>
</body>
<script type="text/javascript" src="assert/layui/layui.js"></script>
<!-- 书写自己的脚本 -->
<script type="text/javascript">
	//layui.use 当页面渲染成功后，加载配置的模块儿
	layui.use([ 'layer', 'form' ], function() {
		//通过一个变量将加载的模块取出
		var layer = layui.layer;
		var form = layui.form;
		//var laydate = layui.laydate;
		//layui内置jQuery
		var $ = layui.$;
		//渲染日历
		//laydate.render({
		//	elem : '#stuBirthday'//指定元素#用id选择
		//});
		//表单的自定义校验
		form.verify({
			checkrolename:function(value,item){
				var msg;
				$.ajax({
					type:'get',
					async:false,
					url:'role/checkrolename',
					data:{"roleName":value},
					success:function(result){
						if(result==0){
							msg='此角色名称已经被使用了';
						}
					}
				});
				return msg;
			}
		});

		//绑定提交按钮
		form.on('submit(formDemo)', function(data) {
			console.log(data.elem);
			console.log(data.form);
			console.log(data.field);
			//form.val('filter',ibject);表单赋值，取值
			var formData = $(data.form).serialize();
			console.log(formData);
			$.ajax({
				type : 'post',
				url : 'role',
				data : formData,
				success : function(result) {
					if (result) {
						layer.msg('提交成功了');
					}
				}
			});
			//将按钮自带的提交动作屏蔽掉
			return false;
		});
	});
</script>
</html>