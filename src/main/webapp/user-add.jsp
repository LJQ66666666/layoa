<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>用户新增</title>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<title>开始使用layui</title>
<link rel="stylesheet" href="assert/layui/css/layui.css">
</head>
<body>
	<form class="layui-form" lay-filter="form_student">
		<div class="layui-form-item">
			<label class="layui-form-label">学生名称</label>
			<div class="layui-input-block">
				<input name="stuName" required lay-verify="required|checkstuname" placeholder="请输入学生名称" autocomplete="off" class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">学生年龄</label>
			<div class="layui-input-block">
				<input name="stuAge" required lay-verify="required" placeholder="请输入学生年龄" autocomplete="off" class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">学生生日</label>
			<div class="layui-input-inline">
				<input name="stuBirthday" id="stuBirthday" lay-verify="required" placeholder="请选择学生生日" autocomplete="off" class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">学生性别</label>
			<div class="layui-input-block">
				<input type="radio" name="stuSex" value="1" title="男"> 
				<input type="radio" name="stuSex" value="0" title="女" checked>
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">学生爱好</label>
			<div class="layui-input-block">
				<input type="checkbox" name="stuLike" value="写作" title="写作"> 
				<input type="checkbox" name="stuLike" value="阅读" title="阅读" checked> 
				<input type="checkbox" name="stuLike" value="发呆" title="发呆">
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
	layui.use([ 'layer', 'form', 'laydate' ], function() {
		//通过一个变量将加载的模块取出
		var layer = layui.layer;
		var form = layui.form;
		var laydate = layui.laydate;
		//layui内置jQuery
		var $ = layui.$;
		//渲染日历
		laydate.render({
			elem : '#stuBirthday'//指定元素#用id选择
		});
		//表单的自定义校验
		form.verify({
			checkstuname:function(value,item){
				var msg;
				$.ajax({
					type:'get',
					async:false,
					url:'student/checkstuname',
					data:{"stuName":value},
					success:function(result){
						if(result==0){
							msg='此名称已被人使用';
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
				url : 'student',
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