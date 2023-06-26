<%@ page import="overdueNotificationMessage.overdueNotificationCustomizeDTO" %>
<%@ page import="overdueNotificationMessage.overdueNotificationCustomizeDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<html>
<head>
    <title>하나로 메세지</title>
    <link rel="stylesheet" href="/pages/manageMessage/overdueNotificationManage/overdueNotificationManage.css" >
    <script src="/pages/sendMessage/overdueNotificationMessage/overdueNotificationMessage.js"></script>
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
        <div class="sidebar-submain"><a href="/pages/messageList/messageList.jsp">메시지 발송내역</a></div>
        <div class="sidebar-submain"><a href="/pages/main/mainpage.jsp">메인페이지</a></div>

    </section>
    <section class="mainComponent">
        <div class="mainComponent-header">
            <div class="mainComponent-header-text">상환관리 메시지 관리</div>
            <div class="mainComponent-header-button"><a href="./overdueNotificationWrite.jsp">새로 만들기</a></div>
        </div>
        <%
            overdueNotificationCustomizeDAO dao = new overdueNotificationCustomizeDAO();
            List<overdueNotificationCustomizeDTO> custInfos = dao.selectMessage();
            if (custInfos != null) {
                for (overdueNotificationCustomizeDTO custInfo : custInfos)
                { %>
        <div class="mainComponent-messageList" onclick="modifyMessage([
                '<%=custInfo.getId() %>',
                '<%=custInfo.getCustNm() %>',
                '<%=custInfo.getGender() %>',
                '<%=custInfo.getCustGrade() %>',
                '<%=custInfo.getCreditRating() %>',
                '<%=custInfo.getAge() %>',
                '<%=custInfo.getSubTerm() %>',
                '<%=custInfo.getAsset() %>',
                '<%=custInfo.getPrivacy() %>',
                '<%=custInfo.getOverdue() %>',
                '<%=custInfo.getMContents() %>',
                '<%=custInfo.getMTitle() %>',
                ])">

            <div class="mainComponent-messageList-title"> <!-- 메시지 제목 -->
                제목:
                <%=
                custInfo.getMTitle()
                %>
            </div>
            <div class="mainComponent-messageList-content"> <!-- 메시지 내용 -->
                내용:
                <%=
                custInfo.getMContents()
                %>
            </div>
            <input hidden ="" value="<%=custInfo.getId()%>">
        </div>

        <%
                }}
        %>
    </section>
</main>
<script>
    function modifyMessage(custInfo) {
        // AJAX 요청을 사용하여 JSP로 데이터 전송
        var xhr = new XMLHttpRequest();
        xhr.open('POST', '/overdueNotificationModifyServlet', true);
        xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');

        // 전송할 데이터를 쿼리스트링 형식으로 만든 후 서블릿에 요청

        xhr.onreadystatechange = function() {
            if (xhr.readyState === XMLHttpRequest.DONE) {
                if (xhr.status === 200) {
                    window.location.href = "/pages/manageMessage/overdueNotificationManage/overdueNotificationModify.jsp?id=" + encodeURIComponent(custInfo[0]) +
                        "&custNm=" + encodeURIComponent(custInfo[1]) +
                        "&gender=" + encodeURIComponent(custInfo[2]) +
                        "&custGrade=" + encodeURIComponent(custInfo[3]) +
                        "&creditRating=" + encodeURIComponent(custInfo[4]) +
                        "&age=" + encodeURIComponent(custInfo[5]) +
                        "&subTerm=" + encodeURIComponent(custInfo[6]) +
                        "&asset=" + encodeURIComponent(custInfo[7]) +
                        "&privacyYes=" + encodeURIComponent(custInfo[8]) +
                        "&overdue=" + encodeURIComponent(custInfo[9]) +
                        "&mContents=" + encodeURIComponent(custInfo[10]) +
                        "&mTitle=" + encodeURIComponent(custInfo[11]) +
                        "&id=" + encodeURIComponent(custInfo[12]);

                        // "&age=" + encodeURIComponent(custInfo[3]) +
                        // "&job=" + encodeURIComponent(custInfo[4]) +
                        // "&location=" + encodeURIComponent(custInfo[5]) +
                        // "&custGrade=" + encodeURIComponent(custInfo[6]) +
                        // "&branch=" + encodeURIComponent(custInfo[7]) +
                        // "&period=" + encodeURIComponent(custInfo[8]) +
                        // "&asset=" + encodeURIComponent(custInfo[9]) +
                        // "&privacyYes=" + encodeURIComponent(custInfo[10]) +
                        // "&app=" + encodeURIComponent(custInfo[11]) +
                        // "&prodNm=" + encodeURIComponent(custInfo[12]) +
                        // "&mContents=" + encodeURIComponent(custInfo[13]) +
                        // "&id=" + encodeURIComponent(custInfo[14]);
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