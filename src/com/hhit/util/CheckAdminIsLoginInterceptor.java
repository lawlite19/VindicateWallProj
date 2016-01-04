package com.hhit.util;

import com.hhit.entity.TbManageuser;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

public class CheckAdminIsLoginInterceptor extends AbstractInterceptor {

	@Override
	public String intercept(ActionInvocation invocation) throws Exception {
		TbManageuser user=(TbManageuser)ActionContext.getContext().getSession().get("adminUser");
		String actionName = invocation.getProxy().getActionName();
		if(user==null){
			if(actionName.startsWith("user_login"))
				return invocation.invoke();
			else
				return "loginUI";
		}
		
		return invocation.invoke();
	}

}
