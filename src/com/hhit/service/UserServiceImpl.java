package com.hhit.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.hhit.dao.TUserDAO;
import com.hhit.dao.TbManageuserDAO;
import com.hhit.entity.PageBean;
import com.hhit.entity.TbManageuser;

public class UserServiceImpl implements IUserService {
	private TbManageuserDAO manageUserDao;
	private TUserDAO userDao;
	@Override
	public TbManageuser findByLoginNameAndPassword(String userName,
			String password) {
		return manageUserDao.findByUNameAndPwd(userName,password);
	}
	@Override
	public PageBean findUserByPage(int pageNum, int pageSize) {
		// 查询本页的数据列表
		List list = userDao.findUserPageList(pageNum,pageSize);
		// 查询总记录数量
		Long count = userDao.findCount();
		return new PageBean(pageNum,pageSize,count.intValue(),list);
	}
	//禁用前台用户
	@Override
	@Transactional
	public void delete(Long userId) {
		userDao.useLess(userId);
	}
	public TbManageuserDAO getManageUserDao() {
		return manageUserDao;
	}
	//还原用户
	@Override
	@Transactional
	public void usalbe(Long userId) {
		userDao.usable(userId);
	}
	//根据条件筛选用户
	@Override
	public PageBean findByCondition(int pageNum, int pageSize, String userName,
			String realName, String isUsable) {
		String hql=" where 1=1";
		if(!("".equals(userName)))
			hql=hql+" and UserName='"+userName+"'";
		if(!("".equals(realName)))
			hql=hql+" and RealName='"+realName+"'";
		if(!("".equals(isUsable))){
			int isUse=Integer.parseInt(isUsable);
			hql=hql+" and isUsable="+isUse+"";
		}
			
		// 查询本页的数据列表
		List list = userDao.findUserByCondition(pageNum,pageSize,hql);
		// 查询总记录数量
		Long count = userDao.findCountByCondition(hql);
		return new PageBean(pageNum,pageSize,count.intValue(),list);
	}
	public void setManageUserDao(TbManageuserDAO manageUserDao) {
		this.manageUserDao = manageUserDao;
	}
	public TUserDAO getUserDao() {
		return userDao;
	}
	public void setUserDao(TUserDAO userDao) {
		this.userDao = userDao;
	}






}
