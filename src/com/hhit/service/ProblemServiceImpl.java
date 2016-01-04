package com.hhit.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.hhit.dao.TProblemDAO;
import com.hhit.entity.PageBean;
import com.hhit.entity.TProblem;

public class ProblemServiceImpl implements IProblemService {
	private TProblemDAO problemDao;
	//提交问题
	@Override
	@Transactional
	public void save(TProblem problem) {
		problemDao.save(problem);
	}
	//列表
	@Override
	public PageBean findProblemByPage(int pageNum, int pageSize) {
		// 查询本页的数据列表
		List list = problemDao.findProblemPage(pageNum, pageSize);
		// 查询总记录数量
		Long count = problemDao.findCount();
		return new PageBean(pageNum,pageSize,count.intValue(),list);
	}
	//将问题置为未解决
	@Override
	@Transactional
	public void updateIsSolved(Long id) {
		problemDao.updateIsUnSolved(id);
	}
	//将问题置为已解决
	@Override
	@Transactional
	public void updateSolved(Long id) {
		problemDao.updateIsSolved(id);
	}
	//置为无用
	@Override
	@Transactional
	public void updateisUseLess(Long id) {
		problemDao.updateisUseLess(id);
	}
	//置为有用
	@Override
	@Transactional
	public void updateisUseful(Long id) {
		problemDao.updateisUseful(id);
	}
	//删除
	@Override
	@Transactional
	public void delete(Long id) {
		problemDao.deleteById(id);
	}
	//条件查询
	@Override
	public PageBean findByCondition(int pageNum, int pageSize, String isSolve,
			String isUsable) {
		String hql=" where 1=1";
		if(!("".equals(isSolve)))
			hql+=" and IsSolve='"+isSolve+"'";
		if(!("".equals(isUsable)))
			hql+=" and IsUsable='"+isUsable+"'";
		// 查询本页的数据列表
		List list = problemDao.findVinByCondition(pageNum, pageSize,hql);
		// 查询总记录数量
		Long count = problemDao.findCountByCondition(hql);
		return new PageBean(pageNum,pageSize,count.intValue(),list);
	}
	public TProblemDAO getProblemDao() {
		return problemDao;
	}
	public void setProblemDao(TProblemDAO problemDao) {
		this.problemDao = problemDao;
	}


}
