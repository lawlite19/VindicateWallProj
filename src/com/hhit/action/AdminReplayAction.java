package com.hhit.action;

import com.hhit.entity.PageBean;
import com.hhit.service.IReplayService;
import com.opensymphony.xwork2.ActionSupport;

public class AdminReplayAction extends ActionSupport {
	private IReplayService replayService;
	private Long replayId;
	private String isDelete;
	


	private PageBean page;
	private int pageNum=1;
	private int pageSize=12;
	/** 列表 */
	public String list() throws Exception {
		page=replayService.findReplayByPage(pageNum,pageSize);
		return "list";
	}
	/** 删除 */
	public String delete() throws Exception {
		replayService.delete(replayId);
		return "toList";
	}
	/** 还原 */
	public String returnBefore() throws Exception {
		replayService.returnBefore(replayId);
		return "toList";
	}
	public String query(){
		page=replayService.findReplayByCondition(pageNum,pageSize,isDelete);
		return "list";
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

	public IReplayService getReplayService() {
		return replayService;
	}

	public void setReplayService(IReplayService replayService) {
		this.replayService = replayService;
	}

	public Long getReplayId() {
		return replayId;
	}

	public void setReplayId(Long replayId) {
		this.replayId = replayId;
	}
	public String getIsDelete() {
		return isDelete;
	}
	public void setIsDelete(String isDelete) {
		this.isDelete = isDelete;
	}

}
