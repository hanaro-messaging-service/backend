
<%@ page import="productPromotionPackage.productPromotionMessageDTO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="productPromotionPackage.productPromotionCustomizeDAO" %>
<%@ page import="productPromotionPackage.productPromotionCustomizeDTO" %>
<%@ page import="java.lang.reflect.Array" %>
<html>
<head>
    <title>하나로 메세지</title>
    <link rel="stylesheet" href="/pages/main/mainpage.css" >
    <script src="/pages/sendMessage/productPromotionMessage.js"></script>
</head>
<body>


<main>
    <jsp:include page="/components/sidebar.jsp" />
    <section class="mainComponent">
        <%
            productPromotionCustomizeDAO dao = new productPromotionCustomizeDAO();
            List<productPromotionCustomizeDTO> infos = dao.selectMessage();

        %>


                <div class="titleComponent">메인페이지</div>

        <div class="topComponent">
                <div class="topComponent-element">
                        <div>관리자 총 인원</div>
                        <div>10명</div>
                </div>
                <div class="topComponent-element">
                    <div>금일 총 작업량</div>
                    <div>300건</div>
                </div>
                <div class="topComponent-element">
                    <div>금일 상품페이지 조회량</div>
                    <div>10회</div>
                </div>

        </div>
        <div class="contentComponent">
        <div class="contentComponent-element">
            <div>
                수신 상품 프로모션 메시지
            </div>
            <div>
                <div>

                </div>
            </div>
        </div>
        <div class="contentComponent-element">
            <div>
                보이스피싱 예방 안내 메시지
            </div>
            <div>
                <div>

                </div>
            </div>
        </div>
        <div class="contentComponent-element">
            <div>
                어플 프로모션 메시지
            </div>
            <div>
                <div>

                </div>
            </div>
        </div>
        <div class="contentComponent-element">
            <div>
                상황 관리 안내 메시지
            </div>
            <div>
                <div>

                </div>
            </div>
        </div>
        </div>
    </section>
</main>
<script>


</script>
</body>
</html>