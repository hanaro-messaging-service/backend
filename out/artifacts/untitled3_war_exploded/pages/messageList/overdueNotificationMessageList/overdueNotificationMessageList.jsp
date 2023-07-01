<%--
  Created by IntelliJ IDEA.
  User: soo
  Date: 2023/06/25
  Time: 4:08 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="messageHistory.overdueNotificationMessageHistory.messageHistoryDAO" %>
<%@ page import="messageHistory.overdueNotificationMessageHistory.messageHistoryDTO" %>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.Map"%>
<%@ page import="java.util.List" %>
<html>
<head>
  <title>Title</title>
  <link rel="stylesheet" href="/pages/messageList/overdueNotificationMessageList/overdueNotificationMessageList.css" >
</head>
<body>
<jsp:include page="/components/header.jsp"/>
<main>
  <%--  전송내역--%>
  <jsp:include page="/components/sidebar.jsp" />
  <section class="mainComponent">
    <div class="mainComponent-header">
      <div class="mainComponent-header-text">상환 관리 안내 발송내역</div>
    </div>
    <div class="messageComponent">
      <div class="messageComponent-topbar">
        <div class="messageComponent-title">제목</div>
        <div class="messageComponent-category">카테고리</div>
        <div class="messageComponent-date font">발송 시각</div>
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
      <div class="messageComponent-list" onclick="modifyMessage([
              '',
              '<%=message.getCategory() %>',
              '<%=message.getContents() %>',
              '<%=message.getTitle() %>',
              '<%=message.getTime() %>',
              '<%=message.getGender() %>',
              '<%=message.getCounts() %>',
              '<%=message.getCustNm() %>',
              '<%=message.getAge() %>',
              '<%=message.getOverdue() %>',
              '<%=message.getAsset() %>',
              '<%=message.getPrivacy() %>',
              '<%=message.getSubTerm() %>',
              '<%=message.getCustGrade() %>',
              '<%=message.getCreditRating() %>'
              ])">
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
<script>
  function modifyMessage(custInfo) {
    // AJAX 요청을 사용하여 JSP로 데이터 전송
    var xhr = new XMLHttpRequest();
    xhr.open('POST', '/overdueNotificationModifyServlet', true);
    xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');

    // 전송할 데이터를 쿼리스트링 형식으로 만듭니다.

    xhr.onreadystatechange = function() {
      if (xhr.readyState === XMLHttpRequest.DONE) {
        if (xhr.status === 200) {
          window.location.href = "/pages/messageList/overdueNotificationMessageList/overdueNotificationMessageDetail.jsp?id=" + encodeURIComponent(custInfo[0]) +
                  "&category=" + encodeURIComponent(custInfo[1]) +
                  "&contents=" + encodeURIComponent(custInfo[2]) +
                  "&title=" + encodeURIComponent(custInfo[3]) +
                  "&time=" + encodeURIComponent(custInfo[4]) +
                  "&gender=" + encodeURIComponent(custInfo[5]) +
                  "&counts=" + encodeURIComponent(custInfo[6]) +
                  "&custNm=" + encodeURIComponent(custInfo[7]) +
                  "&age=" + encodeURIComponent(custInfo[8]) +
                  "&overdue=" + encodeURIComponent(custInfo[9]) +
                  "&asset=" + encodeURIComponent(custInfo[10]) +
                  "&privacyYes=" + encodeURIComponent(custInfo[11]) +
                  "&subTerm=" + encodeURIComponent(custInfo[12]) +
                  "&custGrade=" + encodeURIComponent(custInfo[13]) +
                  "&creditRating=" + encodeURIComponent(custInfo[14]);
        } else {

        }
      }
    };
    // 데이터를 전송합니다.
    xhr.send();
    // 페이지 리디렉션

  }
</script>
</body>
</html>
