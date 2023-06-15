<%--
  Created by IntelliJ IDEA.
  User: soo
  Date: 2023/06/14
  Time: 3:46 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ include file ="includeFile.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <%
    out.println("오늘 날짜 : " + today);
    out.println("<br/>");
    out.println("내일 날짜 : " + tomorrow);
    %>
</body>
</html>
