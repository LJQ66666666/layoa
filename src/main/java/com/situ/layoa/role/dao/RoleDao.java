package com.situ.layoa.role.dao;

import org.springframework.stereotype.Repository;

import com.situ.layoa.baseclass.BaseDao;
import com.situ.layoa.role.domain.Role;
@Repository
public interface RoleDao extends BaseDao<Role> {

	Role getByName(String roleName);//根据名称查询实例



}
