package com.hhit.entity;

import java.util.HashSet;
import java.util.Set;



/**
 * TbPrivilege entity. @author MyEclipse Persistence Tools
 */

public class TbPrivilege implements java.io.Serializable {

	// Fields

	private Integer id;
	private TbPrivilege tbPrivilege;//parentId
	private String url;
	private String name;
	//tb_role_privilege中外键PrivilegeId
	//一对多
	private Set tbRolePrivileges = new HashSet(0);
	private Set tbPrivileges = new HashSet(0);



	/** default constructor */
	public TbPrivilege() {
	}

	/** full constructor */
	public TbPrivilege(TbPrivilege tbPrivilege, String url, String name,
			Set tbRolePrivileges, Set tbPrivileges) {
		this.tbPrivilege = tbPrivilege;
		this.url = url;
		this.name = name;
		this.tbRolePrivileges = tbRolePrivileges;
		this.tbPrivileges = tbPrivileges;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public TbPrivilege getTbPrivilege() {
		return this.tbPrivilege;
	}

	public void setTbPrivilege(TbPrivilege tbPrivilege) {
		this.tbPrivilege = tbPrivilege;
	}

	public String getUrl() {
		return this.url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Set getTbRolePrivileges() {
		return this.tbRolePrivileges;
	}

	public void setTbRolePrivileges(Set tbRolePrivileges) {
		this.tbRolePrivileges = tbRolePrivileges;
	}

	public Set getTbPrivileges() {
		return this.tbPrivileges;
	}

	public void setTbPrivileges(Set tbPrivileges) {
		this.tbPrivileges = tbPrivileges;
	}

}