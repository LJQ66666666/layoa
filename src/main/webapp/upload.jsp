<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>layui的文件上传</title>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<link rel="stylesheet" href="assert/layui/css/layui.css">
</head>
<body>
	学生头像：<button type="button" class="layui-btn" id="test1">
		<i class="layui-icon">&#xe67c;</i>上传图片
	</button>
	<!-- 此处隐藏域应该保存上传文件成功后返回的文件路径 -->
	<input type="hidden" name="stuImg" id="stuImg">
	<input type="hidden" id="rowId" value="100">
	
</body>
<script type="text/javascript" src="assert/layui/layui.js"></script>
<script type="text/javascript">
	//页面渲染完成后加载upload页面
	layui.use(['upload'],function(){
		var upload=layui.upload;
		var $=layui.$;
		//通过upload将button渲染成有上传功能
		upload.render({
			elem:'#test1',//绑定元素
			url:'upload',//上传接口
			field:'uploadFile',//设定文件域的字段名
			data:{"id":function(){
				return $('#rowId').val();
			}},
			acceptMime:'image/jpg',
			size:500,
			done:function(res){
				console.log(res.data);
				//将上传成功的文件路径赋给表单中的隐藏域
			},
			error:function(){
				//请求异常回调
			}
			
		});
	});
</script>
</html>