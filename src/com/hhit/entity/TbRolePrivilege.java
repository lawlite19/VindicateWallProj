package com.hhit.entity;

/**
 * TbRolePrivilege entity. @author MyEclipse Persistence Tools
 */

public class TbRolePrivilege implements java.io.Serializable {

	// Fields
	//联合主键对应一个Id属性，相当于整个表tb_role_privilege
	//里面有两个key，分别是role和privilege
	private TbRolePrivilegeId id;

	// Constructors

	/** default constructor */
	public TbRolePrivilege() {
	}

	/** full constructor */
	public TbRolePrivilege(TbRolePrivilegeId id) {
		this.id = id;
	}

	// Property accessors

	public TbRolePrivilegeId getId() {
		return this.id;
	}

	public void setId(TbRolePrivilegeId id) {
		this.id = id;
	}

}