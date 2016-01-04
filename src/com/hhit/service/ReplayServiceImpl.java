package com.hhit.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.hhit.dao.TReplayDAO;
import com.hhit.entity.PageBean;


public class ReplayServiceImpl implements IReplayService {
	private TReplayDAO replayDao;
	@Override
	public PageBean findReplayByPage(int pageNum, int pageSize) {
		// 查询本页的数据列表
		List list = replayDao.findReplayPage(pageNum, pageSize);
		// 查询总记录数量
		Long count = replayDao.findCount();
		return new PageBean(pageNum,pageSize,count.intValue(),list);
	}
	//假删除回复
	@Override
	@Transactional
	public void delete(Long replayId) {
		replayDao.deleteVirtual(replayId);
	}
	//还原回复
	@Override
	@Transactional
	public void returnBefore(Long replayId) {
		replayDao.returnBefore(replayId);
	}
	//条件查询
	@Override
	public PageBean findReplayByCondition(int pageNum, int pageSize,
			String isDelete) {
		String hql=" where 1=1";
		if(!("".equals(isDelete))){
			int isDel=Integer.parseInt(isDelete);
			hql+=" and IsDelete="+isDel+"";
		}
		// 查询本页的数据列表
		List list = replayDao.findReplayCondition(pageNum, pageSize,hql);
		// 查询总记录数量
		Long count = replayDao.findCountCondition(hql);
		return new PageBean(pageNum,pageSize,count.intValue(),list);
	}
	public TReplayDAO getReplayDao() {
		return replayDao;
	}

	public void setReplayDao(TReplayDAO replayDao) {
		this.replayDao = replayDao;
	}




}
