<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 2023-06-15
  Time: 오후 12:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <title>Dashboard</title>
</head>
<body>
<h1>Welcome to the Dashboard</h1>
<p>You are logged in as: <%= session.getAttribute("username") %></p>
<!-- 여기에 대시보드 내용을 추가하세요 -->
</body>
</html>