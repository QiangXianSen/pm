<%@page pageEncoding="utf-8" language="java" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<title>用户管理</title>
	<%@ include file="/WEB-INF/views/include/head.jsp"%>
	<script type="text/javascript">

		function page(n,s){
			if(n) $("#pageNo").val(n);
			if(s) $("#pageSize").val(s);
			$("#searchForm").attr("action","/sys/user/list");
			$("#searchForm").submit();
	    	return false;
	    }
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="userList.jsp">用户列表</a></li>
		<li><a href="userAdd.html">用户添加</a></li>
	</ul>
	<form id="searchForm" class="breadcrumb form-search " action="#" method="post">
		<input id="pageNo" name="pageNo" type="hidden" value="1"/>
		<input id="pageSize" name="pageSize" type="hidden" value="15"/>
<input id="orderBy" name="orderBy" type="hidden" value=""/>

<script type="text/javascript">
	$(document).ready(function() {
		var orderBy = $("#orderBy").val().split(" ");
		$(".sort-column").each(function(){
			if ($(this).hasClass(orderBy[0])){
				orderBy[1] = orderBy[1]&&orderBy[1].toUpperCase()=="DESC"?"down":"up";
				$(this).html($(this).html()+" <i class=\"icon icon-arrow-"+orderBy[1]+"\"></i>");
			}
		});
		$(".sort-column").click(function(){
			var order = $(this).attr("class").split(" ");
			var sort = $("#orderBy").val().split(" ");
			for(var i=0; i<order.length; i++){
				if (order[i] == "sort-column"){order = order[i+1]; break;}
			}
			if (order == sort[0]){
				sort = (sort[1]&&sort[1].toUpperCase()=="DESC"?"ASC":"DESC");
				$("#orderBy").val(order+" DESC"!=order+" "+sort?"":order+" "+sort);
			}else{
				$("#orderBy").val(order+" ASC");
			}
			page();
		});
	});
</script>
		<ul class="ul-form">
			<li><label>所属公司：</label>
<div class="input-append">
	<input id="companyId" name="company.id" class="input-small" type="hidden" value=""/>
	<input id="companyName" name="company.name" readonly="readonly" type="text" value="" data-msg-required=""
		class="input-small" style=""/><a id="companyButton" href="javascript:" class="btn  " style="">&nbsp;<i class="icon-search"></i>&nbsp;</a>&nbsp;&nbsp;
</div>
<script type="text/javascript">
	$("#companyButton, #companyName").click(function(){
		// 是否限制选择，如果限制，设置为disabled
		if ($("#companyButton").hasClass("disabled")){
			return true;
		}
		// 正常打开	
		top.$.jBox.open("iframe:/tag/treeselect?url="+encodeURIComponent("/sys/office/treeData?type=1")+"&module=&checked=&extId=&isAll=", "选择公司", 300, 420, {
			ajaxData:{selectIds: $("#companyId").val()},buttons:{"确定":"ok", "清除":"clear", "关闭":true}, submit:function(v, h, f){
				if (v=="ok"){
					var tree = h.find("iframe")[0].contentWindow.tree;//h.find("iframe").contents();
					var ids = [], names = [], nodes = [];
					if ("" == "true"){
						nodes = tree.getCheckedNodes(true);
					}else{
						nodes = tree.getSelectedNodes();
					}
					for(var i=0; i<nodes.length; i++) {//
						ids.push(nodes[i].id);
						names.push(nodes[i].name);//
						break; // 如果为非复选框选择，则返回第一个选择  
					}
					$("#companyId").val(ids.join(",").replace(/u_/ig,""));
					$("#companyName").val(names.join(","));
				}//
				else if (v=="clear"){
					$("#companyId").val("");
					$("#companyName").val("");
                }//
				if(typeof companyTreeselectCallBack == 'function'){
					companyTreeselectCallBack(v, h, f);
				}
			}, loaded:function(h){
				$(".jbox-content", top.document).css("overflow-y","hidden");
			}
		});
	});
</script></li>
			<li><label>登录名：</label><input id="loginName" name="loginName" class="input-medium" type="text" value="" maxlength="50"/></li>
			<li class="clearfix"></li>
			<li><label>所属部门：</label>
<div class="input-append">
	<input id="officeId" name="office.id" class="input-small" type="hidden" value=""/>
	<input id="officeName" name="office.name" readonly="readonly" type="text" value="" data-msg-required=""
		class="input-small" style=""/><a id="officeButton" href="javascript:" class="btn  " style="">&nbsp;<i class="icon-search"></i>&nbsp;</a>&nbsp;&nbsp;
</div>
<script type="text/javascript">
	$("#officeButton, #officeName").click(function(){
		// 是否限制选择，如果限制，设置为disabled
		if ($("#officeButton").hasClass("disabled")){
			return true;
		}
		// 正常打开	
		top.$.jBox.open("iframe:/tag/treeselect?url="+encodeURIComponent("/sys/office/treeData?type=2")+"&module=&checked=&extId=&isAll=", "选择部门", 300, 420, {
			ajaxData:{selectIds: $("#officeId").val()},buttons:{"确定":"ok", "清除":"clear", "关闭":true}, submit:function(v, h, f){
				if (v=="ok"){
					var tree = h.find("iframe")[0].contentWindow.tree;//h.find("iframe").contents();
					var ids = [], names = [], nodes = [];
					if ("" == "true"){
						nodes = tree.getCheckedNodes(true);
					}else{
						nodes = tree.getSelectedNodes();
					}
					for(var i=0; i<nodes.length; i++) {//
						if (nodes[i].isParent){
							top.$.jBox.tip("不能选择父节点（"+nodes[i].name+"）请重新选择。");
							return false;
						}//
						ids.push(nodes[i].id);
						names.push(nodes[i].name);//
						break; // 如果为非复选框选择，则返回第一个选择  
					}
					$("#officeId").val(ids.join(",").replace(/u_/ig,""));
					$("#officeName").val(names.join(","));
				}//
				else if (v=="clear"){
					$("#officeId").val("");
					$("#officeName").val("");
                }//
				if(typeof officeTreeselectCallBack == 'function'){
					officeTreeselectCallBack(v, h, f);
				}
			}, loaded:function(h){
				$(".jbox-content", top.document).css("overflow-y","hidden");
			}
		});
	});
</script></li>
			<li><label>姓&nbsp;&nbsp;&nbsp;名：</label><input id="name" name="name" class="input-medium" type="text" value="" maxlength="50"/></li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询" onclick="return page();"/>

			<li class="clearfix"></li>
		</ul>
	</form>
<script type="text/javascript">top.$.jBox.closeTip();</script>

	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead><tr><th>所属公司</th><th>所属部门</th><th class="sort-column login_name">登录名</th><th class="sort-column name">姓名</th><th>电话</th><th>手机</th><th>操作</th></tr></thead>
		<tbody>
		
			<tr>
				<td>湖南省总公司</td>
				<td>公司领导</td>
				<td><a href="#">admin</a></td>
				<td>系统超级管理员</td>
				<td></td>
				<td>18888888888</td>
				<td>
    				<a href="userAdd.html">修改</a>
					<a href="#" onclick="return confirmx('确认要删除该用户吗？', this.href)">删除</a>
				</td>
			</tr>
		
		</tbody>
	</table>
	<div class="pagination"><ul>
<li class="disabled"><a href="javascript:">&#171; 上一页</a></li>
<li class="active"><a href="javascript:">1</a></li>
<li class="disabled"><a href="javascript:">下一页 &#187;</a></li>
<li class="disabled controls"><a href="javascript:">当前 <input type="text" value="1" onkeypress="var e=window.event||this;var c=e.keyCode||e.which;if(c==13)page(this.value,15,'');" onclick="this.select();"/> / <input type="text" value="15" onkeypress="var e=window.event||this;var c=e.keyCode||e.which;if(c==13)page(1,this.value,'');" onclick="this.select();"/> 条，共 0 条</a></li>
</ul>
<div style="clear:both;"></div></div>
</body>
</html>