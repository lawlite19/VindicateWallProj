package com.hhit.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.hhit.dao.TDailyvindicateDAO;
import com.hhit.entity.PageBean;
import com.hhit.entity.TDailyvindicate;

public class AdminDailyVinServiceImpl implements IAdminDailyVinService {
	private TDailyvindicateDAO adminDailyVinDao;
	//列表
	@Override
	public PageBean findByPage(int pageNum, int pageSize) {
		// 查询本页的数据列表
		List list = adminDailyVinDao.findDailyVinPage(pageNum, pageSize);
		// 查询总记录数量
		Long count = adminDailyVinDao.findDailyVinCount();
		return new PageBean(pageNum,pageSize,count.intValue(),list);
	}
	//新增
	@Override
	@Transactional
	public void saveDailyVin(TDailyvindicate dailyVin) {
		adminDailyVinDao.save(dailyVin);
	}	
	//删除
	@Override
	public void deleteById(Long dailyVinId) {
		adminDailyVinDao.deleteById(dailyVinId);
	}
	//根据Id查找
	@Override
	public TDailyvindicate findById(Long dailyVinId) {
		return adminDailyVinDao.findById(dailyVinId);
	}
	//更新
	@Override
	@Transactional
	public void update(TDailyvindicate dailyVin) {
		adminDailyVinDao.attachDirty(dailyVin);
	}
	//条件查找
	@Override
	public PageBean findByCondition(int pageNum, int pageSize,
			String vindicator, String relaseDate) {
		String hql=" where 1=1";
		if(!("".equals(vindicator)))
			hql=hql+" and Vindicator='"+vindicator+"'";
		if(!("".equals(relaseDate)))
			hql=hql+" and ReleaseDate='"+relaseDate+"'";
			
		// 查询本页的数据列表
		List list = adminDailyVinDao.findUserByCondition(pageNum,pageSize,hql);
		// 查询总记录数量
		Long count = adminDailyVinDao.findCountByCondition(hql);
		return new PageBean(pageNum,pageSize,count.intValue(),list);
	}

	public TDailyvindicateDAO getAdminDailyVinDao() {
		return adminDailyVinDao;
	}

	public void setAdminDailyVinDao(TDailyvindicateDAO adminDailyVinDao) {
		this.adminDailyVinDao = adminDailyVinDao;
	}





}
