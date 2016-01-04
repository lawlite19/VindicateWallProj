package com.hhit.entity;

import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Set;

/**
 * TReleasecontent entity. @author MyEclipse Persistence Tools
 */

public class TReleasecontent implements java.io.Serializable {

	// Fields

	private Long id;
	private TUser TUser;
	private String releaseContent;
	private String realName;
	private String background;
	private Integer isRecommand;
	private String ipAddress;
	private Timestamp releaseTime;
	private Integer viewCount;
	private Integer commentCount;
	private Set TReplaies = new HashSet(0);
	private Set TMessages = new HashSet(0);

	// Constructors

	/** default constructor */
	public TReleasecontent() {
	}

	/** minimal constructor */
	public TReleasecontent(TUser TUser) {
		this.TUser = TUser;
	}

	/** full constructor */
	public TReleasecontent(TUser TUser, String releaseContent, String realName,
			String background, Integer isRecommand, String ipAddress,
			Timestamp releaseTime, Integer viewCount, Integer commentCount,
			Set TReplaies, Set TMessages) {
		this.TUser = TUser;
		this.releaseContent = releaseContent;
		this.realName = realName;
		this.background = background;
		this.isRecommand = isRecommand;
		this.ipAddress = ipAddress;
		this.releaseTime = releaseTime;
		this.viewCount = viewCount;
		this.commentCount = commentCount;
		this.TReplaies = TReplaies;
		this.TMessages = TMessages;
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

	public String getReleaseContent() {
		return this.releaseContent;
	}

	public void setReleaseContent(String releaseContent) {
		this.releaseContent = releaseContent;
	}

	public String getRealName() {
		return this.realName;
	}

	public void setRealName(String realName) {
		this.realName = realName;
	}

	public String getBackground() {
		return this.background;
	}

	public void setBackground(String background) {
		this.background = background;
	}

	public Integer getIsRecommand() {
		return this.isRecommand;
	}

	public void setIsRecommand(Integer isRecommand) {
		this.isRecommand = isRecommand;
	}

	public String getIpAddress() {
		return this.ipAddress;
	}

	public void setIpAddress(String ipAddress) {
		this.ipAddress = ipAddress;
	}

	public Timestamp getReleaseTime() {
		return this.releaseTime;
	}

	public void setReleaseTime(Timestamp releaseTime) {
		this.releaseTime = releaseTime;
	}

	public Integer getViewCount() {
		return this.viewCount;
	}

	public void setViewCount(Integer viewCount) {
		this.viewCount = viewCount;
	}

	public Integer getCommentCount() {
		return this.commentCount;
	}

	public void setCommentCount(Integer commentCount) {
		this.commentCount = commentCount;
	}

	public Set getTReplaies() {
		return this.TReplaies;
	}

	public void setTReplaies(Set TReplaies) {
		this.TReplaies = TReplaies;
	}

	public Set getTMessages() {
		return this.TMessages;
	}

	public void setTMessages(Set TMessages) {
		this.TMessages = TMessages;
	}

}