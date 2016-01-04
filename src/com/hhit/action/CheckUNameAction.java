package com.hhit.action;

import java.util.HashMap;
import java.util.Map;

import org.apache.commons.codec.digest.DigestUtils;

import net.sf.json.JSONObject;

import com.hhit.entity.TAttend;
import com.hhit.entity.TUser;
import com.hhit.service.IAttendService;
import com.hhit.service.ILoginService;
import com.hhit.service.LoginServiceImpl;
import com.opensymphony.xwork2.ActionContext;

public class CheckUNameAction {
	private ILoginService logService;
	private IAttendService attendService;
	private TUser user;
	private String userName;
	private String safeQuestion;
	private String safeAnswer;
	private String randCode;
	private String oldPassword;
	
	private String password;
	

	private String result;

	public String execute() {
		// 用一个Map做例子
		Map<String, String> map = new HashMap<String, String>();
		// System.out.println(userName);
		if(logService.findForbidUName(userName)){
			result="forbid";
		}
		else if (logService.findByUName(userName) == null)
			result = "true";
		else
			result = "false";
		// System.out.println(result);
		// 为map添加一条数据，记录一下页面传过来userName
		map.put("name", result);
		// 将要返回的map对象进行json处理
		JSONObject json = JSONObject.fromObject(map);
		// 调用json对象的toString方法转换为字符串然后赋值给result
		this.result = json.toString();
		return "success";
	}

	public String findPasswordTrue() {
		Map<String, String> map = new HashMap<String, String>();
		TUser userFind=logService.findByUName(userName);
		if ( userFind== null){
			result = "您输入的用户名不存在";
		}	
		else if(!userFind.getSafeQuestion().equals(safeQuestion)){
			result = "您选择的安全问题与注册账号设置的不一致";
		}
		else if(!userFind.getSafeAnswer().equals(safeAnswer)){
			result="安全问题回答错误！";
		}
		else
			result="true";
		map.put("name", result);
		JSONObject json = JSONObject.fromObject(map);
		this.result = json.toString();
		//System.out.println(result);
		return "success";
	}
	//验证用户输入的验证码是否正确
	public String validateCode(){
		Map<String, String> map = new HashMap<String, String>();
		String code=((String)ActionContext.getContext().getSession().get("randomCode")).toLowerCase();
		if (code.equals((randCode.trim().toLowerCase()))){
			result = "true";
		}	
		else
			result="false";
		map.put("name", result);
		JSONObject json = JSONObject.fromObject(map);
		this.result = json.toString();
		//System.out.println(result);
		return "success";
	}
	//验证旧密码输入是否正确
	public String oldPasswordIsTrue(){
		Map<String, String> map = new HashMap<String, String>();
		String oldPwd=((TUser)ActionContext.getContext().getSession().get("user")).getPassword();
		String md5Digest=DigestUtils.md5Hex(oldPassword);
		if (md5Digest.equals(oldPwd)){
			result = "true";
		}	
		else
			result="false";
		map.put("name", result);
		JSONObject json = JSONObject.fromObject(map);
		this.result = json.toString();
		//System.out.println(result);
		return "success";
	}
	//登录验证输入的用户名或密码是否正确
	public String loginIsTrue(){
		Map<String, String> map = new HashMap<String, String>();
		if(logService.findByUName(userName)==null){
			result="UNameFalse";
		}
		else if(!logService.isValidateUser(userName, password)){
			result = "PwdFalse";
		}
		map.put("name", result);
		JSONObject json = JSONObject.fromObject(map);
		this.result = json.toString();
		return "success";
	}
	//签到
	public String signAttend(){
		Long userSessionId=((TUser)ActionContext.getContext().getSession().get("user")).getId();
		attendService.updateAttend(userSessionId);
		//查找签到信息，放到session中
		TAttend attendFind=attendService.findByUserId(userSessionId);
		ActionContext.getContext().getSession().put("attendInfo", attendFind);
		TUser userSession=(TUser)ActionContext.getContext().getSession().get("user");
		int currentLevel=(int) Math.log(attendFind.getAttendCount());
		//满级10级
		if(userSession.getUserLevel()<10){
			if(userSession.getUserLevel()<currentLevel){
				userSession.setUserLevel(currentLevel);
				logService.attach(userSession);
			}
		}

		Map<String, String> map = new HashMap<String, String>();
		result="200";
		map.put("name", result);
		JSONObject json = JSONObject.fromObject(map);
		this.result = json.toString();
		return "success";
	}
	public void setLogService(LoginServiceImpl logService) {
		this.logService = logService;
	}

	public TUser getUser() {
		return user;
	}

	public void setUser(TUser user) {
		this.user = user;
	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getSafeQuestion() {
		return safeQuestion;
	}

	public void setSafeQuestion(String safeQuestion) {
		this.safeQuestion = safeQuestion;
	}

	public String getSafeAnswer() {
		return safeAnswer;
	}

	public void setSafeAnswer(String safeAnswer) {
		this.safeAnswer = safeAnswer;
	}
	public ILoginService getLogService() {
		return logService;
	}

	public void setLogService(ILoginService logService) {
		this.logService = logService;
	}

	public String getRandCode() {
		return randCode;
	}

	public void setRandCode(String randCode) {
		this.randCode = randCode;
	}

	public String getOldPassword() {
		return oldPassword;
	}

	public void setOldPassword(String oldPassword) {
		this.oldPassword = oldPassword;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public IAttendService getAttendService() {
		return attendService;
	}

	public void setAttendService(IAttendService attendService) {
		this.attendService = attendService;
	}
}
