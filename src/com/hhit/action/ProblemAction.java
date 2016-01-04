package com.hhit.action;

import java.sql.Timestamp;
import java.util.Date;

import com.hhit.entity.TProblem;
import com.hhit.service.IProblemService;

public class ProblemAction {
	private IProblemService problemService;
	private TProblem problem;
	//提交问题
	public String submitQuestion(){
		problem.setIsSolve("否");
		problem.setIsUsable("否");
		problem.setSubTime(new Timestamp(new Date().getTime()));
		problemService.save(problem);
		return "toMainUI";
	}
	public IProblemService getProblemService() {
		return problemService;
	}

	public void setProblemService(IProblemService problemService) {
		this.problemService = problemService;
	}

	public TProblem getProblem() {
		return problem;
	}

	public void setProblem(TProblem problem) {
		this.problem = problem;
	}
}
