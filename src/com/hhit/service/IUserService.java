package com.hhit.service;

import com.hhit.entity.PageBean;
import com.hhit.entity.TbManageuser;

public interface IUserService {
	//判断登录用户是否存在
	TbManageuser findByLoginNameAndPassword(String userName, String password);
	//前台用户分页
	PageBean findUserByPage(int pageNum, int pageSize);
	//禁用前台用户
	void delete(Long userId);
	//还原用户
	void usalbe(Long userId);
	//根据条件筛选用户
	PageBean findByCondition(int pageNum, int pageSize, String userName,
			String realName, String isUsable);

}
