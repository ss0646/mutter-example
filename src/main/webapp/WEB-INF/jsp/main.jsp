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
<h1>つぶやき掲示板メイン</h1>
<p><%= loginUser.getName() %>さん、ログイン中</p>
<a href="/mutter-example/Logout">ログアウト</a>
</body>
</html>