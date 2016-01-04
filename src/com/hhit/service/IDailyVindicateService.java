package com.hhit.service;

import java.util.Date;

import com.hhit.entity.TDailyvindicate;

public interface IDailyVindicateService {

	//初次进入，查找当天的表白
	TDailyvindicate findToday();

	//按日期查找
	TDailyvindicate findByDate(String releaseDate);

}
