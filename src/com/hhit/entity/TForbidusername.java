package com.hhit.entity;

/**
 * TForbidusername entity. @author MyEclipse Persistence Tools
 */

public class TForbidusername implements java.io.Serializable {

	// Fields

	private Long id;
	private String forbidUserName;

	// Constructors

	/** default constructor */
	public TForbidusername() {
	}

	/** full constructor */
	public TForbidusername(String forbidUserName) {
		this.forbidUserName = forbidUserName;
	}

	// Property accessors

	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getForbidUserName() {
		return this.forbidUserName;
	}

	public void setForbidUserName(String forbidUserName) {
		this.forbidUserName = forbidUserName;
	}

}