package com.hhit.entity;

import java.util.Date;

/**
 * TDailyvindicate entity. @author MyEclipse Persistence Tools
 */

public class TDailyvindicate implements java.io.Serializable {

	// Fields

	private Long id;
	private String vindicator;
	private String boyName;
	private String girlName;
	private String content;
	private String comments;
	private Date releaseDate;
	private String year;
	private String month;
	private String day;

	// Constructors

	/** default constructor */
	public TDailyvindicate() {
	}

	/** full constructor */
	public TDailyvindicate(String vindicator, String boyName, String girlName,
			String content, String comments, Date releaseDate, String year,
			String month, String day) {
		this.vindicator = vindicator;
		this.boyName = boyName;
		this.girlName = girlName;
		this.content = content;
		this.comments = comments;
		this.releaseDate = releaseDate;
		this.year = year;
		this.month = month;
		this.day = day;
	}

	// Property accessors

	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getVindicator() {
		return this.vindicator;
	}

	public void setVindicator(String vindicator) {
		this.vindicator = vindicator;
	}

	public String getBoyName() {
		return this.boyName;
	}

	public void setBoyName(String boyName) {
		this.boyName = boyName;
	}

	public String getGirlName() {
		return this.girlName;
	}

	public void setGirlName(String girlName) {
		this.girlName = girlName;
	}

	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getComments() {
		return this.comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}

	public Date getReleaseDate() {
		return this.releaseDate;
	}

	public void setReleaseDate(Date releaseDate) {
		this.releaseDate = releaseDate;
	}

	public String getYear() {
		return this.year;
	}

	public void setYear(String year) {
		this.year = year;
	}

	public String getMonth() {
		return this.month;
	}

	public void setMonth(String month) {
		this.month = month;
	}

	public String getDay() {
		return this.day;
	}

	public void setDay(String day) {
		this.day = day;
	}

}