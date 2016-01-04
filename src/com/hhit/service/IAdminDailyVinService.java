package com.hhit.service;

import com.hhit.entity.PageBean;
import com.hhit.entity.TDailyvindicate;

public interface IAdminDailyVinService {
	//列表-分页查找
	PageBean findByPage(int pageNum, int pageSize);
	//新增
	void saveDailyVin(TDailyvindicate dailyVin);
	//删除
	void deleteById(Long dailyVinId);
	//根绝Id查找
	TDailyvindicate findById(Long dailyVinId);
	//更新
	void update(TDailyvindicate dailyVin);
	//条件查找
	PageBean findByCondition(int pageNum, int pageSize, String vindicator,
			String relaseDate);

}
