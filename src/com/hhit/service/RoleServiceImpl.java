package com.hhit.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.hhit.dao.TbRoleDAO;
import com.hhit.entity.TbRole;

public class RoleServiceImpl implements IRoleService {
	private TbRoleDAO roleDao;

	//查找所有的角色
	@Override
	public List<TbRole> findAll() {
		return roleDao.findAll();
	}
	//新增角色
	@Override
	@Transactional
	public void save(TbRole role) {
		roleDao.save(role);
	}
	//根据Id查找
	@Override
	public TbRole getById(Integer id) {
		return roleDao.findById(id);
	}
	//修改
	@Override
	@Transactional
	public void update(TbRole role) {
		roleDao.update(role);
	}
	//删除
	@Override
	@Transactional
	public void delete(Integer id) {
		roleDao.deleteById(id);
	}
	public TbRoleDAO getRoleDao() {
		return roleDao;
	}

	public void setRoleDao(TbRoleDAO roleDao) {
		this.roleDao = roleDao;
	}





}
