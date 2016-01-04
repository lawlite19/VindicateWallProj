package com.hhit.service;

import com.hhit.entity.TUser;

public interface IRegistService {

	void registerUser(TUser user);

	void updatePassword(TUser userFind);

	void saveUserInfo(TUser user);

}
