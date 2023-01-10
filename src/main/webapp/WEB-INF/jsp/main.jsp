<%-- <%@page import="model.User, model.Mutter, java.util.List"%><!--  -->
 --%>
 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   <%--  <%
    User loginUser = (User) session.getAttribute("loginUser");
    List<Mutter> mutterList = (List<Mutter>) application.getAttribute("mutterList");
    String errorMsg = (String) request.getAttribute("errorMsg");
    %> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>つぶやき掲示板</title>
</head>
<body>
<h1>つぶやき掲示板メイン</h1>
<p><c:out value="${loginUser.name}" />さん、ログイン中<br>
<a href="/mutter-example/Logout">ログアウト</a>
</p>
<p><a href="/mutter-example/Main">更新</a></p>
<form action="/mutter-example/Main" method="post">
<input type="text" name="text">
<input type="submit" name="つぶやく">
</form>
<c:if test="${not empty errorMsg}">
 	<p>${errorMsg}</p>
</c:if>
<c:forEach var="mutter" items="${mutterList}">
	<p>
	<c:out value="${mutter.userName}" />:<c:out value="${mutter.text}" />
	</p>
</c:forEach>
<%-- <% if (errorMsg != null) { %>
	<p><%= errorMsg %>
<% } %>
<% for (Mutter mutter : mutterList) { %>
	<p><%= mutter.getUserName() %>:<%= mutter.getText() %></p>
<% } %> --%>
</body>
</html>