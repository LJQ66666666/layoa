package com.situ.layoa.role.controller;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.situ.layoa.baseclass.LayResult;
import com.situ.layoa.role.domain.Role;
import com.situ.layoa.role.service.RoleService;

@RestController
@RequestMapping("/role")
public class RoleController implements Serializable {
	private static final long serialVersionUID = 1L;
	private static final String PAGE_ROLE_INDEX = "role/role_index";
	private static final String PAGE_ROLE_ADD_EDIT = "role_add_edit";
	@Autowired
	private RoleService roleService;

	// 进新增页面
	@GetMapping("/goadd")
	public ModelAndView goAddRole(ModelAndView modelAndView) {
		modelAndView.setViewName(PAGE_ROLE_ADD_EDIT);
		return modelAndView;
	}

	// 进修改页面

	@GetMapping("/edit")
	public ModelAndView goEditRole(ModelAndView modelAndView) {
		modelAndView.setViewName(PAGE_ROLE_ADD_EDIT);
		return modelAndView;
	}

	// 执行新增
	@PostMapping
	public Long doAddRole(Role role) {
		return roleService.saveRole(role);
	}

	// 对角色名称进行唯一校验
	@GetMapping("/checkrolename")
	public Integer checkRoleName(String roleName) {
		Integer result = 1;
		Role role = roleService.findByRoleName(roleName);
		if (role != null) {
			result = 0;
		}
		return result;
	}

	// 分页，并查询所有角色信息
	@GetMapping("/{page}/{limit}")
	public LayResult findAllRole(@PathVariable Integer page, @PathVariable Integer limit) {
		System.out.println(page);
		System.out.println(limit);
		Integer count = roleService.getCount();
		List<Role> roleList = roleService.findAllRole();
		return new LayResult(0, "", count, roleList);
	}

	// 执行删除
	@DeleteMapping("/{rowId}")
	public Long doDeleteRole(@PathVariable Long rowId) {
		return roleService.doDeleteRole(rowId);
	}

	// 进修改
	@GetMapping("/{rowId}")
	public Role findRoleById(@PathVariable Long rowId) {
		return roleService.findRoleById(rowId);
	}
	//执行修改
	@PutMapping
	public Long doEditRole(Role role) {
		return roleService.doEditRole(role);
	}

}
