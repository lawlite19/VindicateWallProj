package com.hhit.action;

import java.util.List;

import org.apache.commons.codec.digest.DigestUtils;

import com.hhit.entity.TbManageuser;
import com.hhit.service.IManageUserService;
import com.opensymphony.xwork2.ActionContext;

public class ManageUserAction {
	private IManageUserService manageUserService;
	private String password;
	private List<TbManageuser> userList;
	private int id;
	private TbManageuser manageUser;

	public String toModifyPwdUI(){
		return "toModifyPwdUI";
	}
	//修改密码
	public String modifyPwd(){
		TbManageuser userSession=(TbManageuser)ActionContext.getContext().getSession().get("adminUser");
		String md5Digest=DigestUtils.md5Hex(password);
		userSession.setPassword(md5Digest);

		manageUserService.updatePwd(userSession);
		ActionContext.getContext().getSession().remove("adminUser");
		return "loginUI";
	}
	//查找所有后台用户
	public String list(){
		userList=manageUserService.findAll();
		return "list";
	}
	//删除
	public String delete(){
		manageUserService.deleteById(id);
		return "toList";
	}
	//到添加界面
	public String addUI(){
		return "toAddUI";
	}
	//添加用户
	public String addUser(){
		String md5Digest=DigestUtils.md5Hex(manageUser.getPassword());
		manageUser.setPassword(md5Digest);
		manageUserService.saveUser(manageUser);
		return "toList";
	}
	//初始化密码
	public String initPassword(){
		manageUserService.initPwd(id);
		return "toList";
	}
	public IManageUserService getManageUserService() {
		return manageUserService;
	}

	public void setManageUserService(IManageUserService manageUserService) {
		this.manageUserService = manageUserService;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public List<TbManageuser> getUserList() {
		return userList;
	}
	public void setUserList(List<TbManageuser> userList) {
		this.userList = userList;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}

	public TbManageuser getManageUser() {
		return manageUser;
	}
	public void setManageUser(TbManageuser manageUser) {
		this.manageUser = manageUser;
	}
}
