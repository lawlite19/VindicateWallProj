package com.hhit.service;


import com.hhit.entity.TUser;

public interface ILoginService {
	public boolean isValidateUser(String username, String password);

	public TUser findByUName(String userName);

	public TUser findUserById(Long id);
	//从禁用用户名表中查找注册的用户名是否存在
	public boolean findForbidUName(String userName);
	//等级更新
	public void attach(TUser userSession);


}
