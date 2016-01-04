package com.hhit.service;

import java.util.List;

import com.hhit.entity.TbManageuser;

public interface IManageUserService {
	//修改密码
	void updatePwd(TbManageuser userSession);
	//查找所有后台用户
	List<TbManageuser> findAll();
	//根据Id删除
	void deleteById(int id);
	//新建后台用户
	void saveUser(TbManageuser manageUser);
	//初始化密码
	void initPwd(int id);

}
