package com.situ.layoa.role.service.impl;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.situ.layoa.baseclass.LayResult;
import com.situ.layoa.role.dao.RoleDao;
import com.situ.layoa.role.domain.Role;
import com.situ.layoa.role.service.RoleService;
import com.situ.layoa.utils.DAOUtils;

@Service
public class RoleServiceImpl implements RoleService, Serializable {
	private static final long serialVersionUID = 1L;
	@Autowired
	private RoleDao roleDao;

	@Override
	public Long saveRole(Role role) {
		role.setActiveFlag(1);
		role.setCreateBy("admin");
		role.setCreateDate(new Date());
		return roleDao.save(role);
	}

	@Override
	public Long doDeleteRole(Long rowId) {
		return roleDao.delete(rowId);
	}

	@Override
	public Role findRoleById(Long rowId) {
		return roleDao.get(rowId);
	}

	@Override
	public Long doEditRole(Role role) {
		role.setUpdateBy("admin");
		role.setUpdateDate(new Date());
		return roleDao.update(role);
	}

	@Override
	public LayResult findRoleByPage(Integer page, Integer limit, Role searchRole) {
		Role searchParam = DAOUtils.buildSearchParam(searchRole);
		Integer dataCount = roleDao.getCount(searchParam);
		List<Role> roleList = roleDao.findByPage(DAOUtils.buildPagination(page, limit, dataCount), searchParam);
		return new LayResult(0, "", dataCount, roleList);
	}

	@Override
	public Integer checkRoleName(String roleName) {
		Role role = roleDao.getByName(roleName);
		return role != null ? 1 : 0;
	}

	
	
}
