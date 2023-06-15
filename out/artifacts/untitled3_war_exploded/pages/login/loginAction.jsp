<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 2023-06-15
  Time: 오전 11:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>

<%
  // 예시를 위해 사용자 정보를 하드코딩으로 작성합니다.
  Map<String, String> users = new HashMap<>();
  users.put("john", "password123");
  users.put("jane", "hello456");

  // 사용자가 전송한 로그인 정보를 가져옵니다.
  String username = request.getParameter("username");
  String password = request.getParameter("password");

  // 입력된 사용자 정보가 일치하는지 확인합니다.
  if (users.containsKey(username) && users.get(username).equals(password)) {
    // 로그인 성공 시 세션에 사용자 정보를 저장합니다.
    session.setAttribute("username", username);
    response.sendRedirect("dashboard.jsp"); // 로그인 후 이동할 페이지
  } else {
    // 로그인 실패 시 에러 메시지를 표시합니다.
    out.println("Invalid username or password. Please try again.");
  }
%>