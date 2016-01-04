package com.hhit.action;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.hhit.entity.TDailyvindicate;
import com.hhit.service.IDailyVindicateService;

public class DailyVindicateAction {
	private IDailyVindicateService dailyVinService;
	private TDailyvindicate dailyVin;
	
	private String releaseDate;
	private int musicRandom;

	//查找当天
	public String toDailyVinUI(){
		dailyVin=dailyVinService.findToday();
		return "toDailyVinUI";
	}
	//按日期查找
	public String findByDate(){

		dailyVin=dailyVinService.findByDate(releaseDate);
		return "toDailyVinUI";
	}
	
	public IDailyVindicateService getDailyVinService() {
		return dailyVinService;
	}

	public void setDailyVinService(IDailyVindicateService dailyVinService) {
		this.dailyVinService = dailyVinService;
	}

	public TDailyvindicate getDailyVin() {
		return dailyVin;
	}

	public void setDailyVin(TDailyvindicate dailyVin) {
		this.dailyVin = dailyVin;
	}
	public String getReleaseDate() {
		return releaseDate;
	}
	public void setReleaseDate(String releaseDate) {
		this.releaseDate = releaseDate;
	}
	public int getMusicRandom() {
		return musicRandom;
	}
	public void setMusicRandom(int musicRandom) {
		this.musicRandom = musicRandom;
	}
}
