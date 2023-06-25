<%--
  Created by IntelliJ IDEA.
  User: soo
  Date: 2023/06/25
  Time: 3:17 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="email.emailPromotionDAO" %>

<html>
<head>
    <title>Title</title>
</head>
<body>
  <div>상품프로모션 페이지</div>
  <%
      emailPromotionDAO dao = new emailPromotionDAO();
      int viewCount = dao.selectMessage();
  %>
  <div>조회수
      <%=
  viewCount
  %></div>
</body>
</html>
