package com.hhit.service;

import com.hhit.entity.PageBean;

public interface IReplayService {
	//回复分页
	PageBean findReplayByPage(int pageNum, int pageSize);
	//删除表白
	void delete(Long replayId);
	//还原回复
	void returnBefore(Long replayId);
	//条件查询
	PageBean findReplayByCondition(int pageNum, int pageSize, String isDelete);

}
