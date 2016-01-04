package com.hhit.service;

import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.transaction.annotation.Transactional;

import com.hhit.dao.TForbidusernameDAO;
import com.hhit.dao.TUserDAO;
import com.hhit.entity.TForbidusername;
import com.hhit.entity.TUser;
import com.opensymphony.xwork2.ActionContext;
//此类不可以添加事物的有关操作
public class LoginServiceImpl implements ILoginService {
	private TUserDAO userDao;
	private TForbidusernameDAO forbidDao;
	// 判断是否为合法用户
	@Override
	public boolean isValidateUser(String username, String password) {
		TUser user = userDao.findUserByName(username);
		String md5Digest=DigestUtils.md5Hex(password);
		if (user != null && md5Digest.equals(user.getPassword())
				&& user.getIsUsable() == 1){
			ActionContext.getContext().getSession().put("user", user);
			return true;
		}
			
		return false;
	}

	// ajax判断用户名是否存在
	@Override
	public TUser findByUName(String userName) {
		return userDao.findByUName(userName);
	}
	@Override
	public TUser findUserById(Long id) {
		return userDao.findById(id);
	}
	//从禁用用户名表中查找注册的用户名是否存在
	@Override
	public boolean findForbidUName(String userName) {
		return forbidDao.findByUName(userName);
	}
	//更新等级
	@Override
	@Transactional
	public void attach(TUser userSession) {
		userDao.attachDirty(userSession);
	}

	public TUserDAO getUserDao() {
		return userDao;
	}

	public void setUserDao(TUserDAO userDao) {
		this.userDao = userDao;
	}

	public TForbidusernameDAO getForbidDao() {
		return forbidDao;
	}

	public void setForbidDao(TForbidusernameDAO forbidDao) {
		this.forbidDao = forbidDao;
	}








}
