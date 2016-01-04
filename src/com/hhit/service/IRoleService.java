package com.hhit.service;

import java.util.List;

import com.hhit.entity.TbRole;

public interface IRoleService {

	//查找所有的角色
	List<TbRole> findAll();
	//新增
	void save(TbRole role);
	//根据Id查找
	TbRole getById(Integer id);
	//修改
	void update(TbRole role);
	//删除
	void delete(Integer id);

}
