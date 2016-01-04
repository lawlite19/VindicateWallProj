package com.hhit.entity;

import java.sql.Timestamp;

/**
 * TReplay entity. @author MyEclipse Persistence Tools
 */

public class TReplay implements java.io.Serializable {

	// Fields

	private Long id;
	private TUser TUser;
	private TReleasecontent TReleasecontent;
	private String title;
	private String content;
	private String faceIcon;
	private Timestamp postTime;
	private String ipAddress;
	private Integer isDelete;

	// Constructors

	/** default constructor */
	public TReplay() {
	}

	/** full constructor */
	public TReplay(TUser TUser, TReleasecontent TReleasecontent, String title,
			String content, String faceIcon, Timestamp postTime,
			String ipAddress, Integer isDelete) {
		this.TUser = TUser;
		this.TReleasecontent = TReleasecontent;
		this.title = title;
		this.content = content;
		this.faceIcon = faceIcon;
		this.postTime = postTime;
		this.ipAddress = ipAddress;
		this.isDelete = isDelete;
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

	public TReleasecontent getTReleasecontent() {
		return this.TReleasecontent;
	}

	public void setTReleasecontent(TReleasecontent TReleasecontent) {
		this.TReleasecontent = TReleasecontent;
	}

	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getFaceIcon() {
		return this.faceIcon;
	}

	public void setFaceIcon(String faceIcon) {
		this.faceIcon = faceIcon;
	}

	public Timestamp getPostTime() {
		return this.postTime;
	}

	public void setPostTime(Timestamp postTime) {
		this.postTime = postTime;
	}

	public String getIpAddress() {
		return this.ipAddress;
	}

	public void setIpAddress(String ipAddress) {
		this.ipAddress = ipAddress;
	}

	public Integer getIsDelete() {
		return this.isDelete;
	}

	public void setIsDelete(Integer isDelete) {
		this.isDelete = isDelete;
	}

}