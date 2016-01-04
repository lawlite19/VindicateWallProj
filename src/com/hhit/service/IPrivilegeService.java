package com.hhit.service;

import java.util.Collection;
import java.util.List;

import com.hhit.entity.TbPrivilege;

public interface IPrivilegeService {
	//查找顶级权限
	List<TbPrivilege> findTopList();

	Collection<String> getAllPrivilegeUrls();
	//查找所有
	List<TbPrivilege> findAll();
	//根据Id数组查找
	List<TbPrivilege> getByIds(Integer[] privilegeIds);


}
