package com.situ.layoa.role.controller;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.situ.layoa.role.domain.Role;
import com.situ.layoa.role.service.RoleService;

@RestController
@RequestMapping("/role")
public class RoleController implements Serializable {
	private static final long serialVersionUID = 1L;
	@Autowired
	private RoleService roleService;

	@PostMapping
	public Long doAddRole(Role role) {
		return roleService.saveRole(role);
	}

	@GetMapping("/checkrolename")
	public Integer checkRoleName(String roleName) {
		Integer result = 1;
		Role role = roleService.findByRoleName(roleName);
		if (role != null) {
			result = 0;
		}
		return result;
	}
}
