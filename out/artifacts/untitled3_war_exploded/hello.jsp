<%--
  Created by IntelliJ IDEA.
  User: soo
  Date: 2023/06/14
  Time: 1:23 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page  import ="java.text.SimpleDateFormat" %>
<%@ page  import ="java.util.Date" %>

<html>
<head>
    <title></title>
</head>
<body>
<%
    Date today = new Date();
    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-mm-dd");
    String todayStr = dateFormat.format(today);
    out.println("오늘 날짜 : " + todayStr);
%>
</body>
</html>
