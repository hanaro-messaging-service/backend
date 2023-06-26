<%--
  Created by IntelliJ IDEA.
  User: soo
  Date: 2023/06/25
  Time: 4:08 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="messageHistory.messageHistoryDAO" %>
<%@ page import="messageHistory.messageHistoryDTO" %>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.Map"%>
<%@ page import="java.util.List" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/pages/messageList/messageList.css" >
</head>
<body>
<main>
    <section class="sidebar">
        <div class="sidebar-main">
            메시지
        </div>
        <div class="sidebar-submain">전송</div>
        <div class="sidebar-content"><li>전체 안내 메시지 전송</li></div>
        <div class="sidebar-content"><li><a href="/pages/sendMessage/voicefishingNotificationMessage/voicefishingNotificationMessage.jsp">보이스피싱 예방 안내 메시지 전송</a></li></div>
        <div class="sidebar-content"><li><a href="/pages/sendMessage/productPromotionMessage.jsp">수신 상품 프로모션 메시지 전송</a></li></div>
        <div class="sidebar-content"><li><a href="/pages/sendMessage/appPromotionMessage/appPromotionMessage.jsp">어플 프로모션 메시지 전송</a></li></div>
        <div class="sidebar-content"><li><a href="/pages/sendMessage/overdueNotificationMessage/overdueNotificationMessage.jsp">상황 관리 안내 메시지 전송</a></li></div>
        <div class="sidebar-submain">관리</div>
        <div class="sidebar-content"><li>전체 안내 메시지 관리</li></div>
        <div class="sidebar-content"><li><a href="/pages/manageMessage/voicefishingNotificationManage/voicefishingNotificationManage.jsp"> 보이스피싱 예방 안내 메시지 관리</a></li></div>
        <div class="sidebar-content"><li><a href="/pages/manageMessage/productPromotionManage/productPromotionManage.jsp">수신 상품 프로모션 메시지 관리</a></li></div>
        <div class="sidebar-content"><li><a href="/pages/manageMessage/appPromotionManage/appPromotionManage.jsp">어플 프로모션 메시지 관리</a></li></div>
        <div class="sidebar-content"><li ><a href="/pages/manageMessage/overdueNotificationManage/overdueNotificationManage.jsp">상황 관리 안내 메시지 관리</a></li></div>
    </section>
    <section class="mainComponent">
        <div class="mainComponent-header">
            <div class="mainComponent-header-text">메세지 발송내역</div>
        </div>
        <div class="messageComponent">
            <div class="messageComponent-topbar">
                <div class="messageComponent-title">제목</div>
                <div class="messageComponent-category">카테고리</div>
                <div class="messageComponent-date">발송 시각</div>
                <div class="messageComponent-count">갯수</div>
                <div class="messageComponent-content">내용</div>
            </div>

                <%
                    // DAO 객체 생성
                    messageHistoryDAO dao = new messageHistoryDAO();

                    // DAO를 통해 메시지 목록을 읽어옴
                    List<messageHistoryDTO> messageInfos = dao.readMessage();

                    // 읽어온 메시지 목록을 속성에 저장
                    request.setAttribute("messageInfos", messageInfos);
                %>

                <% if (messageInfos != null && !messageInfos.isEmpty()) { %>

                <% for (messageHistoryDTO message : messageInfos) { %>
            <div class="messageComponent-list">
                <div class="messageComponent-title bg_white col_black bd_green"><%= message.getTitle() %></div>
                <div class="messageComponent-category bg_white col_black bd_green"><%= message.getCategory() %></div>
                <div class="messageComponent-date bg_white col_black bd_green"><%= message.getTime() %></div>
                <div class="messageComponent-count bg_white col_black bd_green"><%= message.getCounts() %></div>
                <div class="messageComponent-content bg_white col_black bd_green"><%= message.getContents() %></div>
            </div>
                <% } %>

                <% } else { %>
                <div class="messageComponent-empty">메시지가 없습니다.</div>
                <% } %>


        </div>

    </section>
</main>
</body>
</html>
