<%@ page import="voicefishingNotificationMessagePackage.voicefishingNotificationCustomizeDTO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="voicefishingNotificationMessagePackage.voicefishingNotificationCustomizeDAO" %>
<html>
<head>
    <title>하나로 메세지</title>
    <link rel="stylesheet" href="/pages/manageMessage/voicefishingNotificationManage/voicefishingNotificationManage.css" >
    <script src="/pages/sendMessage/voicefishingNotificationMessage/voicefishingNotificationMessage.js"></script>
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
        <form  style="z-index:999999; position: relative; top: 6%; right: -43%;" method="POST" action="/VoicefishingNotificationDeleteServlet">
            <input name="tableId"  hidden="" value="<%=custInfo.getId()%>">
            <button  style=" cursor:pointer; width:100px;height:20%;font-size:20px; background-color:transparent; border:none;" type="submit">X</button>
        </form>
        <div class="mainComponent-messageList" style="position:relative" onclick="modifyMessage([
                '<%=custInfo.getId() %>',
                '<%=custInfo.getCustNm() %>',
                '<%=custInfo.getAge() %>',
                '<%=custInfo.getAddress() %>',
                '<%=custInfo.getAsset() %>',
                '<%=custInfo.getPrivacy() %>',
                '<%=custInfo.getProdNm() %>',
                '<%=custInfo.getMContents() %>',
                '<%=custInfo.getId()%>'
                ])">

            <div class="mainComponent-messageList-title">

                <%=
                custInfo.getProdNm()
                %>
            </div>
            <div class="mainComponent-messageList-content">

                <%=
                custInfo.getMContents()
                %>
            </div>


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
        xhr.open('POST', '/VoicefishingNotificationModifyServlet', true);
        xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');

        // 전송할 데이터를 쿼리스트링 형식으로 만듭니다.

        xhr.onreadystatechange = function() {
            if (xhr.readyState === XMLHttpRequest.DONE) {
                if (xhr.status === 200) {
                    window.location.href = "/pages/manageMessage/voicefishingNotificationManage/voicefishingNotificationModify.jsp?id=" + encodeURIComponent(custInfo[0]) +
                        "&custNm=" + encodeURIComponent(custInfo[1]) +
                        "&age=" + encodeURIComponent(custInfo[2]) +
                        "&location=" + encodeURIComponent(custInfo[3]) +
                        "&asset=" + encodeURIComponent(custInfo[4]) +
                        "&privacyYes=" + encodeURIComponent(custInfo[5]) +
                        "&prodNm=" + encodeURIComponent(custInfo[6]) +
                        "&mContents=" + encodeURIComponent(custInfo[7]) +
                        "&id=" + encodeURIComponent(custInfo[8]);
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
