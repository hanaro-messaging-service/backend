<%--
  Created by IntelliJ IDEA.
  User: soo
  Date: 2023/06/14
  Time: 3:43 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import ="java.time.LocalDateTime" %>
<%@ page import ="java.time.LocalDate" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    LocalDate today = LocalDate.now();
    LocalDateTime tomorrow = LocalDateTime.now().plusDays(1);
%>