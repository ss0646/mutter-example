<%@page import="model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    User loginUser = (User) session.getAttribute("loginUser");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>つぶやき掲示板</title>
</head>
<body>
<h1>つぶやき掲示板ログイン</h1>
<% if (loginUser != null) { %>
	<p>ログインに成功しました</p>
	<p>ようこそ<%= loginUser.getName() %>さん</p>
	<a href="/mutter-example/Main">つぶやき投稿・閲覧へ</a>
<% } else { %>
	<p>ログインに失敗しました</p>
	<a href="/mutter-example/">TOPへ</a>
<% } %>
</body>
</html>