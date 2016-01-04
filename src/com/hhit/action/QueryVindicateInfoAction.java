package com.hhit.action;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import org.apache.struts2.ServletActionContext;

import com.hhit.base.BaseAction;
import com.hhit.entity.PageBean;
import com.hhit.entity.TMessage;
import com.hhit.entity.TReleasecontent;
import com.hhit.entity.TUser;
import com.hhit.service.IMessageService;
import com.hhit.service.IQueryInfoService;
import com.hhit.service.IRegistService;
import com.hhit.service.MessageServiceImpl;
import com.hhit.service.QueryInfoServiceImpl;
import com.hhit.util.QueryHelper;
import com.opensymphony.xwork2.ActionContext;

public class QueryVindicateInfoAction{
	private IQueryInfoService queryInfoService;
	private IMessageService messageService;
	private IRegistService registerService;
	
	private List<TReleasecontent> releaseInfo;
	private List<TReleasecontent> recommendVindicate;
	private TReleasecontent vindicateInfo;
	TMessage message =new TMessage();
	private List<TMessage> myMessageInfo;
	private Long releaseInfoId;

	private PageBean page;
	private int pageNum=1;
	private int pageSize=12;


	// 主页面显示所有表白信息
	public String execute() {
//		new QueryHelper(TReleasecontent.class, "r")//
//		.addOrderProperty("r.id", false)//
//		.preparePageBean(queryInfoService, pageNum, pageSize);
		//PageBean pageBean=queryInfoService.findPageBeanByVin(pageNum,pageSize,)
		page=queryInfoService.findVinByPage(pageNum,pageSize);
		List<TReleasecontent> recommandVins=(List<TReleasecontent>)ActionContext.getContext().getSession().get("recommandVins");
		if(recommandVins==null){
			recommendVindicate=queryInfoService.findRecommendInfo();
			ActionContext.getContext().getSession().put("recommandVins", recommendVindicate);
		}
		return "success";
	}

	// 我的表白信息显示
	public String queryMyVindication() {
//		setReleaseInfo(queryInfoService
//				.findVindicationByUser(((TUser) ActionContext.getContext()
//						.getSession().get("user")).getId()));
		page=queryInfoService.findMyVinByPage(pageNum,10,((TUser) ActionContext.getContext().getSession().get("user")).getId());
		return "queryMyVindication";
	}

	// 发布表白
	public String vindicate() {
		vindicateInfo.setIpAddress(ServletActionContext.getRequest().getRemoteAddr());
		vindicateInfo.setReleaseTime(new Timestamp(new Date().getTime()));
		TUser userSession=(TUser)ActionContext.getContext().getSession().get("user");
		vindicateInfo.setTUser(userSession);
		vindicateInfo.setBackground("0");
		vindicateInfo.setViewCount(0);
		vindicateInfo.setCommentCount(0);
		queryInfoService.saveReleaseInfo(vindicateInfo);
		
		if(!(vindicateInfo.getRealName().equals(""))){
			message.setReceiveRealName(vindicateInfo.getRealName());
			message.setPostTime(new Timestamp(new Date().getTime()));
			message.setMsgContent("有一条可能关于您的表白消息，对方是"+userSession.getSex()+"生，点击查看");
			message.setMsgType("表白消息");
			message.setTReleasecontent(vindicateInfo);
			messageService.saveMessageInfo(message);
		}
		return "toMainUI";
	}
	//查找我的消息
	public String toMyMessageUI(){
		TUser userSession=(TUser)ActionContext.getContext().getSession().get("user");
//		myMessageInfo=messageService.findAllMessage(((TUser)ActionContext.getContext().getSession().get("user")).getRealName());
		page=messageService.findMyMessageByPage(pageNum,pageSize,userSession.getRealName(),userSession.getId());
		return "toMyMessageUI";
	}
	//处理消息
	public String msgHandle(){
		TUser userSession=(TUser)ActionContext.getContext().getSession().get("user");
		int msgCount=(Integer) ActionContext.getContext().getSession().get("totalMsgCount");
		TUser userHandle=(TUser)ActionContext.getContext().getSession().get("user");
		userHandle.setMsgCount(msgCount);
		registerService.saveUserInfo(userHandle);
		//ActionContext.getContext().getSession().put("user", userHandle);
		page=messageService.findMyMessageByPage(pageNum,pageSize,userSession.getRealName(),userSession.getId());
		return "toMyMessageUI";
	}
	public void setQueryInfoService(QueryInfoServiceImpl queryInfoService) {
		this.queryInfoService = queryInfoService;
	}
	//删除我的表白信息
	public String deleteMyVin(){
		TUser userSession=(TUser)ActionContext.getContext().getSession().get("user");
		queryInfoService.deleteReleaseInfo(releaseInfoId,userSession.getId());
		page=queryInfoService.findMyVinByPage(pageNum,pageSize,((TUser) ActionContext.getContext().getSession().get("user")).getId());
		return "queryMyVindication";
	}

	public List<TReleasecontent> getReleaseInfo() {
		return releaseInfo;
	}

	public void setReleaseInfo(List<TReleasecontent> releaseInfo) {
		this.releaseInfo = releaseInfo;
	}

	public List<TReleasecontent> getRecommendVindicate() {
		return recommendVindicate;
	}

	public void setRecommendVindicate(List<TReleasecontent> recommendVindicate) {
		this.recommendVindicate = recommendVindicate;
	}

	public TReleasecontent getVindicateInfo() {
		return vindicateInfo;
	}

	public void setVindicateInfo(TReleasecontent vindicateInfo) {
		this.vindicateInfo = vindicateInfo;
	}


	public void setMessageService(MessageServiceImpl messageService) {
		this.messageService = messageService;
	}
	public IQueryInfoService getQueryInfoService() {
		return queryInfoService;
	}

	public void setQueryInfoService(IQueryInfoService queryInfoService) {
		this.queryInfoService = queryInfoService;
	}

	public IMessageService getMessageService() {
		return messageService;
	}

	public void setMessageService(IMessageService messageService) {
		this.messageService = messageService;
	}

	public List<TMessage> getMyMessageInfo() {
		return myMessageInfo;
	}

	public void setMyMessageInfo(List<TMessage> myMessageInfo) {
		this.myMessageInfo = myMessageInfo;
	}

	public IRegistService getRegisterService() {
		return registerService;
	}

	public void setRegisterService(IRegistService registerService) {
		this.registerService = registerService;
	}

	public Long getReleaseInfoId() {
		return releaseInfoId;
	}

	public void setReleaseInfoId(Long releaseInfoId) {
		this.releaseInfoId = releaseInfoId;
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

}
