package com.hhit.service;

import com.hhit.entity.PageBean;
import com.hhit.entity.TProblem;

public interface IProblemService {
	//提交问题
	void save(TProblem problem);
	//列表
	PageBean findProblemByPage(int pageNum, int pageSize);
	//将问题置为未解决
	void updateIsSolved(Long id);
	//将为题置为解决
	void updateSolved(Long id);
	//置为无用
	void updateisUseLess(Long id);
	//置为有用
	void updateisUseful(Long id);
	//删除
	void delete(Long id);
	//条件查询
	PageBean findByCondition(int pageNum, int pageSize, String isSolve,
			String isUsable);

}
