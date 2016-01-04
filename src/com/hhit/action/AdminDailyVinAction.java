package com.hhit.action;

import com.hhit.entity.PageBean;
import com.hhit.entity.TDailyvindicate;
import com.hhit.service.IAdminDailyVinService;

public class AdminDailyVinAction {
	private IAdminDailyVinService adDailyVinService;
	private TDailyvindicate dailyVin;
	private Long dailyVinId;

	private PageBean page;
	private int pageNum=1;
	private int pageSize=6;
	
	private String vindicator;
	private String relaseDate;

	//列表
	public String list(){
		page=adDailyVinService.findByPage(pageNum,pageSize);
		return "list";
	}
	//修改界面
	public String editUI(){
		dailyVin=adDailyVinService.findById(dailyVinId);
		return "saveUI";
	}
	//修改
	public String edit(){
		adDailyVinService.update(dailyVin);
		return "toList";
	}
	//新增界面
	public String addUI(){
		return "saveUI";
	}
	//保存
	public String add(){
		adDailyVinService.saveDailyVin(dailyVin);
		return "toList";
	}
	//删除
	public String delete(){
		adDailyVinService.deleteById(dailyVinId);
		return "toList";
	}
	//条件查找
	public String query(){
		page=adDailyVinService.findByCondition(pageNum,pageSize,vindicator,relaseDate);
		return "list";
	}
	public IAdminDailyVinService getAdDailyVinService() {
		return adDailyVinService;
	}

	public void setAdDailyVinService(IAdminDailyVinService adDailyVinService) {
		this.adDailyVinService = adDailyVinService;
	}
	public Long getDailyVinId() {
		return dailyVinId;
	}
	public void setDailyVinId(Long dailyVinId) {
		this.dailyVinId = dailyVinId;
	}
	public PageBean getPage() {
		return page;
	}
	public void setPage(PageBean page) {
		this.page = page;
	}
	public int getPageNum() {
		return pageNum;
	}
	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public TDailyvindicate getDailyVin() {
		return dailyVin;
	}
	public void setDailyVin(TDailyvindicate dailyVin) {
		this.dailyVin = dailyVin;
	}
	public String getVindicator() {
		return vindicator;
	}
	public void setVindicator(String vindicator) {
		this.vindicator = vindicator;
	}
	public String getRelaseDate() {
		return relaseDate;
	}
	public void setRelaseDate(String relaseDate) {
		this.relaseDate = relaseDate;
	}
}
