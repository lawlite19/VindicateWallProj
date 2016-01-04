package com.hhit.service;

import java.util.Collection;
import java.util.List;

import com.hhit.dao.TbPrivilegeDAO;
import com.hhit.entity.TbPrivilege;

public class PrivilegeServiceImpl implements IPrivilegeService {
	private TbPrivilegeDAO privilegeDao;
	//查找顶级权限
	public List<TbPrivilege> findTopList() {
		return privilegeDao.findTopList();
	}
	//得到权限的url地址
	public Collection<String> getAllPrivilegeUrls() {
		return privilegeDao.findAllUrls();
	}
	@Override
	public List<TbPrivilege> findAll() {
		return privilegeDao.findAll();
	}
	//根据Id数组查找
	@Override
	public List<TbPrivilege> getByIds(Integer[] privilegeIds) {
		return privilegeDao.getByIds(privilegeIds);
	}

	public TbPrivilegeDAO getPrivilegeDao() {
		return privilegeDao;
	}
	public void setPrivilegeDao(TbPrivilegeDAO privilegeDao) {
		this.privilegeDao = privilegeDao;
	}




}
