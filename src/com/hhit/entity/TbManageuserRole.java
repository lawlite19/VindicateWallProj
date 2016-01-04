package com.hhit.entity;

/**
 * TbManageuserRole entity. @author MyEclipse Persistence Tools
 */

public class TbManageuserRole implements java.io.Serializable {

	// Fields

	private TbManageuserRoleId id;

	// Constructors

	/** default constructor */
	public TbManageuserRole() {
	}

	/** full constructor */
	public TbManageuserRole(TbManageuserRoleId id) {
		this.id = id;
	}

	// Property accessors

	public TbManageuserRoleId getId() {
		return this.id;
	}

	public void setId(TbManageuserRoleId id) {
		this.id = id;
	}

}