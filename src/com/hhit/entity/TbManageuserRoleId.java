package com.hhit.entity;

/**
 * TbManageuserRoleId entity. @author MyEclipse Persistence Tools
 */

public class TbManageuserRoleId implements java.io.Serializable {

	// Fields

	private TbRole tbRole;
	private TbManageuser tbManageuser;

	// Constructors

	/** default constructor */
	public TbManageuserRoleId() {
	}

	/** full constructor */
	public TbManageuserRoleId(TbRole tbRole, TbManageuser tbManageuser) {
		this.tbRole = tbRole;
		this.tbManageuser = tbManageuser;
	}

	// Property accessors

	public TbRole getTbRole() {
		return this.tbRole;
	}

	public void setTbRole(TbRole tbRole) {
		this.tbRole = tbRole;
	}

	public TbManageuser getTbManageuser() {
		return this.tbManageuser;
	}

	public void setTbManageuser(TbManageuser tbManageuser) {
		this.tbManageuser = tbManageuser;
	}

	public boolean equals(Object other) {
		if ((this == other))
			return true;
		if ((other == null))
			return false;
		if (!(other instanceof TbManageuserRoleId))
			return false;
		TbManageuserRoleId castOther = (TbManageuserRoleId) other;

		return ((this.getTbRole() == castOther.getTbRole()) || (this
				.getTbRole() != null && castOther.getTbRole() != null && this
				.getTbRole().equals(castOther.getTbRole())))
				&& ((this.getTbManageuser() == castOther.getTbManageuser()) || (this
						.getTbManageuser() != null
						&& castOther.getTbManageuser() != null && this
						.getTbManageuser().equals(castOther.getTbManageuser())));
	}

	public int hashCode() {
		int result = 17;

		result = 37 * result
				+ (getTbRole() == null ? 0 : this.getTbRole().hashCode());
		result = 37
				* result
				+ (getTbManageuser() == null ? 0 : this.getTbManageuser()
						.hashCode());
		return result;
	}

}