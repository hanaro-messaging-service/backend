<%@ page import="productPromotionPackage.productPromotionCustomizeDTO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="productPromotionPackage.productPromotionCustomizeDAO" %>
<html>
<head>
    <title>하나로 메세지</title>
    <link rel="stylesheet" href="/pages/manageMessage/productPromotionManage/productPromotionManage.css" >
    <script src="/pages/sendMessage/productPromotionMessage.js"></script>
</head>
<body>


<main>
    <jsp:include page="/components/sidebar.jsp" />
    <section class="mainComponent">
        <div class="mainComponent-header">
            <div class="mainComponent-header-text">수신상품 메시지 관리</div>
            <div class="mainComponent-header-button"><a href="./productPromotionWrite.jsp">새로 만들기</a></div>
        </div>
        <%
            productPromotionCustomizeDAO dao = new productPromotionCustomizeDAO();
            List<productPromotionCustomizeDTO> custInfos = dao.selectMessage();
            if (custInfos != null) {
                for (productPromotionCustomizeDTO custInfo : custInfos)
             { %>
        <form  style="z-index:999999; position: relative; top: 6%; right: -43%;" method="POST" action="/productPromotionDeleteServlet">
            <input name="tableId"  hidden="" value="<%=custInfo.getId()%>">
            <button  style=" cursor:pointer; width:100px;height:20%;font-size:20px; background-color:transparent; border:none;" type="submit">X</button>
        </form>
        <div class="mainComponent-messageList" style="position:relative" onclick="modifyMessage([
                '<%=custInfo.getId() %>',
                '<%=custInfo.getCustNm() %>',
                '<%=custInfo.getGender() %>',
                '<%=custInfo.getAge() %>',
                '<%=custInfo.getJob() %>',
                '<%=custInfo.getAddress() %>',
                '<%=custInfo.getCustGrade() %>',
                '<%=custInfo.getBranch() %>',
                '<%=custInfo.getSubTerm() %>',
                '<%=custInfo.getAsset() %>',
                '<%=custInfo.getPrivacy() %>',
                '<%=custInfo.getRecLoginDate() %>',
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
        xhr.open('POST', '/productPromotionModifyServlet', true);
        xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');

        // 전송할 데이터를 쿼리스트링 형식으로 만듭니다.

        xhr.onreadystatechange = function() {
            if (xhr.readyState === XMLHttpRequest.DONE) {
                if (xhr.status === 200) {
                    window.location.href = "/pages/manageMessage/productPromotionManage/productPromotionModify.jsp?id=" + encodeURIComponent(custInfo[0]) +
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
