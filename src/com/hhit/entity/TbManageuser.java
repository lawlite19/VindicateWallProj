package com.hhit.entity;

import java.util.Collection;
import java.util.HashSet;
import java.util.Set;
import com.opensymphony.xwork2.ActionContext;

/**
 * TbManageuser entity. @author MyEclipse Persistence Tools
 */

public class TbManageuser implements java.io.Serializable {

	// Fields

	private Integer id;
	private String userName;
	private String password;
	private String userType;
	private Set<TbManageuserRole> tbManageuserRoles = new HashSet<TbManageuserRole>();


	
	// Constructors

	/** default constructor */
	public TbManageuser() {
	}
	/**
	 * 判断本用户是否有指定名称的权限
	 * 
	 * @param name
	 * @return
	 */
	public boolean hasPrivilegeByName(String name) {
		// 超级管理有所有的权限
		if (isAdmin()) {
			return true;
		}

		// 普通用户要判断是否含有这个权限
		for (TbManageuserRole role : tbManageuserRoles) {
			for (TbRolePrivilege priv : role.getId().getTbRole().getTbRolePrivileges()) {
				if (priv.getId().getTbPrivilege().getName().equals(name)) {
					return true;
				}
			}
		}
		return false;
	}
	/**
	 * 判断本用户是否有指定URL的权限
	 * 
	 * @param privUrl
	 * @return
	 */
	public boolean hasPrivilegeByUrl(String privUrl) {
		// 超级管理有所有的权限
		if (isAdmin()) {
			return true;
		}

		// >> 去掉后面的参数
		int pos = privUrl.indexOf("?");
		if (pos > -1) {
			privUrl = privUrl.substring(0, pos);
		}
		// >> 去掉UI后缀
		if (privUrl.endsWith("UI")) {
			privUrl = privUrl.substring(0, privUrl.length() - 2);
		}

		// 如果本URL不需要控制，则登录用户就可以使用
		Collection<String> allPrivilegeUrls = (Collection<String>) ActionContext.getContext().getApplication().get("allPrivilegeUrls");
		if (!allPrivilegeUrls.contains(privUrl)) {
			return true;
		} else {
			// 普通用户要判断是否含有这个权限
//			for (TbRole role : tbManageuserRoles) {
//				for (TbRolePrivilege priv : role.getTbRolePrivileges()) {
//					if (privUrl.equals(priv.getId().getTbPrivilege().getUrl())) {
//						return true;
//					}
//				}
//			}
			return false;
		}
	}

	/**
	 * 判断本用户是否是超级管理员
	 * 
	 * @return
	 */
	public boolean isAdmin() {
		return "莫失莫忘".equals(userName);
	}

	/** full constructor */
	public TbManageuser(String userName, String password, String userType,
			Set tbManageuserRoles) {
		this.userName = userName;
		this.password = password;
		this.userType = userType;
		this.tbManageuserRoles = tbManageuserRoles;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getUserName() {
		return this.userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getUserType() {
		return this.userType;
	}

	public void setUserType(String userType) {
		this.userType = userType;
	}
	public Set<TbManageuserRole> getTbManageuserRoles() {
		return tbManageuserRoles;
	}
	public void setTbManageuserRoles(Set<TbManageuserRole> tbManageuserRoles) {
		this.tbManageuserRoles = tbManageuserRoles;
	}



}