package com.hhit.service;

import java.util.List;

import com.hhit.entity.TMessage;

public interface ISysInfoService {
	//查找所有的系统消息
	List<TMessage> findAllSysInfo();
	//删除
	void delete(Long id);
	//添加
	void saveInfo(TMessage sysInfo);

}
