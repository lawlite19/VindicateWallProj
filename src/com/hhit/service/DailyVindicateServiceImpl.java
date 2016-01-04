package com.hhit.service;

import java.util.Date;

import com.hhit.dao.TDailyvindicateDAO;
import com.hhit.entity.TDailyvindicate;

public class DailyVindicateServiceImpl implements IDailyVindicateService {
	private TDailyvindicateDAO dailyVinDao;

	public TDailyvindicateDAO getDailyVinDao() {
		return dailyVinDao;
	}
	//查找当天
	@Override
	public TDailyvindicate findToday() {
		return dailyVinDao.findToday();
	}
	//按日期查找
	@Override
	public TDailyvindicate findByDate(String releaseDate) {
		if(releaseDate!=null){
			return dailyVinDao.findByDate(releaseDate);
		}
		return null;
	}

	public void setDailyVinDao(TDailyvindicateDAO dailyVinDao) {
		this.dailyVinDao = dailyVinDao;
	}


}
