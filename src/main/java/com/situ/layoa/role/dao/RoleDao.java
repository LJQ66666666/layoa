package com.situ.layoa.role.dao;

import org.springframework.stereotype.Repository;

import com.situ.layoa.baseclass.BaseDao;
import com.situ.layoa.role.domain.Role;
@Repository
public interface RoleDao extends BaseDao<Role> {

	Role findByRoleName(String roleName);//根据角色名称查询一个实例

	Integer getCount();

}
