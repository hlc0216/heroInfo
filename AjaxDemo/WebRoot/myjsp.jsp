<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<script type="text/javascript">
	function getData() {
		//获取元素对象
		var showdiv = document.getElementById("showdiv");
		//修改元素内容
		//写了很多代码
		showdiv.innerHTML = "你看！ div里面出现了汉字。。";
	}
</script>
<style type="text/css">
#showdiv {
	border: solid 1px;
	width: 200px;
	height: 100px;
}
</style>
</head>

<body>
	<h3>欢迎来到Ajax</h3>
	<hr>
	<input type="button" value="测试" onclick="getData()" />
	<div id="showdiv"></div>

</body>
</html>
