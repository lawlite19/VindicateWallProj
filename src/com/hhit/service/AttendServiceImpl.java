package com.hhit.service;

import org.springframework.transaction.annotation.Transactional;

import com.hhit.dao.TAttendDAO;
import com.hhit.entity.TAttend;
import com.hhit.entity.TUser;

public class AttendServiceImpl implements IAttendService {
	private TAttendDAO attendDao;
	//更新签到信息
	@Override
	@Transactional
	public void updateAttend(Long userSessionId) {
		attendDao.updateAttend(userSessionId);
	}
	//找到用户的签到信息
	@Override
	public TAttend findByUserId(Long userSessionId) {
		return attendDao.findByUserId(userSessionId);
	}
	//判断是否已经签到
	@Override
	public boolean isAttend(Long id) {
		return attendDao.isAttend(id);
	}
	//初始化签到表
	@Override
	@Transactional
	public void insert(TAttend attend) {
		attendDao.save(attend);
	}
	public TAttendDAO getAttendDao() {
		return attendDao;
	}

	public void setAttendDao(TAttendDAO attendDao) {
		this.attendDao = attendDao;
	}





}
