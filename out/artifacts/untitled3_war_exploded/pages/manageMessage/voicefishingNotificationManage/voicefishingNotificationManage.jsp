<%@ page import="voicefishingNotificationMessagePackage.voicefishingNotificationCustomizeDTO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="voicefishingNotificationMessagePackage.voicefishingNotificationCustomizeDAO" %>
<html>
<head>
    <title>하나로 메세지</title>
    <link rel="stylesheet" href="./voicefishingNotificationManage.css" >
    <script src="./voicefishingNotificationManage.js"></script>
</head>
<body>


<main>
    <jsp:include page="/components/sidebar.jsp" />
    <section class="mainComponent">
        <div class="mainComponent-header">
            <div class="mainComponent-header-text">보이스피싱 예방 안내 메시지 관리</div>
            <div class="mainComponent-header-button"><a href="./voicefishingNotificationWrite.jsp">새로 만들기</a></div>
        </div>
        <%
            voicefishingNotificationCustomizeDAO dao = new voicefishingNotificationCustomizeDAO();
            List<voicefishingNotificationCustomizeDTO> custInfos = dao.selectMessage();
            if (custInfos != null) {
                for (voicefishingNotificationCustomizeDTO custInfo : custInfos)
                { %>
        <div class="mainComponent-messageList" onclick="modifyMessage([
                '<%=custInfo.getId() %>',
                '<%=custInfo.getCustNm() %>',
                '<%=custInfo.getAge() %>',
                '<%=custInfo.getPrivacy() %>',
                '<%=custInfo.getMContents() %>',
                '<%=custInfo.getId()%>'
                ])">

            <div class="mainComponent-messageList-title">
                제목:
                <%=
                custInfo.getMContents()
                %>
            </div>
            <div class="mainComponent-messageList-content">
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
        //AJAX 요청을 사용하여 JSP로 데이터 전송
        var xhr = new XMLHttpRequest();
        xhr.open('POST', '/voicefishingNotificationModifyServlet', true);
        xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');

        //전송할 데이터를 쿼리스트링 형식으로 만듭니다.

        xhr.onreadystatechange = function() {
            if (xhr.readyState === XMLHttpRequest.DONE) {
                if (xhr.status === 200) {
                    window.location.href = "/pages/manageMessage/voicefishingNotificationManage/voicefishingNotificationModify.jsp?id=" + encodeURIComponent(custInfo[0]) +
                        "&custNm=" + encodeURIComponent(custInfo[1]) +
                        "&age=" + encodeURIComponent(custInfo[2]) +
                        "&privacyYes=" + encodeURIComponent(custInfo[3]) +
                        "&mContents=" + encodeURIComponent(custInfo[4]) +
                        "&id=" + encodeURIComponent(custInfo[5]);
                } else {

                }
            }
        };
        //데이터를 전송합니다.
        xhr.send();
        //페이지 리디렉션

    }
</script>
</body>
</html>
