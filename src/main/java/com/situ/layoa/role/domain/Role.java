package com.situ.layoa.role.domain;

import java.io.Serializable;

import org.apache.ibatis.type.Alias;

import com.situ.layoa.baseclass.BaseClass;
@Alias("Role")
public class Role extends BaseClass implements Serializable {
	private static final long serialVersionUID = 1L;
	private String roleName;//角色名称#要求唯一性校验
	private String roleCode;//角色编号
	private Integer roleKind;//角色类型1：超级角色0：普通角色
	private String roleInfo;//角色简介
	public String getRoleName() {
		return roleName;
	}
	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}
	public String getRoleCode() {
		return roleCode;
	}
	public void setRoleCode(String roleCode) {
		this.roleCode = roleCode;
	}
	public Integer getRoleKind() {
		return roleKind;
	}
	public void setRoleKind(Integer roleKind) {
		this.roleKind = roleKind;
	}
	public String getRoleInfo() {
		return roleInfo;
	}
	public void setRoleInfo(String roleInfo) {
		this.roleInfo = roleInfo;
	}
	
}
