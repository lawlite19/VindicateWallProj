package com.hhit.action;





import org.apache.commons.codec.digest.DigestUtils;






import com.hhit.entity.TUser;
import com.hhit.service.ILoginService;
import com.hhit.service.IRegistService;
import com.opensymphony.xwork2.ActionContext;

public class PersonalInfoManageAction {
	private ILoginService loginService;


	private IRegistService registService;
	private TUser personInfo;
	//个人中心--保存用户信息
	public String savaUserInfo() {
		TUser userFind=(TUser)ActionContext.getContext().getSession().get("user");
		
		userFind.setBirthday(personInfo.getBirthday());
		userFind.setEmail(personInfo.getEmail());
		userFind.setQq(personInfo.getQq());
		userFind.setRealName(personInfo.getRealName());
		userFind.setTelphone(personInfo.getTelphone());
		userFind.setSex(personInfo.getSex());
		registService.saveUserInfo(userFind);
		//数据库存储的是Date类型，反向生成会是java.util.date，修改为Timestamp类型即可
		ActionContext.getContext().getSession().put("user",userFind);
		//暂时再从数据库查询一次
		//ActionContext.getContext().getSession().put("user",loginService.findByUName(personInfo.getUserName()));
		return "savaUserInfo";
	}
	//修改密码
	public String modifyPwd(){
		TUser userFind=(TUser)ActionContext.getContext().getSession().get("user");
		String md5Digest=DigestUtils.md5Hex(personInfo.getPassword());
		userFind.setPassword(md5Digest);
		registService.updatePassword(userFind);
		ActionContext.getContext().getSession().remove("user");
		return "updatePassword";
	}


	public IRegistService getRegistService() {
		return registService;
	}

	public void setRegistService(IRegistService registService) {
		this.registService = registService;
	}
	public ILoginService getLoginService() {
		return loginService;
	}

	public void setLoginService(ILoginService loginService) {
		this.loginService = loginService;
	}
	public TUser getPersonInfo() {
		return personInfo;
	}
	public void setPersonInfo(TUser personInfo) {
		this.personInfo = personInfo;
	}
}
