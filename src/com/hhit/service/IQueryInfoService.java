package com.hhit.service;

import java.util.List;

import com.hhit.base.IDaoSupport;
import com.hhit.entity.PageBean;
import com.hhit.entity.TReleasecontent;
import com.hhit.entity.TReplay;

public interface IQueryInfoService {

	void saveReplay(TReplay replayQuick);

	List<TReleasecontent> findVindicationByUser(Long id);

	TReleasecontent findVindication(long releaseInfoId);

	List<TReplay> findReplayInfo(Long id);

	public void saveReleaseInfo(TReleasecontent vindicateInfo);

	List<TReleasecontent> findReleaseInfo();

	List<TReleasecontent> findRecommendInfo();

	TReplay findReplay(long replayId);

	void updateReplay(TReplay replayFind);

	//删除表白内容
	void deleteReleaseInfo(long releaseInfoId);
	//删除我的表白信息
	void deleteReleaseInfo(Long releaseInfoId, Long id);
	//主界面分页
	PageBean findVinByPage(int pageNum, int pageSize);
	//回复分页
	PageBean findReplayInfo(int pageNum, int pageSize, long releaseInfoId);
	//我的表白分页
	PageBean findMyVinByPage(int pageNum, int pageSize, Long id);

	void updateVinViewCount(long releaseInfoId);

	void updateVinCommentCount(long releaseInfoId);


}
