package com.hhit.entity;

import java.sql.Timestamp;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;



/**
 * TUser entity. @author MyEclipse Persistence Tools
 */

public class TUser implements java.io.Serializable {

	// Fields

	private Long id;
	private String userName;
	private String password;
	private String realName;
	private String sex;
	private String email;
	private Timestamp birthday;
	private String telphone;
	private String qq;
	private Integer userLevel;
	private String safeQuestion;
	private String safeAnswer;
	private Integer isUsable;
	private Integer msgCount;
	private String faceImage;
	private Set TLogininfos = new HashSet(0);
	private Set TReplaies = new HashSet(0);
	private Set TAttends = new HashSet(0);
	private Set TReleasecontents = new HashSet(0);
	// Constructors

	/** default constructor */
	public TUser() {
	}

	/** minimal constructor */
	public TUser(String userName, String password, String safeQuestion,
			String safeAnswer) {
		this.userName = userName;
		this.password = password;
		this.safeQuestion = safeQuestion;
		this.safeAnswer = safeAnswer;
	}

	/** full constructor */
	public TUser(String userName, String password, String realName, String sex,
			String email, Timestamp birthday, String telphone, String qq,
			Integer userLevel, String safeQuestion, String safeAnswer,
			Integer isUsable, Integer msgCount, String faceImage,
			Set TLogininfos, Set TReplaies, Set TAttends, Set TReleasecontents) {
		this.userName = userName;
		this.password = password;
		this.realName = realName;
		this.sex = sex;
		this.email = email;
		this.birthday = birthday;
		this.telphone = telphone;
		this.qq = qq;
		this.userLevel = userLevel;
		this.safeQuestion = safeQuestion;
		this.safeAnswer = safeAnswer;
		this.isUsable = isUsable;
		this.msgCount = msgCount;
		this.faceImage = faceImage;
		this.TLogininfos = TLogininfos;
		this.TReplaies = TReplaies;
		this.TAttends = TAttends;
		this.TReleasecontents = TReleasecontents;
	}

	// Property accessors

	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getUserName() {
		return this.userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getRealName() {
		return this.realName;
	}

	public void setRealName(String realName) {
		this.realName = realName;
	}

	public String getSex() {
		return this.sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Timestamp getBirthday() {
		return this.birthday;
	}

	public void setBirthday(Timestamp birthday) {
		this.birthday = birthday;
	}

	public String getTelphone() {
		return this.telphone;
	}

	public void setTelphone(String telphone) {
		this.telphone = telphone;
	}

	public String getQq() {
		return this.qq;
	}

	public void setQq(String qq) {
		this.qq = qq;
	}

	public Integer getUserLevel() {
		return this.userLevel;
	}

	public void setUserLevel(Integer userLevel) {
		this.userLevel = userLevel;
	}

	public String getSafeQuestion() {
		return this.safeQuestion;
	}

	public void setSafeQuestion(String safeQuestion) {
		this.safeQuestion = safeQuestion;
	}

	public String getSafeAnswer() {
		return this.safeAnswer;
	}

	public void setSafeAnswer(String safeAnswer) {
		this.safeAnswer = safeAnswer;
	}

	public Integer getIsUsable() {
		return this.isUsable;
	}

	public void setIsUsable(Integer isUsable) {
		this.isUsable = isUsable;
	}

	public Integer getMsgCount() {
		return this.msgCount;
	}

	public void setMsgCount(Integer msgCount) {
		this.msgCount = msgCount;
	}

	public String getFaceImage() {
		return this.faceImage;
	}

	public void setFaceImage(String faceImage) {
		this.faceImage = faceImage;
	}

	public Set getTLogininfos() {
		return this.TLogininfos;
	}

	public void setTLogininfos(Set TLogininfos) {
		this.TLogininfos = TLogininfos;
	}

	public Set getTReplaies() {
		return this.TReplaies;
	}

	public void setTReplaies(Set TReplaies) {
		this.TReplaies = TReplaies;
	}

	public Set getTAttends() {
		return this.TAttends;
	}

	public void setTAttends(Set TAttends) {
		this.TAttends = TAttends;
	}

	public Set getTReleasecontents() {
		return this.TReleasecontents;
	}

	public void setTReleasecontents(Set TReleasecontents) {
		this.TReleasecontents = TReleasecontents;
	}

}