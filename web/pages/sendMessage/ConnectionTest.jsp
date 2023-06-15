<%@ page import="DTO.MemberDTO" %>
<%@ page import="common.JDBConnect" %>
<%@ page import="common.DBConnPool" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>JDBC</title>
</head>
<body>
 <h2>커넥션 풀 테스</h2>
<%
  DBConnPool pool = new DBConnPool();
  pool.close();
%>
</body>
</html>
