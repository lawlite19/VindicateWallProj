package com.hhit.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.hhit.base.DaoSupportImpl;
import com.hhit.dao.TReleasecontentDAO;
import com.hhit.dao.TReplayDAO;
import com.hhit.entity.PageBean;
import com.hhit.entity.TReleasecontent;
import com.hhit.entity.TReplay;
import com.hhit.util.QueryHelper;

public class QueryInfoServiceImpl implements IQueryInfoService {
	private TReleasecontentDAO releaseInfoDao;
	private TReplayDAO replayDao;

	@SuppressWarnings("unchecked")
	@Override
	public List<TReleasecontent> findReleaseInfo() {
		return releaseInfoDao.findAllOrder();
	}

	@Override
	public List<TReleasecontent> findVindicationByUser(Long id) {
		return releaseInfoDao.findVindicationByUId(id);
	}

	@Override
	public TReleasecontent findVindication(long releaseInfoId) {
		return releaseInfoDao.findById(releaseInfoId);
	}

	// 查找某话题所有的回复者
	@Override
	public List<TReplay> findReplayInfo(Long id) {
		return replayDao.findByTopicId(id);
	}

	// 插入回复
	@Override
	@Transactional
	public void saveReplay(TReplay replayQuick) {
		replayDao.save(replayQuick);
	}

	// 查询推荐的表白
	@Override
	public List<TReleasecontent> findRecommendInfo() {
		return releaseInfoDao.findRecommendVindicate();
	}

	// 插入一条表白记录
	@Override
	@Transactional
	public void saveReleaseInfo(TReleasecontent vindicateInfo) {
		releaseInfoDao.save(vindicateInfo);
	}

	// 根据回复的Id查找该条回复
	@Override
	public TReplay findReplay(long replayId) {
		return replayDao.findById(replayId);
	}

	// 更新回复，实际是将IsDelete字段置为1
	@Override
	@Transactional
	public void updateReplay(TReplay replayFind) {
		replayDao.attachDirty(replayFind);
	}
	@Override
	@Transactional
	public void deleteReleaseInfo(long releaseInfoId) {
		releaseInfoDao.deleteById(releaseInfoId);
	}
	@Override
	@Transactional
	public void deleteReleaseInfo(Long releaseInfoId, Long id) {
		releaseInfoDao.deleteMyVindicate(releaseInfoId,id);
	}
	//分页查找表白信息
	@Override
	public PageBean findVinByPage(int pageNum, int pageSize) {
		// 查询本页的数据列表
		List list = releaseInfoDao.findVinPageList(pageNum,pageSize);
		// 查询总记录数量
		Long count = releaseInfoDao.findCount();
		return new PageBean(pageNum,pageSize,count.intValue(),list);
	}
	//分页查找回复消息
	@Override
	public PageBean findReplayInfo(int pageNum, int pageSize,
			long releaseInfoId) {
		// 查询本页的数据列表
		List list = replayDao.findReplayPageList(pageNum,pageSize,releaseInfoId);
		// 查询总记录数量
		Long count = replayDao.findReplayCount(releaseInfoId);
		return new PageBean(pageNum,pageSize,count.intValue(),list);
	}
	//我的表白分页
	@Override
	public PageBean findMyVinByPage(int pageNum, int pageSize, Long id) {
		// 查询本页的数据列表
		List list = releaseInfoDao.findMyVinPageList(pageNum,pageSize,id);
		// 查询总记录数量
		Long count = releaseInfoDao.findMyVinCount(id);
		return new PageBean(pageNum,pageSize,count.intValue(),list);
	}
	//更新表白查看次数
	@Override
	@Transactional
	public void updateVinViewCount(long releaseInfoId) {
		releaseInfoDao.updateViewCount(releaseInfoId);
	}
	@Override
	@Transactional
	public void updateVinCommentCount(long releaseInfoId) {
		releaseInfoDao.updateCommentCount(releaseInfoId);
	}
	public TReleasecontentDAO getReleaseInfoDao() {
		return releaseInfoDao;
	}

	public void setReleaseInfoDao(TReleasecontentDAO releaseInfoDao) {
		this.releaseInfoDao = releaseInfoDao;
	}

	public TReplayDAO getReplayDao() {
		return replayDao;
	}

	public void setReplayDao(TReplayDAO replayDao) {
		this.replayDao = replayDao;
	}



}
