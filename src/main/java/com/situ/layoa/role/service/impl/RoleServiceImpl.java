package com.situ.layoa.role.service.impl;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.situ.layoa.role.dao.RoleDao;
import com.situ.layoa.role.domain.Role;
import com.situ.layoa.role.service.RoleService;

@Service
public class RoleServiceImpl implements RoleService,Serializable {
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
	public Role findByRoleName(String roleName) {
		return roleDao.findByRoleName(roleName);
	}

	@Override
	public Integer getCount() {
		return roleDao.getCount();
	}

	@Override
	public List<Role> findAllRole() {
		return roleDao.find();
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


}
