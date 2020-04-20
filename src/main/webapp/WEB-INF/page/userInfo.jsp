<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/4/17
  Time: 14:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<script src="https://cdn.staticfile.org/jquery/1.10.2/jquery.min.js"></script>
<head>
    <title>user info</title>
</head>
<body>

<div id="user">

</div>
<button onclick="load();" >加载数据</button>
</body>

<script>
    function load(){
        $.getJSON("http://localhost:8080/user/selectOne",{"id":1},function (data) {
            $("div").html("");
            $.each(data,function (i,filed) {
                $("#user").append(i+":"+filed+"<br>");
            })
        })
    }
</script>
</html>
