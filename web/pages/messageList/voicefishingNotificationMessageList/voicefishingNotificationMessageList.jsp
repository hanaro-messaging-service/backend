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
<jsp:include page="/components/header.jsp"/>
<main>
    <jsp:include page="/components/sidebar.jsp" />
    <section class="mainComponent">
        <div class="mainComponent-header">
            <div class="mainComponent-header-text">보이스피싱 예방 발송내역</div>
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
                    '[검찰 사칭 보이스피싱 주의 안내] [Web발신] [하나은행][검찰 사칭 보이스피싱 주의 안내]최근 20~30대 대상 검찰사칭 보이스피싱 피해가 급증하고 있으니, 고객님들의 각별한 주의를 당부 드립니다. 최신 사기 유형 (주의)- 전화로 검찰 사칭, 범죄에 연루되었다며 접근- 소환장, 구속영장 등 열람목적으로 앱설치 또는 URL 클릭 유도 (아이폰 이용자의 경우 중고휴대폰 구입하게 하여 지시함)- 코인불법투자 등 수사에 연루되어, 정상자금을 확인해야한다며 해외송금 요구- 수사를 핑계로 숙박시설에 투숙하게 하는 등 외부와의 단절 유도 피해 예방요령- 검찰 사칭하며 금전 요구 시 무조건 거절- 문자(카톡)에 출처가 불분명한 URL 절대 클릭 금지- 검찰사칭 가짜 공문서는 『보이스피싱 서류! 진짜인지 알려줘 콜센터(찐센터010-3570-8242)』에 진위여부 확인 피해발생(의심) 시 대응요령- 피해가 의심될 경우 지체없이 해당 금융회사, 경찰청(112), 금감원(1332)으로 신고하여 피해상담 및 긴급지급정지 신청- 하나은행 긴급지급정지 1588-1111 고객님의 안전한 금융생활을 위해 항상 최선을 다하는 하나은행이 되겠습니다. 하나은행 고객상담센터 1588-1111(평일 오전9시~오후6시/주말 및 공휴일 휴무)',
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
        console.log(custInfo[10])
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
