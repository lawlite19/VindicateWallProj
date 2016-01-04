package com.hhit.base;

import com.hhit.entity.PageBean;
import com.hhit.util.QueryHelper;



public interface IDaoSupport<T> {
	/**
	 * 公共的查询分页信息的方法（最终版）
	 * 
	 * @param pageNum
	 * @param pageSize
	 * @param queryHelper
	 *            HQL语句与参数列表
	 * @return
	 */
	PageBean getPageBean(int pageNum, int pageSize, QueryHelper queryHelper);
}
