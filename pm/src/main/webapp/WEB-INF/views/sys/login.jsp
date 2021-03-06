<%@page pageEncoding="utf-8" language="java" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<title>权限管理系统 登录</title>
	<%@ include file="/WEB-INF/views/include/head.jsp"%>
	<style type="text/css">
      html,body,table{background-color:#f5f5f5;width:100%;text-align:center;}
	  .form-signin-heading{font-family:Helvetica, Georgia, Arial, sans-serif, 黑体;font-size:36px;margin-bottom:20px;color:#0663a2;}
      .form-signin{position:relative;text-align:left;width:300px;padding:25px 29px 29px;margin:0 auto 20px;background-color:#fff;border:1px solid #e5e5e5;
        	-webkit-border-radius:5px;-moz-border-radius:5px;border-radius:5px;-webkit-box-shadow:0 1px 2px rgba(0,0,0,.05);-moz-box-shadow:0 1px 2px rgba(0,0,0,.05);box-shadow:0 1px 2px rgba(0,0,0,.05);}
      .form-signin .checkbox{margin-bottom:10px;color:#0663a2;} .form-signin .input-label{font-size:16px;line-height:23px;color:#999;}
      .form-signin .input-block-level{font-size:16px;height:auto;margin-bottom:15px;padding:7px;*width:283px;*padding-bottom:0;_padding:7px 7px 9px 7px;}
      .form-signin .btn.btn-large{font-size:16px;} .form-signin #themeSwitch{position:absolute;right:15px;bottom:10px;}
      .form-signin div.validateCode {padding-bottom:15px;} .mid{vertical-align:middle;}
      .header{height:80px;padding-top:20px;} .alert{position:relative;width:300px;margin:0 auto;*padding-bottom:0px;}
      label.error{background:none;width:270px;font-weight:normal;color:inherit;margin:0;}
    </style>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#loginForm").validate({
				messages: {
					username: {required: "请填写用户名."},password: {required: "请填写密码."}
				},
				errorLabelContainer: "#messageBox",
				errorPlacement: function(error, element) {
					error.appendTo($("#loginError").parent());
				} 
			});
		});
		// 如果在框架或在对话框中，则弹出提示并跳转到首页
		if(self.frameElement && self.frameElement.tagName == "IFRAME" || $('#left').length > 0 || $('.jbox').length > 0){
			alert('未登录或登录超时。请重新登录，谢谢！');
			top.location = "";
		}
	</script>
</head>
<body>
	<!--[if lte IE 6]>
	<br/>
	<div class='alert alert-block' style="text-align:left;padding-bottom:10px;">
		<a class="close" data-dismiss="alert">x</a>
		<h4>温馨提示：</h4>
		<p>你使用的浏览器版本过低。为了获得更好的浏览体验，强烈建议您 <a href="http://browsehappy.com" target="_blank">升级</a>
			到最新版本的IE浏览器，或者使用较新版本的 Chrome、Firefox、Safari 等。</p>
	</div>
	<![endif]-->
	<div class="header">
		<div id="messageBox" class="alert alert-error hide">
			<button data-dismiss="alert" class="close">×</button>
			<label id="loginError" class="error"></label>
		</div>
	</div>
	<h1 class="form-signin-heading">权限管理系统</h1>
	<form id="loginForm" class="form-signin" action="index.html" method="post">
		<label class="input-label" for="username">登录名</label>
		<input type="text" id="username" name="username" class="input-block-level required" value="">
		<label class="input-label" for="password">密码</label>
		<input type="password" id="password" name="password" class="input-block-level required">
		<input class="btn btn-large btn-primary" type="submit" value="登 录">&nbsp;&nbsp;
		<label for="rememberMe" title="下次不需要再登录"><input type="checkbox" id="rememberMe" name="rememberMe"> 记住我</label>

	</form>
	<div class="footer">
		Copyright © 2015-2015 <a href="http://www.tanzhouedu.com/" target="_blank">权限管理系统</a> - Powered By Colin V0.0.1
	</div>
	<script src="./权限管理系统 登录_files/zoom.min.js" type="text/javascript"></script>

<div id="haloword-lookup" class="ui-widget-content ui-draggable"><div id="haloword-title"><span id="haloword-word"></span><a herf="#" id="haloword-pron" class="haloword-button" title="发音"></a><audio id="haloword-audio"></audio><div id="haloword-control-container"><a herf="#" id="haloword-add" class="haloword-button" title="加入单词表"></a><a herf="#" id="haloword-remove" class="haloword-button" title="移出单词表"></a><a href="http://localhost:8080/login;JSESSIONID=8c063142-ef1d-4b1d-ab15-fb0ecf1e6488#" id="haloword-open" class="haloword-button" title="查看单词详细释义" target="_blank"></a><a herf="#" id="haloword-close" class="haloword-button" title="关闭查询窗"></a></div><br style="clear: both;"></div><div id="haloword-content"></div></div></body></html>