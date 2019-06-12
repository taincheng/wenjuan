<%--
  Created by IntelliJ IDEA.
  User: Old_man
  Date: 2019/5/11
  Time: 15:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix='fmt' %>
<script src="../bootstrap/js/jquery/2.0.0/jquery.min.js"></script>
<link href="../bootstrap/css/bootstrap/3.3.6/bootstrap.min.css" rel="stylesheet">
<script src="../bootstrap/js/bootstrap/3.3.6/bootstrap.min.js"></script>

<script>
    $(function () {
        function ishaveuser() {
            var userinfo = $("input#userinfo").val();
            if (userinfo.length == 0) {
                return false;
            }
            return true;
        }

        $("span#diaoc").click(function () {
            if (!ishaveuser()) {
                alert("登录后可以使用");
            }
        });
        $("span#tianjia").click(function () {
            if (!ishaveuser()) {
                alert("登录后可以使用");
            }
        });
    })
</script>
