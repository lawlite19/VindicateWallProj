package com.hhit.action;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import com.hhit.entity.TMessage;
import com.hhit.service.ISysInfoService;

public class SystemInfoAction {
	private ISysInfoService sysInfoService;
	private List<TMessage> systemInfo;
	private Long id;
	private TMessage sysInfo;
	//列表
	public String list(){
		systemInfo=sysInfoService.findAllSysInfo();
		return "list";
	}
	//删除
	public String delete(){
		sysInfoService.delete(id);
		return "toList";
	}
	//到添加界面
	public String addUI(){
		return "toAddUI";
	}
	//添加
	public String addInfo(){
		sysInfo.setPostTime(new Timestamp(new Date().getTime()));
		sysInfo.setMsgType("系统消息");
		sysInfoService.saveInfo(sysInfo);
		return "toList";
	}
	public ISysInfoService getSysInfoService() {
		return sysInfoService;
	}

	public void setSysInfoService(ISysInfoService sysInfoService) {
		this.sysInfoService = sysInfoService;
	}
	public List<TMessage> getSystemInfo() {
		return systemInfo;
	}
	public void setSystemInfo(List<TMessage> systemInfo) {
		this.systemInfo = systemInfo;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public TMessage getSysInfo() {
		return sysInfo;
	}
	public void setSysInfo(TMessage sysInfo) {
		this.sysInfo = sysInfo;
	}
}
