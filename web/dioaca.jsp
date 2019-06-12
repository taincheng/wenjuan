<%--
  Created by IntelliJ IDEA.
  User: Old_man
  Date: 2019/5/11
  Time: 18:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@include file="include_page/header.jsp" %>
<%@include file="include_page/items.jsp" %>
<script>
    $(function () {
        $("input#input_kcmc").val($("input.input-td-name").val());
        $("input#input_kcsj").val($("input.input-td-time").val());
        $("textarea#textarea_kcjj").val($("input.input-td-dcjj").val());

        $("div.modal-footer button").click(function () {
            var id = $("input.input-td-id").val();
            var kcmc = $("input#input_kcmc").val();
            var kcsj = $("input#input_kcsj").val();
            var kcjj = $("textarea#textarea_kcjj").val();
            var page_start = $("input.input-td-page").val();
            var page = "admin_Contorclass_edit";
            $.post(
                page,
                {"id": id, "kcmc": kcmc, "kcsj": kcsj, "kcjj": kcjj, "page.start": page_start},
                function (data) {
                    if (data == "success") {
                        window.location = "admin_Contorclass_diaoca?page.start=" + page_start;
                    }
                }
            )
        });
        $("button.b_chakan").click(function () {
            var id = $("input.input-td-id").val();
            alert(id);
            $("h4.modal-title").text("课程查看");
            $("input.input_edit").attr("readonly", "true");
            $("textarea.input_edit").attr("readonly", "true");
            $("div.modal-footer").addClass("display");
        });
        $("button.b_xiugai").click(function () {
            $("h4.modal-title").text("课程编辑");
            $("input.input_edit").removeAttr("readonly");
            $("textarea.input_edit").removeAttr("readonly");
            $("div.modal-footer").removeClass("display");
        });

    })
</script>
<div class="something col-xs-10">
    <div>
        <span class="label label-info" style="font-size: 16px">课题: &nbsp;&nbsp;</span>
        <input class="form-control" type="text" style="display: inline;width: auto">
        <button class="btn">搜索</button>
    </div>
    <br>
    <div>
        <table class="table table-striped table-bordered table-hover  table-condensed" align="center" width="100%">
            <thead align="center">
            <th width="10%">课题</th>
            <th width="10%">调查时间</th>
            <th width="10%">是否使用</th>
            <th width="20%">添加时间</th>
            <th width="50%">操作</th>
            </thead>
            <tbody>
            <c:forEach items="${items}" var="item" varStatus="st">

                <input class="input-td-id" type="text" value="${item.id}" style="display: none">
                <%--<input class="input-td-name" type="text" value="${item.classname}" style="display: none">--%>
                <%--<input class="input-td-time" type="text" value="${item.classtime}" style="display: none">--%>
                <%--<input class="input-td-dcjj" type="text" value="${item.introduction}" style="display: none">--%>
                <input class="input-td-page" type="text" value="${page.start}" style="display: none">

                <tr>
                    <td>${item.classname}</td>
                    <td>${item.classtime}</td>
                    <td>${item.isuse eq 0 ? "未使用" : "已使用"}</td>
                    <td>${item.addtime}</td>
                    <td>
                        <a href="#">
                            <button type="button" class="b_chakan btn btn-info" data-toggle="modal"
                                    data-target="#myModal">查看
                            </button>
                        </a>
                        <a href="#">
                            <button type="button" class="b_xiugai btn btn-primary" data-toggle="modal"
                                    data-target="#myModal">修改
                            </button>
                        </a>
                        <a href="admin_Contorclass_delete?classid=${item.id}&page.start=${page.start}">
                            <button class="btn btn-danger">删除</button>
                        </a>
                        <a href="admin_Contorclass_isuse?classid=${item.id}&isuse=${item.isuse}&page.start=${page.start}">
                            <button class="btn btn-danger">${item.isuse eq 0 ? "启用" : "停用"}</button>
                        </a>
                        <a href="#">
                            <button class="btn btn-primary">调查题目管理</button>
                        </a>
                        <a href="#">
                            <button class="btn btn-info">调查数据查询</button>
                        </a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
    <%--查看按钮--%>
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button data-dismiss="modal" class="close" type="button"><span aria-hidden="true">×</span><span
                            class="sr-only">Close</span></button>
                    <h4 class="modal-title">课题查看</h4>
                </div>
                <div class="modal-body">
                    <p>课题名称</p>
                    <input type="text" id="input_kcmc" class="input_edit form-control" value="">
                    <p>调查时间</p>
                    <input id="input_kcsj" type="text" class="input_edit form-control" value="">
                    <p>调查简介</p>
                    <textarea id="textarea_kcjj" class="input_edit form-control" value=""></textarea>
                </div>
                <div class="modal-footer">
                    <button data-dismiss="modal" class="btn btn-default" type="button">确定</button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div>
    <%@include file="include_page/adminPage.jsp" %>
</div>

