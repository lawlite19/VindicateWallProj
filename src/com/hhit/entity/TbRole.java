package com.hhit.entity;

import java.util.HashSet;
import java.util.Set;

/**
 * TbRole entity. @author MyEclipse Persistence Tools
 */

public class TbRole implements java.io.Serializable {

	// Fields

	private Integer id;
	private String name;
	private String description;
	//tb_role_privilege中外键RoleId
	//一对多
	private Set<TbRolePrivilege> tbRolePrivileges = new HashSet<TbRolePrivilege>();
	private Set tbManageuserRoles = new HashSet(0);

	//private Set<TbPrivilege> tbPrivileges = new HashSet<TbPrivilege>();
	// Constructors

	/** default constructor */
	public TbRole() {
	}

	/** full constructor */
	public TbRole(String name, String description, Set<TbRolePrivilege> tbRolePrivileges,
			Set tbManageuserRoles) {
		this.name = name;
		this.description = description;
		this.setTbRolePrivileges(tbRolePrivileges);
		this.tbManageuserRoles = tbManageuserRoles;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

//	public Set getTbRolePrivileges() {
//		return this.tbRolePrivileges;
//	}
//
//	public void setTbRolePrivileges(Set tbRolePrivileges) {
//		this.tbRolePrivileges = tbRolePrivileges;
//	}

	public Set getTbManageuserRoles() {
		return this.tbManageuserRoles;
	}

	public void setTbManageuserRoles(Set tbManageuserRoles) {
		this.tbManageuserRoles = tbManageuserRoles;
	}

	public Set<TbRolePrivilege> getTbRolePrivileges() {
		return tbRolePrivileges;
	}

	public void setTbRolePrivileges(Set<TbRolePrivilege> tbRolePrivileges) {
		this.tbRolePrivileges = tbRolePrivileges;
	}

}