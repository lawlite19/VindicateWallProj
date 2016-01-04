package com.hhit.service;

import java.util.List;

import com.hhit.entity.PageBean;
import com.hhit.entity.TMessage;

public interface IMessageService {

	void saveMessageInfo(TMessage message);

	List<TMessage> findAllMessage(String realName);

	int findCountMessage(String realName,Long userId);
	//分页查找我的信息
	PageBean findMyMessageByPage(int pageNum, int pageSize, String realName, Long userId);

	int findCountReplay(Long id);

}
