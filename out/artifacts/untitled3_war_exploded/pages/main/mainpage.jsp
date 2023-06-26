
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
        <div class="sidebar-content"><li ><a href="/pages/messageList/productPromotionMessageList/prodMessageList.jsp">수신 상품 프로모션 발송내역</a></li></div>
        <div class="sidebar-submain"><a href="/pages/main/mainpage.jsp">메인페이지</a></div>

    </section>
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