package com.hhit.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.hhit.dao.TMessageDAO;
import com.hhit.entity.TMessage;

public class SysInfoServiceImpl implements ISysInfoService {
	private TMessageDAO messageDao;
	//查找系统消息
	@Override
	public List<TMessage> findAllSysInfo() {
		return messageDao.findAllSysInfo();
	}
	//删除
	@Override
	@Transactional
	public void delete(Long id) {
		messageDao.deleteById(id);
	}
	//添加
	@Override
	@Transactional
	public void saveInfo(TMessage sysInfo) {
		messageDao.save(sysInfo);
	}
	public TMessageDAO getMessageDao() {
		return messageDao;
	}

	public void setMessageDao(TMessageDAO messageDao) {
		this.messageDao = messageDao;
	}




}
