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
        let url=location.href;
        let id=url.substr(url.lastIndexOf("=")+1);
        console.log(id);
        $.getJSON("http://localhost:8080/user/selectOne",{"id":id},function (data) {
            $("div").html("");
            $.each(data,function (f,v) {
                $("#user").append(f+":"+v+"<br>");
            })
        })
    }
</script>
</html>
