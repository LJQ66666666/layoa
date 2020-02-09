package com.situ.layoa.role.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.situ.layoa.baseclass.BaseDao;
import com.situ.layoa.role.domain.Role;
@Repository
public interface RoleDao extends BaseDao<Role> {

	Role findByRoleName(String roleName);//根据角色名称查询一个实例

	Integer getCount();

	List<Role> findByPage(@Param("firstResult")Integer firstResult, @Param("maxResults")Integer maxResults);

}
