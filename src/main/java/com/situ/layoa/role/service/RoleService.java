package com.situ.layoa.role.service;

import com.situ.layoa.baseclass.LayResult;
import com.situ.layoa.role.domain.Role;

public interface RoleService {

	Long saveRole(Role role);//新增一个角色

	Long doDeleteRole(Long rowId);//根据ID删除一个角色

	Role findRoleById(Long rowId);//根据ID查询一个角色

	Long doEditRole(Role role);

	LayResult findRoleByPage(Integer page, Integer limit, Role searchRole);

	Integer checkRoleName(String roleName);

}
