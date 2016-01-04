package com.hhit.action;

import com.hhit.entity.PageBean;
import com.hhit.service.IProblemService;

public class AdminProblemAction {
	private IProblemService problemService;
	private Long id;
	private String isSolve;
	private String isUsable;
	
	private PageBean page;
	private int pageNum=1;
	private int pageSize=12;
	//列表
	public String list(){
		page=problemService.findProblemByPage(pageNum,pageSize);
		return "list";
	}
	//置为没有解决
	public String isUnsolved(){
		problemService.updateIsSolved(id);
		return "toList";
	}
	//置为解决
	public String isSolved(){
		problemService.updateSolved(id);
		return "toList";
	}
	//置为无用
	public String isUseLess(){
		problemService.updateisUseLess(id);
		return "toList";
	}
	//置为有用
	public String isUseful(){
		problemService.updateisUseful(id);
		return "toList";
	}
	//删除
	public String delete(){
		problemService.delete(id);
		return "toList";
	}
	//条件查询
	public String query(){
		page=problemService.findByCondition(pageNum,pageSize,isSolve,isUsable);
		return "list";
	}

	public IProblemService getProblemService() {
		return problemService;
	}

	public void setProblemService(IProblemService problemService) {
		this.problemService = problemService;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}
	public PageBean getPage() {
		return page;
	}
	public void setPage(PageBean page) {
		this.page = page;
	}
	public int getPageNum() {
		return pageNum;
	}
	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public String getIsSolve() {
		return isSolve;
	}
	public void setIsSolve(String isSolve) {
		this.isSolve = isSolve;
	}
	public String getIsUsable() {
		return isUsable;
	}
	public void setIsUsable(String isUsable) {
		this.isUsable = isUsable;
	}
}
