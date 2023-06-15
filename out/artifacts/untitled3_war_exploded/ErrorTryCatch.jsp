<%--
  Created by IntelliJ IDEA.
  User: soo
  Date: 2023/06/14
  Time: 3:29 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    try {
        int myAge = Integer.parseInt((request.getParameter("age"))) + 10;
        out.println("10년 후 당신의 나이는" + myAge + "입니다.");
    }
    catch(Exception e){
        out.println("예외 발생: 매개변수 age가 null입니다.");
    }
%>
</body>
</html>
