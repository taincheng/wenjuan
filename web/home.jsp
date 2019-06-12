<%--
  Created by IntelliJ IDEA.
  User: Old_man
  Date: 2019/5/11
  Time: 16:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="include_page/header.jsp"%>
<%@include file="include_page/items.jsp"%>
<div class="something col-xs-10">
    <p id="p"></p>
    <div class="jumbotron">
        <div class="container" align="center">
            <h2 class="text-info" style="font-family:宋体;font-weight:bold;font-size:49px">欢迎${user.username},使用问卷调查系统</h2>
            <br>
            <div class="text-muted">与世界分享你的回答</div>
            <br>
            <br>

                <c:if test="${empty user}">
                    <p><a role="button" href="login.jsp" class="btn btn-success">登录</a></p>
                </c:if>
                <c:if test="${!empty user}">
                    <p><a role="button" href="login.jsp" class="btn btn-success">切换</a></p>
                </c:if>
        </div>
    </div>

</div>

