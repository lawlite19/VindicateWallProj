package com.hhit.service;

import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.transaction.annotation.Transactional;

import com.hhit.dao.TUserDAO;
import com.hhit.entity.TUser;

public class RegistServiceImpl implements IRegistService {
	private TUserDAO userDao;

	// 注册用户
	@Override
	@Transactional
	public void registerUser(TUser user) {
		//生成MD5摘要
		String md5Digest=DigestUtils.md5Hex(user.getPassword());
		user.setPassword(md5Digest);
		userDao.save(user);
	}
	@Override
	@Transactional
	public void updatePassword(TUser userFind) {
		userDao.attachDirty(userFind);
	}
	//个人中心--用户个人信息管理
	@Override
	@Transactional
	public void saveUserInfo(TUser user) {
		userDao.attachDirty(user);
	}
	public TUserDAO getUserDao() {
		return userDao;
	}
	public void setUserDao(TUserDAO userDao) {
		this.userDao = userDao;
	}


}
