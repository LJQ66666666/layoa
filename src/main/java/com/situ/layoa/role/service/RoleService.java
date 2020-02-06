package com.situ.layoa.role.service;

import com.situ.layoa.role.domain.Role;

public interface RoleService {

	Long saveRole(Role role);//新增一个角色

	Role findByRoleName(String roleName);//根据角色名称查询一个实例

}
