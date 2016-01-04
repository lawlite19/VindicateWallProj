package com.hhit.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.hhit.dao.TMessageDAO;
import com.hhit.entity.PageBean;
import com.hhit.entity.TMessage;

public class MessageServiceImpl implements IMessageService {
	private TMessageDAO messageDao;

	//保存消息
	@Override
	@Transactional
	public void saveMessageInfo(TMessage message) {
		messageDao.save(message);
	}
	//查询我的消息
	@Override
	public List<TMessage> findAllMessage(String realName) {
		return messageDao.findUserMessage(realName);
	}
	//查找我的消息条数
	@Override
	public int findCountMessage(String realName,Long userId) {
		return messageDao.findMsgCount(realName,userId).intValue();
	}
	//分页查找我的消息
	@Override
	public PageBean findMyMessageByPage(int pageNum, int pageSize,
			String realName,Long userId) {
		// 查询本页的数据列表
		List list = messageDao.findMyMessagePageList(pageNum,pageSize,realName,userId);
		// 查询总记录数量
		Long count = messageDao.findMsgCount(realName,userId);
		return new PageBean(pageNum,pageSize,count.intValue(),list);
	}
	//根据用户Id查找回复消息数
	@Override
	public int findCountReplay(Long id) {
		return messageDao.findMessageByUserId(id).intValue();
	}

	public TMessageDAO getMessageDao() {
		return messageDao;
	}

	public void setMessageDao(TMessageDAO messageDao) {
		this.messageDao = messageDao;
	}





}
