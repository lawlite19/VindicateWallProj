package com.hhit.action;

import com.hhit.entity.PageBean;
import com.hhit.service.IUserService;
import com.hhit.service.IVindicateService;
import com.opensymphony.xwork2.ActionSupport;

public class VindicateAction extends ActionSupport {
	private IVindicateService vindicateService; 
	private Long vindicateId;
	//条件查询传过来的条件
	private String userName;
	private String isRecommand;
	private String background;
	
	private PageBean page;
	private int pageNum=1;
	private int pageSize=12;
	/** 列表 */
	public String list() throws Exception {
		page=vindicateService.findUserByPage(pageNum,pageSize);
		return "list";
	}
	/** 删除 */
	public String delete() throws Exception {
		vindicateService.delete(vindicateId);
		return "toList";
	}
	/** 推荐 */
	public String recommand() throws Exception {
		vindicateService.recommand(vindicateId);
		return "toList";
	}
	/** 还原 */
	public String returnBefore() throws Exception {
		vindicateService.returnBefore(vindicateId);
		return "toList";
	}
	/**条件查找*/
	public String query() throws Exception {
		page=vindicateService.findVinByCondition(pageNum,pageSize,userName,isRecommand);
		return "list";
	}
	/**跳转到设置背景图界面*/
	public String setBackgroundUI() throws Exception {
		return "toBackgroundUI";
	}
	/**设置背景图界面*/
	public String setBackground() throws Exception {
		vindicateService.setBackground(vindicateId,background);
		return "toBackgroundUI";
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
	public Long getVindicateId() {
		return vindicateId;
	}
	public void setVindicateId(Long vindicateId) {
		this.vindicateId = vindicateId;
	}
	public IVindicateService getVindicateService() {
		return vindicateService;
	}
	public void setVindicateService(IVindicateService vindicateService) {
		this.vindicateService = vindicateService;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getIsRecommand() {
		return isRecommand;
	}
	public void setIsRecommand(String isRecommand) {
		this.isRecommand = isRecommand;
	}
	public String getBackground() {
		return background;
	}
	public void setBackground(String background) {
		this.background = background;
	}
}
