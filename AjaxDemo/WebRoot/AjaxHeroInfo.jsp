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
<!-- 
需求分析
	1 在当前页面内显示查询结果，考虑ajax
	2 创建ajax函数
	3 调用ajax函数发送请求到UserServlet
	4 调用业务层获取对应数据

 -->
<!-- 声明js代码 -->
<script type="text/javascript">
	function getHeroInfo() {
		//获取用户请求数据
		var name = document.getElementById("uname").value;
		//创建ajax引擎对象
		var ajax;
		ajax = new XMLHttpRequest();
		//覆写onreadystatechange
		ajax.onreadystatechange = function() {
			//判断ajax状态码
			if (ajax.readyState == 4) {
				//判断响应状态码
				if (ajax.status == 200) {
					//获取响应数据
					var result = ajax.responseText;
					alert(result);
					eval("var u =" + result);
					//处理响应数据
					var ta = document.getElementById("ta");
					var tr = ta.insertRow(1);
					var cell0 = tr.insertCell(0);
					cell0.innerHTML = u.uid;
					var cell1 = tr.insertCell(1);
					cell1.innerHTML = u.uname;
					var cell2 = tr.insertCell(2);
					cell2.innerHTML = u.price;
					var cell3 = tr.insertCell(3);
					cell3.innerHTML = u.postion;
					var cell4 = tr.insertCell(4);
					cell4.innerHTML = u.skill;
				}
			}
		}
		//发送请求
		ajax.open("post", "user");
		ajax.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
		ajax.send("name=" + name);
	}
</script>
<!-- css代码 -->
<style type="text/css">
.tftable {
	font-size: 12px;
	color: #333333;
	width: 100%;
	border-width: 1px;
	border-color: #a9a9a9;
	border-collapse: collapse;
}

.tftable th {
	font-size: 12px;
	background-color: #b8b8b8;
	border-width: 1px;
	padding: 8px;
	border-style: solid;
	border-color: #a9a9a9;
	text-align: left;
}

.tftable tr {
	background-color: #ffffff;
}

.tftable td {
	font-size: 12px;
	border-width: 1px;
	padding: 8px;
	border-style: solid;
	border-color: #a9a9a9;
}
</style>
</head>

<body>
	<h3>welcome to hero store !!</h3>
	<hr>
	The name of Hero:
	<input type="text" name="uname" value="" id="uname" />
	<input type="button" value="FindHero" onclick="getHeroInfo()" />
	<hr>

	<table id="ta" class="tftable" border="1px">
		<tr>
			<th>ID</th>
			<th>Name</th>
			<th>Price</th>
			<th>Position</th>
			<th>Skill</th>
		</tr>
	</table>
</body>
</html>
