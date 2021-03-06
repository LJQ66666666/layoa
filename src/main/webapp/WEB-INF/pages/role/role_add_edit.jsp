<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<form class="layui-form" lay-filter="form_role_add_edit">
	<div class="layui-form-item">
		<label class="layui-form-label">角色名称</label>
		<div class="layui-input-block">
			<input name="roleName" id="roleName" required lay-verify="required|checkrolename" placeholder="请输入角色名称" autocomplete="off" class="layui-input">
		</div>
	</div>
	<div class="layui-form-item">
		<label class="layui-form-label">角色编号</label>
		<div class="layui-input-block">
			<input name="roleCode" id="roleCode" required lay-verify="required" placeholder="请输入角色编号" autocomplete="off" class="layui-input">
		</div>
	</div>
	<div class="layui-form-item">
		<label class="layui-form-label">角色类型</label>
		<div class="layui-input-block" id="roleKind">
			<input type="radio" name="roleKind"  value="1" title="超级角色"> 
			<input type="radio" name="roleKind"  value="0" title="普通角色" checked>
		</div>
	</div>
	<div class="layui-form-item layui-form-text">
		<label class="layui-form-label">角色简介</label>
		<div class="layui-input-block">
			<textarea name="roleInfo" id="roleInfo" placeholder="请输入内容" class="layui-textarea"></textarea>
		</div>
	</div>
	<input type="hidden" name="rowId" id="rowId">
	<div class="layui-form-item">
		<div class="layui-input-block">
			<button class="layui-btn" lay-submit lay-filter="but_submit">立即提交</button>
			<button type="reset" class="layui-btn layui-btn-primary">重置</button>
		</div>
	</div>
</form>
<script type="text/javascript" src="assert/pages/js/role_add_edit.js"></script>