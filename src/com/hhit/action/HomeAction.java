package com.hhit.action;

import com.opensymphony.xwork2.ActionSupport;

public class HomeAction extends ActionSupport {
	public String index() throws Exception {
		return "index";
	}

	public String top() throws Exception {
		return "top";
	}

	public String bottom() throws Exception {
		return "bottom";
	}

	public String left() throws Exception {
		return "left";
	}

	public String right() throws Exception {
		return "right";
	}
}
