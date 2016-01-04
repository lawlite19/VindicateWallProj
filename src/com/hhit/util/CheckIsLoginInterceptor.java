package com.hhit.util;

import com.hhit.entity.TUser;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

public class CheckIsLoginInterceptor extends AbstractInterceptor{

	@Override
	public String intercept(ActionInvocation invocation) throws Exception {
		TUser user=(TUser)ActionContext.getContext().getSession().get("user");
		String namespace = invocation.getProxy().getNamespace();
		String actionName = invocation.getProxy().getActionName();
		String actionMethod = invocation.getProxy().getMethod();
		if(actionName.equals("rand"))
			return invocation.invoke();
		if(actionName.equals("dailyVin"))
			return invocation.invoke();
		if(user==null){
			if(actionMethod.equals("login")||actionMethod.equals("queryReleaseInfo")||actionMethod.equals("findPassword")||actionMethod.equals("updatePassword")||actionMethod.equals("register")||actionMethod.equals("toReplayUI")||actionMethod.equals("toReplayUIPage")||actionMethod.equals("submitQuestion"))
				return invocation.invoke();
			else if(actionName.equals("releaseInfo")&&actionMethod.equals("execute"))
				return invocation.invoke();
			else
				return "input";
		}
		else
			return invocation.invoke();
	}

}
