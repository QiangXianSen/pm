/**
 * Copyright @ 2017北京鼎九信息工程研究院有限公司。 All rights reserved.
 *
 * @Author: wangqiang
 * @Date: 2017/10/11 17:34
 */
package com.tanzhouedu.pm.utils;

import com.github.pagehelper.PageInfo;

/**
 * Copyright @ 2017北京鼎九信息工程研究院有限公司。 All rights reserved.
 * @Title PageUtils
 * @Project pm
 * @Description 分页所需工具类 生成界面上的分页组件
 * @Author wangqiang
 * @date 2017/10/11 17:34
 */
public class PageUtils {

	//<ul><li class="disabled"><a href="javascript:">&#171; 上一页</a></li><li class="active"><a href="javascript:">1</a></li><li><a href="javascript:page(2,15)">2</a></li><li><a href="javascript:page(3,15)">3</a></li><li><a href="javascript:page(2,15)">下一页 &#187;</a></li><li class="disabled controls"><a href="javascript:void(0);">当前第 <input type="text" value="1" onkeypress="var e=window.event||this;var c=e.keyCode||e.which;if(c==13)page(this.value,15);" onclick="this.select();"/> 页 / 共 3 页， 共 33 条</a></li></ul>
	public static String pageStr (PageInfo pageInfo) {

		StringBuilder sb = new StringBuilder("<ul>");
		//判断当前页是不是首页
		if (pageInfo.isIsFirstPage()) {
			sb.append("<li class=\"disabled\"><a href=\"javascript:\">&#171; 上一页</a></li>");
		} else {
			sb.append("<li><a href=\"javascript:page(");
			sb.append(pageInfo.getPrePage()).append(",");
			sb.append(pageInfo.getPageSize()).append(")\">&#171; 上一页</a></li>");
		}

		for (int i = 0; i < pageInfo.getNavigatepageNums().length; i++) {
			int pageNum = pageInfo.getNavigatepageNums()[i];
			if (pageInfo.getPageNum() == pageNum) {
				sb.append("<li class=\"active\"><a href=\"javascript:\">");
				sb.append(pageNum).append("</a></li>");
			} else {
				sb.append("<li><a href=\"javascript:page(");
				sb.append(pageNum).append(", ");
				sb.append(pageInfo.getPageSize()).append(")\">");
				sb.append(pageNum).append("</a></li>");
			}
		}

		//判断是否是尾页
		if (pageInfo.isIsLastPage()) {
			sb.append("<li class=\"disabled\"><a href=\"javascript:\">下一页 &#187;</a></li>");
		} else {
			sb.append("<li><a href=\"javascript:page(");
			sb.append(pageInfo.getNextPage()).append(",");
			sb.append(pageInfo.getPageSize()).append(")\">下一页 &#187;</a></li>");
		}

		sb.append("<li class=\"disabled controls\"><a href=\"javascript:void(0);\">当前第 ");
		sb.append("<input type=\"text\" maxLength=\"6\" value=\"");
		sb.append(pageInfo.getPageNum());
		sb.append("\" onkeypress=\"var e=window.event||this;var c=e.keyCode||e.which;if(c==13)page(this.value,");
		sb.append(pageInfo.getPageSize()).append(");\" onclick=\"this.select();\"/>");
		sb.append(" 页 / 共 ");
		sb.append(pageInfo.getPages());
		sb.append(" 页， 共 ");
		sb.append(pageInfo.getTotal());
		sb.append(" 条</a></li></ul>");

		return sb.toString();

	}
}
