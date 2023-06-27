
<%@ page import="appPromotionMessagePackage.appPromotionCustomizeDTO" %>
<%@ page import="appPromotionMessagePackage.appPromotionCustomizeDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>


<html>
<head>
    <title>하나로 메세지</title>
    <link rel="stylesheet" href="/pages/manageMessage/appPromotionManage/appPromotionManage.css" >
    <script src="/pages/sendMessage/appPromotionMessage/appPromotionMessage.js"></script>
</head>
<body>

<main>
    <jsp:include page="/components/sidebar.jsp" />
    <section class="mainComponent">
        <div class="mainComponent-header">
            <div class="mainComponent-header-text">앱 광고 메시지 관리</div>
            <div class="mainComponent-header-button"><a href="./appPromotionWrite.jsp">새로 만들기</a></div>
        </div>
        <%
            System.out.println("g1");
            appPromotionCustomizeDAO dao = new appPromotionCustomizeDAO();
            System.out.println("gg");
            List<appPromotionCustomizeDTO> custInfos = dao.selectMessage();

            if (custInfos != null) {
                for (appPromotionCustomizeDTO custInfo : custInfos)
                { %>
        <form  style="z-index:999999; position: relative; top: 6%; right: -40%;" method="POST" action="/appPromotionDeleteServlet">
            <input name="tableId"  hidden="" value="<%=custInfo.getId()%>">
            <button style="width:100px;height:30px"style="width:100px;height:20%" type="submit">삭제</button>
        </form>
        <div class="mainComponent-messageList" style="position:relative" onclick="modifyMessage([
                '<%=custInfo.getId() %>',
                '<%=custInfo.getCustNm() %>',
                '<%=custInfo.getGender() %>',
                '<%=custInfo.getAge() %>',
                '<%=custInfo.getJob() %>',
                '<%=custInfo.getCustGrade() %>',
                '<%=custInfo.getSubTerm() %>',
                '<%=custInfo.getAsset() %>',
                '<%=custInfo.getPrivacy() %>',
                '<%=custInfo.getRecLoginDate() %>',
                '<%=custInfo.getProdNm() %>',
                '<%=custInfo.getMContents() %>',
                '<%=custInfo.getId()%>'
                ])">

            <div class="mainComponent-messageList-title">
                제목:
                <%=
                custInfo.getProdNm()
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
        // AJAX 요청을 사용하여 JSP로 데이터 전송
        var xhr = new XMLHttpRequest();
        xhr.open('POST', '/appPromotionModifyServlet', true);
        xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');

        // 전송할 데이터를 쿼리스트링 형식으로 만듭니다.

<<<<<<< HEAD
    xhr.onreadystatechange = function() {
      if (xhr.readyState === XMLHttpRequest.DONE) {
        if (xhr.status === 200) {
          window.location.href = "/pages/manageMessage/productPromotionManage/overdueNotificationModify.jsp?id=" + encodeURIComponent(custInfo[0]) +
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
                  "&prodNm=" + encodeURIComponent(custInfo[12]) +
                  "&mContents=" + encodeURIComponent(custInfo[13]) +
                  "&id=" + encodeURIComponent(custInfo[14]);
        } else {
=======
        xhr.onreadystatechange = function() {
            if (xhr.readyState === XMLHttpRequest.DONE) {
                if (xhr.status === 200) {
                    window.location.href = "/pages/manageMessage/appPromotionManage/appPromotionModify.jsp?id=" + encodeURIComponent(custInfo[0]) +
                        "&custNm=" + encodeURIComponent(custInfo[1]) +
                        "&gender=" + encodeURIComponent(custInfo[2]) +
                        "&age=" + encodeURIComponent(custInfo[3]) +
                        "&job=" + encodeURIComponent(custInfo[4]) +
                        "&custGrade=" + encodeURIComponent(custInfo[5]) +
                        "&period=" + encodeURIComponent(custInfo[6]) +
                        "&asset=" + encodeURIComponent(custInfo[7]) +
                        "&privacyYes=" + encodeURIComponent(custInfo[8]) +
                        "&app=" + encodeURIComponent(custInfo[9]) +
                        "&prodNm=" + encodeURIComponent(custInfo[10]) +
                        "&mContents=" + encodeURIComponent(custInfo[11]) +
                        "&id=" + encodeURIComponent(custInfo[12]);
                } else {
>>>>>>> 9ac7324dc1d967f9602006343fd9ae0d085e83a6

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