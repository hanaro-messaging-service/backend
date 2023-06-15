<%--
  Created by IntelliJ IDEA.
  User: soo
  Date: 2023/06/14
  Time: 3:54 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%!
public int add(int num1, int num2) {
    return num1 + num2;
}
%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    int result = add(10,20);
%>
덧셈 결과 1: <%= result %> <br/>
덧셈 결과 2: <%= add(30,40) %>
</body>
</html>
