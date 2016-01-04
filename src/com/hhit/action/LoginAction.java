package com.hhit.action;

import java.io.ByteArrayInputStream;
import java.util.Date;

import org.apache.commons.codec.digest.DigestUtils;

import com.hhit.entity.TAttend;
import com.hhit.entity.TUser;
import com.hhit.service.IAttendService;
import com.hhit.service.ILoginService;
import com.hhit.service.IMessageService;
import com.hhit.service.IRegistService;
import com.opensymphony.xwork2.ActionContext;

public class LoginAction {
	private ILoginService loginService;
	private IRegistService registService;
	private IMessageService messageService;
	private IAttendService attendService;
	private int msgTotalCount;
	private TUser user;
	private ByteArrayInputStream inputStream;

	// 登录--判断用户是否合法
	public String login() throws Exception {
		if (loginService.isValidateUser(user.getUserName(), user.getPassword())){
			TUser userSession=(TUser)ActionContext.getContext().getSession().get("user");
			//如果已经签到了
			if(attendService.isAttend(userSession.getId())){
				TAttend attendInfo=attendService.findByUserId(userSession.getId());
				ActionContext.getContext().getSession().put("attendInfo", attendInfo);
			}
			msgTotalCount=messageService.findCountMessage(userSession.getRealName(),userSession.getId());
			ActionContext.getContext().getSession().put("totalMsgCount", msgTotalCount);
			return "success";
		}
		return "input";
	}
	/** 注销 */
	public String logout() throws Exception {
		ActionContext.getContext().getSession().remove("user");
		ActionContext.getContext().getSession().remove("attendInfo");
		return "logout";
	}
	// 注册用户
	public String register() throws Exception {
		user.setIsUsable(1);
		user.setMsgCount(0);
		user.setUserLevel(0);
		registService.registerUser(user);
		ActionContext.getContext().getSession().put("user", user);
		//如果已经签到了
		if(attendService.isAttend(user.getId())){
			TAttend attendInfo=attendService.findByUserId(user.getId());
			ActionContext.getContext().getSession().put("attendInfo", attendInfo);
		}
		msgTotalCount=messageService.findCountMessage(user.getRealName(),user.getId());
		ActionContext.getContext().getSession().put("totalMsgCount", msgTotalCount);
		//注册时初始化签到表
		TAttend attend=new TAttend();
		attend.setAttendCount(0);
		attend.setScore(0);
		attend.setTUser(user);
		attendService.insert(attend);
		return "registerSuccess";
	}
	//找回密码第一步判断用户名是否存在和安全问题是否正确
	public String findPassword() throws Exception {
		TUser userFind=loginService.findByUName(user.getUserName());
		if(userFind!=null)
		{
			if(userFind.getSafeQuestion().equals(user.getSafeQuestion())&&userFind.getSafeAnswer().equals(user.getSafeAnswer()))
			{
				setUser(userFind);
				return "findPasswordTwo";
			}
		}
		return "findPasswordTwoError";
	}
	//修改密码
	public String updatePassword() throws Exception{
		TUser userFind=loginService.findUserById(user.getId());
		String md5Digest=DigestUtils.md5Hex(user.getPassword());
		userFind.setPassword(md5Digest);
		registService.updatePassword(userFind);
		return "updatePassword";
	}
	//进入个人中心
	public String enterPersonalInfo() throws Exception{
		//setUser((TUser)ActionContext.getContext().getSession().get("user"));
		return "enterPersonalInfo";
	}
	public String toVindicateUI(){
		return "toVindicateUI";
	}
	public ILoginService getLoginService() {
		return loginService;
	}

	public void setLoginService(ILoginService loginService) {
		this.loginService = loginService;
	}

	public TUser getUser() {
		return user;
	}

	public void setUser(TUser user) {
		this.user = user;
	}

	public ByteArrayInputStream getInputStream() {
		return inputStream;
	}

	public void setInputStream(ByteArrayInputStream inputStream) {
		this.inputStream = inputStream;
	}

	public IRegistService getRegistService() {
		return registService;
	}

	public void setRegistService(IRegistService registService) {
		this.registService = registService;
	}
	public IMessageService getMessageService() {
		return messageService;
	}
	public void setMessageService(IMessageService messageService) {
		this.messageService = messageService;
	}

	public int getMsgTotalCount() {
		return msgTotalCount;
	}
	public void setMsgTotalCount(int msgTotalCount) {
		this.msgTotalCount = msgTotalCount;
	}
	public IAttendService getAttendService() {
		return attendService;
	}
	public void setAttendService(IAttendService attendService) {
		this.attendService = attendService;
	}
}
