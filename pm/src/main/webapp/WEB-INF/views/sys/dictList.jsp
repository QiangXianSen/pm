<%@ page import="com.tanzhouedu.pm.utils.PageUtils" %>
<%@ page import="com.github.pagehelper.PageInfo" %>
<%@ page import="com.tanzhouedu.pm.entity.Dict" %>
<%@page pageEncoding="utf-8" language="java" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>字典管理</title>

    <%@ include file="/WEB-INF/views/include/head.jsp" %>
    <%--<script type="text/javascript">var ctx = '', ctxStatic = '/static';</script>--%>
    <script type="text/javascript">
        function page(n, s) {
            $("#pageNum").val(n);
            $("#pageSize").val(s);
            $("#searchForm").submit();
            return false;
        }
    </script>
</head>
<body>
<ul class="nav nav-tabs">
    <li class="active"><a href="dictList.jsp">字典列表</a></li>

    <li><a href="${ctx}/sys/dict/toEdit">字典添加</a></li>

</ul>
<form:form id="searchForm" modelAttribute="dict" action="${ctx}/sys/dict/list"
           method="post" cssClass="breadcrumb form-search">
    <input id="pageNum" name="pageNum" type="hidden" value="${pageInfo.pageNum}"/>
    <input id="pageSize" name="pageSize" type="hidden" value="${pageInfo.pageSize}"/>
    <label>类型：</label>
    <form:select path="type" cssClass="input-medium" id="type">
        <form:option value="" label="所有类型" />
        <form:options items="${typeList}" />
    </form:select>
    &nbsp;&nbsp;<label>描述 ：</label>
    <form:input path="description" cssClass="input-medium" maxlength="50" id="description" />
    &nbsp;<input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/>
</form:form>

<div id="messageBox" class="alert alert-${msg.type}">
    <button data-dismiss="alert" class="close">x</button>
    ${msg.content}

</div>

<script type="text/javascript">top.$.jBox.closeTip();</script>

<table id="contentTable" class="table table-striped table-bordered table-condensed">
    <thead>
    <tr>
        <th>键值</th>
        <th>标签</th>
        <th>类型</th>
        <th>描述</th>
        <th>排序</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${pageInfo.list}" var="dict">
        <tr>
            <td>${dict.value}</td>
            <td><a href="${ctx}/sys/dict/toEdit?id=${dict.id}">${dict.label}</a></td>
            <td><a href="javascript:"
                   onclick="$('#type').val('${dict.type}');$('#pageNum').val(1);//点击类型时的页码控制
                           $('#searchForm').submit();return false;">${dict.type}</a>
            </td>
            <td>${dict.description}</td>
            <td>${dict.sort}</td>

            <td>
                <a href="${ctx}/sys/dict/toEdit?id=${dict.id}">修改</a>
                <a href="#" onclick="return confirmx('确认要删除该字典吗？', this.href)">删除</a>
                <a href="dictEdit.jsp">添加键值</a>
            </td>

        </tr>
    </c:forEach>
    </tbody>
</table>
<div class="pagination">
    <%--<ul>--%>
        <%--<li class="disabled"><a href="javascript:">&#171; 上一页</a></li>--%>
        <%--<li class="active"><a href="javascript:">1</a></li>--%>
        <%--<li class="disabled"><a href="javascript:">下一页 &#187;</a></li>--%>
        <%--<li class="disabled controls"><a href="javascript:">当前 <input type="text" value="1"--%>
                                                                      <%--onkeypress="var e=window.event||this;var c=e.keyCode||e.which;if(c==13)page(this.value,15,'');"--%>
                                                                      <%--onclick="this.select();"/> / <input type="text"--%>
                                                                                                          <%--value="15"--%>
                                                                                                          <%--onkeypress="var e=window.event||this;var c=e.keyCode||e.which;if(c==13)page(1,this.value,'');"--%>
                                                                                                          <%--onclick="this.select();"/>--%>
            <%--条，共 0 条</a></li>--%>
    <%--</ul>--%>
    <%--<div style="clear:both;"></div>--%>
    <%--<%=PageUtils.pageStr((PageInfo)request.getAttribute("pageInfo")) %>--%>
    ${pm:pageStr(pageInfo)}
</div>
</body>
</html>