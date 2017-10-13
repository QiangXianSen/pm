/**
 * Copyright @ 2017北京鼎九信息工程研究院有限公司。 All rights reserved.
 *
 * @Author: wangqiang
 * @Date: 2017/10/10 21:13
 */
package com.tanzhouedu.pm.common;

import com.tanzhouedu.pm.utils.StringUtils;

/**
 * Copyright @ 2017北京鼎九信息工程研究院有限公司。 All rights reserved.
 * @Title PageParam
 * @Project pm
 * @Description 分页帮助实体类
 * @Author wangqiang
 * @date 2017/10/10 21:13
 */
public class PageParam {
	private String pageNum = "1";
	private Integer pageSize = 15;
	private String OderBy;//排序的字符串

	public Integer getPageNum() {
		if (StringUtils.isNumeric(pageNum)) {
			return Integer.valueOf(pageNum);
		}else{
			return 1;
		}
	}

	public void setPageNum(String pageNum) {
		this.pageNum = pageNum;
	}

	public Integer getPageSize() {
		return pageSize;
	}

	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}

	public String getOderBy() {
		return OderBy;
	}

	public void setOderBy(String oderBy) {
		OderBy = oderBy;
	}
}
