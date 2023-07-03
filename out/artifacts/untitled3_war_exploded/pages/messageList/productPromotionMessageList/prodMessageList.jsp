<%--
  Created by IntelliJ IDEA.
  User: soo
  Date: 2023/06/25
  Time: 4:08 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="productPromotionMessageHistory.prodMessageHistoryDAO" %>
<%@ page import="productPromotionMessageHistory.prodMessageHistoryDTO" %>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.Map"%>
<%@ page import="java.util.List" %>
<html>
<head>
  <title>Title</title>
  <link rel="stylesheet" href="/pages/messageList/productPromotionMessageList/prodMessageList.css" >
</head>
<body>
<jsp:include page="/components/header.jsp"/>
<main>
  <jsp:include page="/components/sidebar.jsp" />
  <section class="mainComponent">
    <div class="mainComponent-header">
      <div class="mainComponent-header-text">수신 상품 프로모션 발송내역</div>
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
        prodMessageHistoryDAO dao = new prodMessageHistoryDAO();

        // DAO를 통해 메시지 목록을 읽어옴
        List<prodMessageHistoryDTO> messageInfos = dao.readMessage();

        // 읽어온 메시지 목록을 속성에 저장
        request.setAttribute("messageInfos", messageInfos);
      %>

      <% if (messageInfos != null && !messageInfos.isEmpty()) { %>

      <% for (prodMessageHistoryDTO message : messageInfos) { %>
      <div class="messageComponent-list" onclick="modifyMessage([
              '',
              '<%=message.getCustNm() %>',
              '<%=message.getGender() %>',
              '<%=message.getAge() %>',
              '<%=message.getJob() %>',
              '<%=message.getAddress() %>',
              '<%=message.getCustGrade() %>',
              '<%=message.getBranch() %>',
              '<%=message.getSubTerm() %>',
              '<%=message.getAsset() %>',
              '<%=message.getPrivacy() %>',
              '<%=message.getRecLoginDate() %>',
              '<%=message.getTitle() %>',
              '<%=message.getCategory() %>',
              '<%=message.getTime() %>',
              '<%=message.getCounts() %>',
              '<%=message.getContents()%>'
              ])">
        <div class="messageComponent-title bg_white col_black bd_green">
          <% String title2 = message.getTitle();
            if (title2 != null && title2.length() > 20) {
              title2 = title2.substring(0, 20)+"...";
            }
          %>
          <%= title2 %>
        </div>
        <div class="messageComponent-category bg_white col_black bd_green"><%= message.getCategory() %></div>
        <div class="messageComponent-date bg_white col_black bd_green"><%= message.getTime() %></div>
        <div class="messageComponent-count bg_white col_black bd_green"><%= message.getCounts() %></div>
        <div class="messageComponent-content bg_white col_black bd_green">
          <% String content = message.getContents();
            if (content != null && content.length() > 20) {
              content = content.substring(0, 20)+"...";
            }
          %>
<%= content %>
        </div>
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
    xhr.open('POST', '/productPromotionModifyServlet', true);
    xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');

    // 전송할 데이터를 쿼리스트링 형식으로 만듭니다.

    xhr.onreadystatechange = function() {
      if (xhr.readyState === XMLHttpRequest.DONE) {
        if (xhr.status === 200) {
          window.location.href = "/pages/messageList/productPromotionMessageList/prodMessageDetail.jsp?id=" + encodeURIComponent(custInfo[0]) +
                  "&custNm=" + encodeURIComponent(custInfo[1]) +
                  "&gender=" + encodeURIComponent(custInfo[2]) +
                  "&age=" + encodeURIComponent(custInfo[3]) +
                  "&job=" + encodeURIComponent(custInfo[4]) +
                  "&location=" + encodeURIComponent(custInfo[5]) +
                  "&custGrade=" + encodeURIComponent(custInfo[6]) +
                  "&branch=" + encodeURIComponent(custInfo[7]) +
                  "&period=" + encodeURIComponent(custInfo[8]) +
                  "&asset=" + encodeURIComponent(custInfo[9]) +
                  "&privacyYes=" + encodeURIComponent(custInfo[10]) +
                  "&app=" + encodeURIComponent(custInfo[11]) +
                  "&title=" + encodeURIComponent(custInfo[12]) +
                  "&category=" + encodeURIComponent(custInfo[13]) +
                  "&time=" + encodeURIComponent(custInfo[14]) +
                  "&counts=" + encodeURIComponent(custInfo[15]) +
                  "&contents=" + encodeURIComponent(custInfo[16]) ;
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
