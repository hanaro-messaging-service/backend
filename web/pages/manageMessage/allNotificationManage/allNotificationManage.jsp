<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="allNoticePackage.allNoticeCustomizeDTO" %>
<%@ page import="allNoticePackage.allNoticeCustomizeDAO" %>
<html>
<head>
    <title>하나로 메세지</title>
    <link rel="stylesheet" href="./allNotificationManage.css" >
    <%--    <script src="./voicefishingNotificationManage.js"></script>--%>
</head>
<body>

<jsp:include page="/components/header.jsp" />
<main>
    <jsp:include page="/components/sidebar.jsp" />
    <section class="mainComponent">
        <div class="mainComponent-header">
            <div class="mainComponent-header-text">전체 안내 메시지 관리</div>
            <div class="mainComponent-header-button"><a href="./allNotificationWrite.jsp">새로 만들기</a></div>
        </div>
        <%
            allNoticeCustomizeDAO dao = new allNoticeCustomizeDAO();
            List<allNoticeCustomizeDTO> custInfos = dao.selectMessage();
            if (custInfos != null) {
                for (allNoticeCustomizeDTO custInfo : custInfos)
                { %>

        <div class="mainComponent-messageList" >

            <div class="mainComponent-messageList-title" >
                <div style="margin-left:2%;" onclick="modifyMessage([
                        // 해당 값 가져옴
                        '<%=custInfo.getId() %>',
                        '<%=custInfo.getCustNm() %>',
                        '<%=custInfo.getAge() %>',
                        '<%=custInfo.getPrivacy() %>',
                        '<%=custInfo.getLocation() %>',
                        '<%=custInfo.getMContents() %>',
                        '<%=custInfo.getMTitle() %>',
                        ])">제목: <%=custInfo.getMTitle()%></div>
                <form  style="margin-right:2%; z-index: 9999;"  method="POST" action="/allNotificationDeleteServlet">
                    <input name="tableId"  hidden="" value="<%=custInfo.getId()%>">
                    <button style="width:100px;height:60%; cursor:pointer;" type="submit">삭제</button>
                </form>

            </div>
            <div class="mainComponent-messageList-content" onclick="modifyMessage([
                    // 해당 값 가져옴
                    '<%=custInfo.getId() %>',
                    '<%=custInfo.getCustNm() %>',
                    '<%=custInfo.getAge() %>',
                    '<%=custInfo.getPrivacy() %>',
                    '<%=custInfo.getLocation() %>',
                    '<%=custInfo.getMContents() %>',
                    '<%=custInfo.getMTitle() %>',
                    ])">
                내용: <%=custInfo.getMContents()%>
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
        xhr.open('POST', '/allNotificationModifyServlet', true);
        xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');

        // 전송할 데이터를 쿼리스트링 형식으로 만듭니다.

        xhr.onreadystatechange = function() {
            if (xhr.readyState === XMLHttpRequest.DONE) {
                if (xhr.status === 200) {
                    console.log("작성 시작");
                    window.location.href = "/pages/manageMessage/allNotificationManage/allNotificationModify.jsp?id=" + encodeURIComponent(custInfo[0]) +
                        "&custNm=" + encodeURIComponent(custInfo[1]) +
                        "&age=" + encodeURIComponent(custInfo[2]) +
                        "&privacyYes=" + encodeURIComponent(custInfo[3]) +
                        "&location=" + encodeURIComponent(custInfo[4]) +
                        "&mContents=" + encodeURIComponent(custInfo[5]) +
                        "&mTitle=" + encodeURIComponent(custInfo[6]);
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
