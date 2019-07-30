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
		//创建ajax引擎对象
		var ajax;
		if (window.XMLHttpRequest) { //主流浏览器都支持
			ajax = new XMLHttpRequest();
		} else if (window.ActiveXObject) { //ie低版本浏览器
			ajax = new ActiveXObject("Msxml2.XMLHTTP");
		}
		//覆写onreadystatement函数
		ajax.onreadystatechange = function() {
			//判断Ajax状态码
			if (ajax.readyState == 4) {
				//判断响应状态码
				if(ajax.status==200){
				//获取响应内容
				var result = ajax.responseText;
				//处理响应对象
				//获取元素对象
				var showdiv = document.getElementById("showdiv");
				showdiv.innerHTML = result;
				}else if(ajax.status==404){
					//获取元素对象
					var showdiv = document.getElementById("showdiv");
					showdiv.innerHTML="请求资源不存在";
				}else if(ajax.status==500){
					//获取元素对象
					var showdiv = document.getElementById("showdiv");
					showdiv.innerHTML="服务器繁忙";
				}
				
			}else{
				var showdiv = document.getElementById("showdiv");
				showdiv.innerHTML="<img src='img/1.gif' >";
			}
		}
		//发送请求
		ajax.open("get", "ajax","false");//默认是true,即异步
		ajax.send(null);
		alert("哈哈哈");
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
	<input type="button" value="测试" onclick="getData()" />
	<div id="showdiv"></div>
</body>
</html>
