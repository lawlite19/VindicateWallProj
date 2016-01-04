package com.hhit.entity;

import java.util.Date;

/**
 * TAttend entity. @author MyEclipse Persistence Tools
 */

public class TAttend implements java.io.Serializable {

	// Fields

	private Long id;
	private TUser TUser;
	private Date lastAttend;
	private Integer score;
	private Integer attendCount;

	// Constructors

	/** default constructor */
	public TAttend() {
	}

	/** full constructor */
	public TAttend(TUser TUser, Date lastAttend, Integer score, Integer attendCount) {
		this.TUser = TUser;
		this.lastAttend = lastAttend;
		this.score = score;
		this.attendCount = attendCount;
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

	public Date getLastAttend() {
		return this.lastAttend;
	}

	public void setLastAttend(Date lastAttend) {
		this.lastAttend = lastAttend;
	}

	public Integer getScore() {
		return this.score;
	}

	public void setScore(Integer score) {
		this.score = score;
	}

	public Integer getAttendCount() {
		return this.attendCount;
	}

	public void setAttendCount(Integer attendCount) {
		this.attendCount = attendCount;
	}

}