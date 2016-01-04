package com.hhit.action;






import org.apache.commons.codec.digest.DigestUtils;

import com.hhit.entity.PageBean;
import com.hhit.entity.TbManageuser;
import com.hhit.service.IUserService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class UserAction extends ActionSupport{
	private TbManageuser manageUser;
	private IUserService userService;
	private Long userId;
	//条件查询传过来的条件
	private String userName;
	private String realName;
	private String isUsable;
	
	
	private PageBean page;
	private int pageNum=1;
	private int pageSize=12;
	/** 登录页面 */
	public String loginUI() throws Exception {
		return "loginUI";
	}
	/** 登录 */
	public String login() throws Exception {
		String md5Digest=DigestUtils.md5Hex(manageUser.getPassword());
		TbManageuser adminUser = userService.findByLoginNameAndPassword(manageUser.getUserName(), md5Digest);
		if (adminUser == null) {
			addFieldError("login", "用户名或密码不正确！");
			return "loginUI";
		} else {
			// 登录用户
			ActionContext.getContext().getSession().put("adminUser", adminUser);
			return "toIndex";
		}
	}
	/** 注销 */
	public String logout() throws Exception {
		ActionContext.getContext().getSession().remove("adminUser");
		return "logout";
	}
	/** 列表 */
	public String list() throws Exception {
		page=userService.findUserByPage(pageNum,pageSize);
		return "list";
	}
	/** 禁用 */
	public String delete() throws Exception {
		userService.delete(userId);
		return "toList";
	}
	/** 还原 */
	public String returnBefore() throws Exception {
		userService.usalbe(userId);
		return "toList";
	}
	/** 条件查询*/
	public String query() throws Exception {
		page=userService.findByCondition(pageNum,pageSize,userName,realName,isUsable);
		return "list";
	}
	public IUserService getUserService() {
		return userService;
	}
	public void setUserService(IUserService userService) {
		this.userService = userService;
	}
	public TbManageuser getManageUser() {
		return manageUser;
	}
	public void setManageUser(TbManageuser manageUser) {
		this.manageUser = manageUser;
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
	public Long getUserId() {
		return userId;
	}
	public void setUserId(Long userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getRealName() {
		return realName;
	}
	public void setRealName(String realName) {
		this.realName = realName;
	}
	public String getIsUsable() {
		return isUsable;
	}
	public void setIsUsable(String isUsable) {
		this.isUsable = isUsable;
	}
}
