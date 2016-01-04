package com.hhit.service;

import com.hhit.entity.PageBean;
import com.hhit.entity.TReleasecontent;
import com.hhit.entity.TUser;

public interface IVindicateService {
	//表白信息分页
	PageBean findUserByPage(int pageNum, int pageSize);
	//删除表白
	void delete(Long vindicateId);
	//推荐表白
	void recommand(Long vindicateId);
	//还原表白
	void returnBefore(Long vindicateId);
	//条件筛选
	PageBean findVinByCondition(int pageNum, int pageSize, String userName,
			String isRecommand);
	//设置背景图片
	void setBackground(Long vindicateId, String background);
	TReleasecontent findUserByVinId(long releaseInfoId);

}
