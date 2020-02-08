package com.situ.layoa.role.service;

import java.util.List;

import com.situ.layoa.role.domain.Role;

public interface RoleService {

	Long saveRole(Role role);//新增一个角色

	Role findByRoleName(String roleName);//根据角色名称查询一个实例

	Integer getCount();

	List<Role> findAllRole();

	Long doDeleteRole(Long rowId);//根据ID删除一个角色

	Role findRoleById(Long rowId);//根据ID查询一个角色

	Long doEditRole(Role role);

}
