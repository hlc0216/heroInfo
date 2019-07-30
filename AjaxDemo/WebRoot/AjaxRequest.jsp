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

	function ajaxRequest() {
		//获取请求数据
		var name = "name=" + document.getElementById("name").value;
		var pwd = "pwd=" + document.getElementById("pwd").value;
		//创建ajax引擎对象
		var ajax;
		if (window.XMLHttpRequest) {
			ajax = new XMLHttpRequest();
		} else if (window.ActiveXObject) {
			ajax = new ActiveXObject("Msxml2.XMLHTTP");
		}
		//覆写onreadystatechange函数
		ajax.onreadystatechange = function() {
			//判断ajax状态码
			if (ajax.readyState == 4) {
				//判断响应状态码
				if (ajax.status == 200) {
				}
				//获取响应内容
				var result = ajax.responseText;
				//处理响应内容
				alert(result);
			}
		}
		//发送请求
		//get请求:请求实体拼接再UR后面
		//ajax.open("get", "ajax?" + name + "&"+pwd); //一般是写成这种拼接形式
		//ajax.send(null);
		//post请求：请求实体需要单独的发送
		ajax.open("post","ajax");
		ajax.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
		ajax.send(name+"&"+pwd);
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
	<h3>welcome to Ajax !!</h3>
	<hr>
	<input type="text" name="name" id="name" value="" /> <br/>
	<input type="password" name="pwd" id="pwd" value=""><br/>
	<input type="button" value="测试" onclick="ajaxRequest()" />
	<div id="showdiv"></div>
</body>
</html>
