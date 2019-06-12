<%--
  Created by IntelliJ IDEA.
  User: Old_man
  Date: 2019/5/9
  Time: 14:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="include_page/header.jsp"%>
<html>
<head>
    <title>注册</title>
    <script>
        $(function () {
            <c:if test="${!empty msg}">
            $("span.errorMsg").html("${msg}");
            $("div.diverror").css("visibility", "visible");
            </c:if>
            $(".registerForm").submit(function () {
                if (0 == $(".username").val().length) {
                    $("span.errorMsg").html("请输入账号名");
                    $("div.diverror").css("visibility", "visible");
                    return false;
                }
                if (0 == $(".password").val().length) {
                    $("span.errorMsg").html("请输入密码");
                    $("div.diverror").css("visibility", "visible");
                    return false;
                }
                if (0 == $(".repassword").val().length) {
                    $("span.errorMsg").html("请输入重复密码");
                    $("div.diverror").css("visibility", "visible");
                    return false;
                }
                if ($(".password").val() != $(".repassword").val()) {
                    $("span.errorMsg").html("重复密码不一致");
                    $("div.diverror").css("visibility", "visible");
                    return false;
                }
                return true;
            });
            $("input").mouseup(function () {
                $("div.diverror").css("visibility","hidden");
            })
        });
    </script>
</head>
<body>
<div class="div1">
<form action="foreregister" method="post" class="registerForm">

    <div class="diverror">
        <span class="errorMsg text-warning"> </span>
    </div>
    <table align="center">
        <tr>
            <td width="25%"><span class="label label-primary" style="font-size: 17px">登录账号</span></td>
            <td width="75%"><input type="text" size="15" class="username form-control" placeholder="用户名" name="username"></td>
        </tr>
        <tr>
            <td><span class="label label-primary" style="font-size: 17px">登录密码</span></td>
            <td><input type="password" size="15" class="password form-control" placeholder="登录密码" name="password"></td>
        </tr>
        <tr>
            <td><span class="label label-primary" style="font-size: 17px">密码确认</span></td>
            <td><input type="password" size="15" class="repassword form-control" placeholder="密码确认"></td>
        </tr>
        <tr>
            <td colspan="2" class="registerButton" align="center">
                <a href="registerSuccess.jsp">
                    <button class="btn btn-success">提 交</button>
                </a>
            </td>
        </tr>

    </table>
</form>
</div>
</body>
<style>
    table{
        width: 25%;
        position: absolute;
        top:12%;
        left:25%;
    }
    td{
        padding: 15px;
    }
    div.div1{
        background: url(img/load.png) no-repeat;
        width: 100%;
        height: 100%;
        background-size: 100% 100%;
    }
    div.diverror{
        position: absolute;
        top:10%;
        left:35%;
    }
</style>
</html>
