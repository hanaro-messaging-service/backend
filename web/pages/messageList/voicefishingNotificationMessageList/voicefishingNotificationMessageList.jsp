<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="messageHistory.voicefishingNotificationHistory.voicefishingNotificationHistoryDAO" %>
<%@ page import="messageHistory.voicefishingNotificationHistory.voicefishingNotificationHistoryDTO" %>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.Map"%>
<%@ page import="java.util.List" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/pages/messageList/voicefishingNotificationMessageList/voicefishingNotificationMessageList.css" >
</head>
<body>
<main>
    <jsp:include page="/components/sidebar.jsp" />
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
                voicefishingNotificationHistoryDAO dao = new voicefishingNotificationHistoryDAO();

                // DAO를 통해 메시지 목록을 읽어옴
                List<voicefishingNotificationHistoryDTO> messageInfos = dao.readMessage();

                // 읽어온 메시지 목록을 속성에 저장
                request.setAttribute("messageInfos", messageInfos);
            %>

            <% if (messageInfos != null && !messageInfos.isEmpty()) { %>

            <% for (voicefishingNotificationHistoryDTO message : messageInfos) { %>
            <div class="messageComponent-list" onclick="modifyMessage([
                    '',
                    '<%=message.getCustNm() %>',
                    '<%=message.getAge() %>',
                    '<%=message.getAddress() %>',
                    '<%=message.getAsset() %>',
                    '<%=message.getPrivacy() %>',
                    '<%=message.getTitle() %>',
                    '<%=message.getCategory() %>',
                    '<%=message.getTime() %>',
                    '<%=message.getCounts() %>',
                    '<%=message.getContents()%>'
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
        xhr.open('POST', '/VoicefishingNotificationModifyServlet', true);
        xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');

        // 전송할 데이터를 쿼리스트링 형식으로 만듭니다.

        xhr.onreadystatechange = function() {
            if (xhr.readyState === XMLHttpRequest.DONE) {
                if (xhr.status === 200) {
                    window.location.href = "/pages/messageList/voicefishingNotificationMessageList/voicefishingNotificationMessageDetail.jsp?id=" + encodeURIComponent(custInfo[0]) +
                        "&custNm=" + encodeURIComponent(custInfo[1]) +
                        "&age=" + encodeURIComponent(custInfo[2]) +
                        "&location=" + encodeURIComponent(custInfo[3]) +
                        "&asset=" + encodeURIComponent(custInfo[4]) +
                        "&privacyYes=" + encodeURIComponent(custInfo[5]) +
                        "&title=" + encodeURIComponent(custInfo[6]) +
                        "&category=" + encodeURIComponent(custInfo[7]) +
                        "&time=" + encodeURIComponent(custInfo[8]) +
                        "&counts=" + encodeURIComponent(custInfo[9]) +
                        "&contents=" + encodeURIComponent(custInfo[10]) ;
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
