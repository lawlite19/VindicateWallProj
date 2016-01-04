package com.hhit.action;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;





import net.sf.json.JSONObject;

import com.opensymphony.xwork2.ActionSupport;

public class IntelligentAction extends ActionSupport{
	private String chatContent;
	private String result;
	
	/** 调用图灵机器人平台接口 
	*/ 
	public String tuLing() throws IOException{
		String APIKEY = "af94fa0940d86b42264e257c12a0a906"; 
	    String INFO = URLEncoder.encode(chatContent, "utf-8"); 
	    String getURL = "http://www.tuling123.com/openapi/api?key=" + APIKEY + "&info=" + INFO; 
	    URL getUrl = new URL(getURL); 
	    HttpURLConnection connection = (HttpURLConnection) getUrl.openConnection(); 
	    connection.connect(); 

	    // 取得输入流，并使用Reader读取 
	    BufferedReader reader = new BufferedReader(new InputStreamReader( connection.getInputStream(), "utf-8"));
	    StringBuffer sb = new StringBuffer(); 
	    String line = ""; 
	    while ((line = reader.readLine()) != null) { 
	        sb.append(line); 
	    } 
	    reader.close(); 
	    // 断开连接 
	    connection.disconnect(); 
	    System.out.println(sb); 
		// 将要返回的map对象进行json处理
	    JSONObject jsonObject = JSONObject.fromObject(sb.toString());
		// 调用json对象的toString方法转换为字符串然后赋值给result
		this.result = jsonObject.toString();
	    return "success";
	}
	
	
	public String getChatContent() {
		return chatContent;
	}
	public void setChatContent(String chatContent) {
		this.chatContent = chatContent;
	}

	public String getResult() {
		return result;
	}


	public void setResult(String result) {
		this.result = result;
	}

}
