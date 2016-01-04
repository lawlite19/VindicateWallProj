package com.hhit.action;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import org.apache.struts2.ServletActionContext;

import com.hhit.entity.PageBean;
import com.hhit.entity.TMessage;
import com.hhit.entity.TReleasecontent;
import com.hhit.entity.TReplay;
import com.hhit.entity.TUser;
import com.hhit.service.IMessageService;
import com.hhit.service.IQueryInfoService;
import com.hhit.service.IVindicateService;
import com.hhit.service.QueryInfoServiceImpl;
import com.opensymphony.xwork2.ActionContext;

public class ReplayAction {
	private TReleasecontent releaseInfo;
	private List<TReplay> replayInfo;
	private TReplay replayQuick;

	private IQueryInfoService queryInfoService;

	private IMessageService messageService;
	TMessage message =new TMessage();


	private IVindicateService vindicateService; 
	
	private long releaseInfoId;// url传过来的表白内容的id
	private long replayId;//url传过来的回复Id
	
	private PageBean page;
	private int pageNum=1;
	private int pageSize=12;
	// 转到回复列表界面
	public String toReplayUI() {
		releaseInfo = queryInfoService.findVindication(releaseInfoId);
		
		page = queryInfoService.findReplayInfo(pageNum,pageSize,releaseInfoId);
		//更新表白查看的次数
		TUser userSession=(TUser)ActionContext.getContext().getSession().get("user");
		if(userSession!=null){
			if(!releaseInfo.getTUser().getId().equals(userSession.getId())){
				queryInfoService.updateVinViewCount(releaseInfoId);
			}
		}
		else
			queryInfoService.updateVinViewCount(releaseInfoId);
		return "toReplayUI";
	}
	//翻页（这样不会增加访问量）
	public String toReplayUIPage(){
		releaseInfo = queryInfoService.findVindication(releaseInfoId);
		page = queryInfoService.findReplayInfo(pageNum,pageSize,releaseInfoId);
		return "toReplayUI";
	}
	//快速回复
	public String replayUser(){
		replayQuick.setIpAddress(ServletActionContext.getRequest().getRemoteAddr());
		replayQuick.setPostTime(new Timestamp(new Date().getTime()));
		replayQuick.setTReleasecontent(queryInfoService.findVindication(releaseInfoId));
		replayQuick.setTUser((TUser)ActionContext.getContext().getSession().get("user"));
		queryInfoService.saveReplay(replayQuick);
		//设置提示消息表内容
		TUser userSession=(TUser)ActionContext.getContext().getSession().get("user");
		TReleasecontent vindicateFind=vindicateService.findUserByVinId(releaseInfoId);
		releaseInfo = queryInfoService.findVindication(releaseInfoId);
		//自己回复自己不插入信息表
//		long id1=userSession.getId();
//		long id2=vindicateFind.getTUser().getId();
		if(!(userSession.getId().equals(vindicateFind.getTUser().getId()))){
			//message.setReceiveRealName(userSession.getId().toString());//回复消息真实姓名设置回复者的Id
			message.setPostTime(new Timestamp(new Date().getTime()));
			message.setMsgContent("有一条关于您的回复消息，回复者是：["+userSession.getUserName()+"],点击查看");
			message.setMsgType("回复消息");
			message.setTReleasecontent(releaseInfo);
			message.setTReplay(replayQuick);
			message.setTUser(vindicateFind.getTUser());
			messageService.saveMessageInfo(message);
		}
		//再次查询数据
		
		page = queryInfoService.findReplayInfo(pageNum,pageSize,releaseInfoId);
		//更新表白评论次数
		//TUser userSession=(TUser)ActionContext.getContext().getSession().get("user");
		if(!releaseInfo.getTUser().getId().equals(userSession.getId())){
			queryInfoService.updateVinCommentCount(releaseInfoId);
		}
		return "toReplayUI";
	}
	//管理员可以看到删除按钮并进行删除【回复】操作
	public String deleteReplay(){
		TReplay replayFind=queryInfoService.findReplay(replayId);
		//将replay表中的IsDelete字段置为1
		replayFind.setIsDelete(1);
		queryInfoService.updateReplay(replayFind);
		//再次查询数据
		releaseInfo = queryInfoService.findVindication(releaseInfoId);
		replayInfo = queryInfoService.findReplayInfo(releaseInfoId);
		return "toReplayUI";
	}
	//管理员可以删除【楼主】操作
	public String deleteReleaseInfo(){
		queryInfoService.deleteReleaseInfo(releaseInfoId);
		return "deleteReleaseSuccess";
	}

	public TReleasecontent getReleaseInfo() {
		return releaseInfo;
	}

	public void setReleaseInfo(TReleasecontent releaseInfo) {
		this.releaseInfo = releaseInfo;
	}

	public void setQueryInfoService(QueryInfoServiceImpl queryInfoService) {
		this.queryInfoService = queryInfoService;
	}

	public long getReleaseInfoId() {
		return releaseInfoId;
	}

	public void setReleaseInfoId(long releaseInfoId) {
		this.releaseInfoId = releaseInfoId;
	}

	public List<TReplay> getReplayInfo() {
		return replayInfo;
	}

	public void setReplayInfo(List<TReplay> replayInfo) {
		this.replayInfo = replayInfo;
	}

	public TReplay getReplayQuick() {
		return replayQuick;
	}

	public void setReplayQuick(TReplay replayQuick) {
		this.replayQuick = replayQuick;
	}
	public IQueryInfoService getQueryInfoService() {
		return queryInfoService;
	}
	public void setQueryInfoService(IQueryInfoService queryInfoService) {
		this.queryInfoService = queryInfoService;
	}
	public long getReplayId() {
		return replayId;
	}
	public void setReplayId(long replayId) {
		this.replayId = replayId;
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
	public IMessageService getMessageService() {
		return messageService;
	}
	public void setMessageService(IMessageService messageService) {
		this.messageService = messageService;
	}
	public IVindicateService getVindicateService() {
		return vindicateService;
	}
	public void setVindicateService(IVindicateService vindicateService) {
		this.vindicateService = vindicateService;
	}
}
