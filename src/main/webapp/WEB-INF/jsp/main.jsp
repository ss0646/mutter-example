<%@page import="model.User, model.Mutter, java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    User loginUser = (User) session.getAttribute("loginUser");
    List<Mutter> mutterList = (List<Mutter>) application.getAttribute("mutterList");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>つぶやき掲示板</title>
</head>
<body>
<h1>つぶやき掲示板メイン</h1>
<p><%= loginUser.getName() %>さん、ログイン中
<a href="/mutter-example/Logout">ログアウト</a>
</p>
<p><a href="/mutter-example/Main">更新</a></p>
<form action="/mutter-example/Main" method="post">
<input type="text" name="text">
<input type="submit" name="つぶやく">
</form>
<% for (Mutter mutter : mutterList) { %>
	<p><%= mutter.getUserName() %>:<%= mutter.getText() %></p>
<% } %>
</body>
</html>