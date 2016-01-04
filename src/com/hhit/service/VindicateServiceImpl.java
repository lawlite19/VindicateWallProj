package com.hhit.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.hhit.dao.TReleasecontentDAO;
import com.hhit.dao.TUserDAO;
import com.hhit.entity.PageBean;
import com.hhit.entity.TReleasecontent;
import com.hhit.entity.TUser;

public class VindicateServiceImpl implements IVindicateService {
	private TReleasecontentDAO vindicateDao;
	private TUserDAO userDao;

	@Override
	public PageBean findUserByPage(int pageNum, int pageSize) {
		// 查询本页的数据列表
		List list = vindicateDao.findVinPageList(pageNum, pageSize);
		// 查询总记录数量
		Long count = vindicateDao.findCount();
		return new PageBean(pageNum,pageSize,count.intValue(),list);
	}
	//删除表白
	@Override
	@Transactional
	public void delete(Long vindicateId) {
		vindicateDao.deleteById(vindicateId);
	}
	//推荐表白
	@Override
	@Transactional
	public void recommand(Long vindicateId) {
		vindicateDao.recommand(vindicateId);
	}
	//还原表白
	@Override
	@Transactional
	public void returnBefore(Long vindicateId) {
		vindicateDao.returnBefore(vindicateId);
	}
	//条件筛选
	@Override
	public PageBean findVinByCondition(int pageNum, int pageSize,
			String userName, String isRecommand) {
		String hql=" where 1=1";
		if(!("".equals(userName))){
			TUser userFind=userDao.findByUName(userName);
			hql=hql+" and UserId="+userFind.getId()+"";
		}
		if(!("".equals(isRecommand))){
			int isRec=Integer.parseInt(isRecommand);
			hql=hql+" and IsRecommand='"+isRecommand+"'";
		}
		// 查询本页的数据列表
		List list = vindicateDao.findVinByCondition(pageNum, pageSize,hql);
		// 查询总记录数量
		Long count = vindicateDao.findCountByCondition(hql);
		return new PageBean(pageNum,pageSize,count.intValue(),list);
	}
	//设置背景图片
	@Override
	@Transactional
	public void setBackground(Long vindicateId, String background) {
		vindicateDao.setBackground(vindicateId,background);
	}
	//根据表白内容Id查询发布的用户
	@Override
	public TReleasecontent findUserByVinId(long releaseInfoId) {
		return vindicateDao.findUserById(releaseInfoId);
	}

	public TReleasecontentDAO getVindicateDao() {
		return vindicateDao;
	}
	public void setVindicateDao(TReleasecontentDAO vindicateDao) {
		this.vindicateDao = vindicateDao;
	}
	public TUserDAO getUserDao() {
		return userDao;
	}
	public void setUserDao(TUserDAO userDao) {
		this.userDao = userDao;
	}




}
