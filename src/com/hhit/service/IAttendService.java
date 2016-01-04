package com.hhit.service;

import com.hhit.entity.TAttend;
import com.hhit.entity.TUser;

public interface IAttendService {
	//更新签到信息
	void updateAttend(Long userSessionId);
	//找到用户签到的信息
	TAttend findByUserId(Long userSessionId);
	//登录时判断是否已经签到
	boolean isAttend(Long id);
	//初始化签到表
	void insert(TAttend attend);

}
