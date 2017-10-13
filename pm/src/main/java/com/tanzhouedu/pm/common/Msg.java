/**
 * Copyright @ 2017北京鼎九信息工程研究院有限公司。 All rights reserved.
 *
 * @Author: wangqiang
 * @Date: 2017/10/13 11:12
 */
package com.tanzhouedu.pm.common;

/**
 * Copyright @ 2017北京鼎九信息工程研究院有限公司。 All rights reserved.
 * @Title Msg
 * @Project pm
 * @Description TODO
 * @Author wangqiang
 * @date 2017/10/13 11:12
 */
public class Msg {
	public enum MsgType{
		success,
		error,
		info,
		danger,
		block
	}
	//返回的消息类型（页面根据消息返回的类型或得到相应的内容，alert-...）
	private MsgType type;
	private String content;

	public Msg() {
	}

	public Msg(MsgType type, String content) {
		this.type = type;
		this.content = content;
	}

	public MsgType getType() {
		return type;
	}

	public void setType(MsgType type) {
		this.type = type;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
}
