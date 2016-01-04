package com.hhit.service;

import java.util.List;

import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.transaction.annotation.Transactional;

import com.hhit.dao.TbManageuserDAO;
import com.hhit.entity.TbManageuser;

public class ManageUserServiceImpl implements IManageUserService {
	private TbManageuserDAO manageUserDao;
	//修改密码
	@Override
	@Transactional
	public void updatePwd(TbManageuser userSession) {
		manageUserDao.attachDirty(userSession);
	}
	//查找后台所有用户
	@Override
	public List<TbManageuser> findAll() {
		return manageUserDao.findAll();
	}
	//删除用户
	@Override
	@Transactional
	public void deleteById(int id) {
		manageUserDao.deleteById(id);
	}
	//新建用户
	@Override
	@Transactional
	public void saveUser(TbManageuser manageUser) {
		manageUserDao.save(manageUser);
	}
	//初始化密码
	@Override
	@Transactional
	public void initPwd(int id) {
		String md5Digest=DigestUtils.md5Hex("12345qwe");
		manageUserDao.initPwd(id,md5Digest);
	}
	public TbManageuserDAO getManageUserDao() {
		return manageUserDao;
	}

	public void setManageUserDao(TbManageuserDAO manageUserDao) {
		this.manageUserDao = manageUserDao;
	}





}
