package com.hhit.entity;

import java.sql.Timestamp;

/**
 * TLogininfo entity. @author MyEclipse Persistence Tools
 */

public class TLogininfo implements java.io.Serializable {

	// Fields

	private Long id;
	private TUser TUser;
	private String loginPlace;
	private String ipAddress;
	private Timestamp loginTime;

	// Constructors

	/** default constructor */
	public TLogininfo() {
	}

	/** minimal constructor */
	public TLogininfo(Long id, TUser TUser) {
		this.id = id;
		this.TUser = TUser;
	}

	/** full constructor */
	public TLogininfo(Long id, TUser TUser, String loginPlace,
			String ipAddress, Timestamp loginTime) {
		this.id = id;
		this.TUser = TUser;
		this.loginPlace = loginPlace;
		this.ipAddress = ipAddress;
		this.loginTime = loginTime;
	}

	// Property accessors

	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public TUser getTUser() {
		return this.TUser;
	}

	public void setTUser(TUser TUser) {
		this.TUser = TUser;
	}

	public String getLoginPlace() {
		return this.loginPlace;
	}

	public void setLoginPlace(String loginPlace) {
		this.loginPlace = loginPlace;
	}

	public String getIpAddress() {
		return this.ipAddress;
	}

	public void setIpAddress(String ipAddress) {
		this.ipAddress = ipAddress;
	}

	public Timestamp getLoginTime() {
		return this.loginTime;
	}

	public void setLoginTime(Timestamp loginTime) {
		this.loginTime = loginTime;
	}

}