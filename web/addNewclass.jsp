<%--
  Created by IntelliJ IDEA.
  User: Old_man
  Date: 2019/5/11
  Time: 20:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="include_page/header.jsp" %>
<%@include file="include_page/items.jsp" %>
<script>
    $(function () {
        $("button.btn-warning").click(function () {
            alert("ARE YOU SHARE");
            $("input#dckt").val("");
            $("input#dcsj").val("");
            $("textarea#dcjj").val("");
        });
        $("button.btn").click(function () {
            window.location = "addNewclass.jsp";
        });
        $("button#submit").click(function () {
            var page = "admin_Contorclass_addNewclass";
            var dckt = $("input#dckt").val().trim();
            var dcsj = $("input#dcsj").val().trim();
            var dcjj = $("textarea#dcjj").val().trim();

            if(dckt.length == 0 || dcsj.length == 0 || dcjj.length == 0){
                alert("不可留空");
                return false;
            }
            $.post(
                page,
                {"dckt":dckt,"dcsj":dcsj,"dcjj":dcjj},
                function () {
                    $("input#dckt").val("");
                    $("input#dcsj").val("");
                    $("textarea#dcjj").val("");
                    alert("添加成功");
                }
            )
        })
    })
</script>
<div class="something col-xs-10">
<table class="table table-bordered">
    <tbody align="center">
    <tr>
        <td><span class="text-muted">调查课题</span></td>
        <td><input class="form-control" id="dckt" type="text" name="dckt"></td>
    </tr>
    <tr>
        <td><span class="text-muted">调查时间(单位:分钟)</span></td>
        <td><input class="form-control" id="dcsj" type="text" name="dcsj"></td>
    </tr>
    <tr>
        <td><span class="text-muted">调查简介</span></td>
        <td><textarea class="form-control" id="dcjj" clos="10" rows="8" name="dcjj"></textarea></td>
    </tr>
    <tr>
        <td><span class="text-muted">操作</span></td>
        <td>
            <button id="submit" class="btn btn-primary">提交</button>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <button class="btn btn-warning">重置</button>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <button class="btn">返回</button>
        </td>
    </tr>
    </tbody>
</table>
</div>
