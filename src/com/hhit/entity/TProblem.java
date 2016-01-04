package com.hhit.entity;

import java.sql.Timestamp;

/**
 * TProblem entity. @author MyEclipse Persistence Tools
 */

public class TProblem implements java.io.Serializable {

	// Fields

	private Long id;
	private String email;
	private String description;
	private Timestamp subTime;
	private String isSolve;
	private String isUsable;

	// Constructors

	/** default constructor */
	public TProblem() {
	}

	/** full constructor */
	public TProblem(String email, String description, Timestamp subTime,
			String isSolve, String isUsable) {
		this.email = email;
		this.description = description;
		this.subTime = subTime;
		this.isSolve = isSolve;
		this.isUsable = isUsable;
	}

	// Property accessors

	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Timestamp getSubTime() {
		return this.subTime;
	}

	public void setSubTime(Timestamp subTime) {
		this.subTime = subTime;
	}

	public String getIsSolve() {
		return this.isSolve;
	}

	public void setIsSolve(String isSolve) {
		this.isSolve = isSolve;
	}

	public String getIsUsable() {
		return this.isUsable;
	}

	public void setIsUsable(String isUsable) {
		this.isUsable = isUsable;
	}

}