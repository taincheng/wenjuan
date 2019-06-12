<%--
  Created by IntelliJ IDEA.
  User: Old_man
  Date: 2019/5/11
  Time: 15:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="title container">
    <input type="text" id="userinfo" style="display: none" value="${user.username}">
    <h2 class="text-info" align="center">问卷调研管理系统</h2>
    <c:choose>
        <c:when test="${!empty user}">
            <span class="welcome">欢迎您: ${user.username} &nbsp;&nbsp;&nbsp; <a href="home.jsp">主页</a></span>
        </c:when>
        <c:otherwise>
            <span class="welcome">你好游客 <a href="login.jsp">登录</a></span>
        </c:otherwise>
    </c:choose>
</div>
<div class="items list-group col-xs-2 ">
    <ul class="list-group">
        <li class="list-group-item" style="background-color:greenyellow">调查课题管理</li>
        <ul class="list-group">
            <li class="list-group-item"><span class="item" id="diaoc">
                <a href="admin_Contorclass_diaoca">调查课题管理</a></span></li>
            <li class="list-group-item"><span class="item" id="tianjia">
                <a href="addNewclass.jsp">添加新课题</a></span></li>
        </ul>
        <li class="list-group-item" style="background-color:greenyellow">留言信息管理</li>
        <ul class="list-group">
            <li class="list-group-item">留言信息管理</li>
        </ul>
        <li class="list-group-item" style="background-color:greenyellow">注册用户管理</li>
        <ul class="list-group">
            <li class="list-group-item">注册用户管理</li>
        </ul>
        <li class="list-group-item" style="background-color:greenyellow">调查记录查询</li>
        <ul class="list-group">
            <li class="list-group-item">调查记录查询</li>
        </ul>
        <li class="list-group-item" style="background-color:greenyellow">修改个人资料</li>
        <ul class="list-group">
            <li class="list-group-item">修改个人资料</li>
        </ul>
    </ul>
</div>



<style>
    div.title {
        background-color: greenyellow;
        width: 100%;
    }

    div.items {
        margin: 5px 0px;
        text-align: center;
    }

    div.container {
        width: 100%;
    }

    div.something {
        margin: 5px 0px;
        height: 87%;
    }

    span.welcome {
        position: relative;
        left: 30px;
    }

    h2 {
        font-family: 宋体;
        font-weight: bold;
        font-size: 49px;
    }
    .display{
        display: none;
    }
</style>
