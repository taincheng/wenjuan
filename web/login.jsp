<%--
  Created by IntelliJ IDEA.
  User: Old_man
  Date: 2019/5/7
  Time: 14:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@include file="include_page/header.jsp"%>
<html>
<head>
    <title>UserLogin</title>
    <script>
        $(function () {
            <c:if test="${!empty msg}">
            $("span.errmeg").html("${msg}");
            $("div.loginerror").show();
            </c:if>

            $("button.reg").click(function () {
                alert("dsf")
            });
            //对空输入框判定
            $("input#username").blur(function () {
               if(0 == $("#username").val().trim()){
                   $("span.errmeg").html("账号不能为空");
                   $("div.loginerror").show();
               }
            });
            $("input#password").blur(function () {
                if(0 == $("#password").val().trim()){
                    $("span.errmeg").html("密码不能为空");
                    $("div.loginerror").show();
                }
            });
            //Ajax后台验证账号密码
            $("input#submit").click(function () {
                var page = "forelogin";
                var username = $("input#username").val();
                var password = $("input#password").val();
                if (0 == username.length || 0 == password.length) {
                    $("span.errmeg").html("请输入账号密码");
                    $("div.loginerror").show();
                    return false;
                }
                $.post(
                    page,
                    {"username": username, "password": password},
                    function (date) {
                        if(date == "no"){
                            alert("账号或密码错误");
                        }else{
                            window.location = "home.jsp";
                        }
                    }
                );
            });

            $("input").keyup(function () {
                $("div.loginerror").hide();
            });
        })
    </script>
</head>
<body>
<div class="backgound-img">
        <div class="div1" >
            <div class="loginerror">
                <span class="errmeg text-warning">  </span>
            </div>
        <table>
            <form action="forelogin" method="post">
            <tr>
                <td width="30%"><span class="label label-primary" style="font-size: 17px">用户名</span></td>
                <td width="70%"><input type="text" size="20" id="username" class="form-control" name="username" placeholder="请输入账号"></td>
            </tr>
            <tr>
                <td><span class="label label-primary" style="font-size: 17px">密&nbsp;&nbsp;&nbsp;&nbsp;码</span></td>
                <td><input type="password" size="20" id="password" class="form-control" name="password" placeholder="请输入密码"></td>
            </tr>
            <tr>
                <td align="center" colspan="2">
                    <input type="submit" id="submit" class="btn btn-success" value="登陆">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <a class="a_button" href="register.jsp"><button class="btn btn-success"><a href="register.jsp">注册</a></button></a>
                </td>
            </tr>
            </form>
        </table>
        </div>
</div>
</body>
<style>
    div.backgound-img {
        background: url(img/load.png) no-repeat;
        width: 100%;
        height: 100%;
        background-size: 100% 100%;
    }
    div.loginerror{
        position: absolute;
        top: 18%;
        left: 35%;
    }
    table{
        table-layout: auto;
        position: absolute;
        top: 20%;
        left: 30%;
        width:20%;
    }
    td{
        padding: 10px;
    }
    div.div1{
        top: 30px;
    }
    input{
        font-size: 18px;
    }
</style>
</html>
