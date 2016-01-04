package com.hhit.entity;

/**
 * TbRolePrivilegeId entity. @author MyEclipse Persistence Tools
 */

public class TbRolePrivilegeId implements java.io.Serializable {

	// Fields

	private TbPrivilege tbPrivilege;
	private TbRole tbRole;

	// Constructors

	/** default constructor */
	public TbRolePrivilegeId() {
	}

	/** full constructor */
	public TbRolePrivilegeId(TbPrivilege tbPrivilege, TbRole tbRole) {
		this.tbPrivilege = tbPrivilege;
		this.tbRole = tbRole;
	}

	// Property accessors

	public TbPrivilege getTbPrivilege() {
		return this.tbPrivilege;
	}

	public void setTbPrivilege(TbPrivilege tbPrivilege) {
		this.tbPrivilege = tbPrivilege;
	}

	public TbRole getTbRole() {
		return this.tbRole;
	}

	public void setTbRole(TbRole tbRole) {
		this.tbRole = tbRole;
	}

	public boolean equals(Object other) {
		if ((this == other))
			return true;
		if ((other == null))
			return false;
		if (!(other instanceof TbRolePrivilegeId))
			return false;
		TbRolePrivilegeId castOther = (TbRolePrivilegeId) other;

		return ((this.getTbPrivilege() == castOther.getTbPrivilege()) || (this
				.getTbPrivilege() != null && castOther.getTbPrivilege() != null && this
				.getTbPrivilege().equals(castOther.getTbPrivilege())))
				&& ((this.getTbRole() == castOther.getTbRole()) || (this
						.getTbRole() != null && castOther.getTbRole() != null && this
						.getTbRole().equals(castOther.getTbRole())));
	}

	public int hashCode() {
		int result = 17;

		result = 37
				* result
				+ (getTbPrivilege() == null ? 0 : this.getTbPrivilege()
						.hashCode());
		result = 37 * result
				+ (getTbRole() == null ? 0 : this.getTbRole().hashCode());
		return result;
	}

}