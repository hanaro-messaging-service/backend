<%@ page import="voicefishingNotificationMessagePackage.voicefishingNotificationDTO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<html>
<head>
    <title>하나로 메세지</title>
    <link rel="stylesheet" href="/pages/sendMessage/voicefishingNotificationMessage/voicefishingNotificationMessage.css" >
    <script src="/pages/sendMessage/voicefishingNotificationMessage/voicefishingNotificationMessage.js"></script>
</head>
<body>
<header>
    헤더입니다
</header>
<main>
<<<<<<< HEAD
    <jsp:include page="/components/sidebar.jsp" />
=======
<<<<<<< HEAD
    <section class="sidebar">
        <div class="sidebar-main">
            메시지
        </div>
        <div class="sidebar-submain">전송</div>
        <div class="sidebar-content"><li><a href="/pages/sendMessage/allNotificationMessage/allNotificationMessage.jsp">전체 안내 메시지 전송</a></li></div>
        <div class="sidebar-content"><li><a href="/pages/sendMessage/voicefishingNotificationMessage/voicefishingNotificationMessage.jsp">보이스피싱 예방 안내 메시지 전송</a></li></div>
        <div class="sidebar-content"><li><a href="/pages/sendMessage/productPromotionMessage.jsp">수신 상품 프로모션 메시지 전송</a></li></div>
        <div class="sidebar-content"><li><a href="/pages/sendMessage/appPromotionMessage/appPromotionMessage.jsp">어플 프로모션 메시지 전송</a></li></div>
        <div class="sidebar-content"><li><a href="/pages/sendMessage/overdueNotificationMessage/overdueNotificationMessage.jsp">상황 관리 안내 메시지 전송</a></li></div>
        <div class="sidebar-submain">관리</div>
        <div class="sidebar-content"><li><a href="/pages/manageMessage/allNotificationManage/allNotificationManage.jsp">전체 안내 메시지 관리</a></li></div>
        <div class="sidebar-content"><li><a href="/pages/manageMessage/voicefishingNotificationManage/voicefishingNotificationManage.jsp"> 보이스피싱 예방 안내 메시지 관리</a></li></div>
        <div class="sidebar-content"><li><a href="/pages/manageMessage/productPromotionManage/productPromotionManage.jsp">수신 상품 프로모션 메시지 관리</a></li></div>
        <div class="sidebar-content"><li><a href="/pages/manageMessage/appPromotionManage/appPromotionManage.jsp">어플 프로모션 메시지 관리</a></li></div>
        <div class="sidebar-content"><li ><a href="/pages/manageMessage/overdueNotificationManage/overdueNotificationManage.jsp">상황 관리 안내 메시지 관리</a></li></div>
    </section>
=======
    <jsp:include page="/components/sidebar.jsp" />
>>>>>>> 9ac7324dc1d967f9602006343fd9ae0d085e83a6
>>>>>>> main
    <section class="mainComponent">
        <div class="searchComponent">
            <div class="searchComponent-topBar">
                <div class="searchComponent-topBar-left">메세지 관리</div>
                <div class="searchComponent-topBar-right">메세지 전송</div>
            </div>
            <div class="searchComponent-titleBar">보이스피싱 예방 안내 메시지</div>
            <div class="searchComponent-searchBar">
                <div class="searchComponent-searchBar-list">
                    <div class="searchComponent-searchBar-list-key">나이</div>
                    <div class="searchComponent-searchBar-list-value">
                        <select name="age" id="age" onchange="sendValueToServlet(this.value)">
                            <option value="전체">전체</option>
                            <option value="20대">20대</option>
                            <option value="30대">30대</option>
                            <option value="40대">40대</option>
                            <option value="50대">50대</option>
                            <option value="60대">60대</option>
                            <option value="70대 이상">70대 이상</option>
                        </select>
                    </div>
                    <div class="searchComponent-searchBar-list-key">개인정보동의여부</div>
                    <div class="searchComponent-searchBar-list-value">
                        <div class="checkbox">
                            <input  onclick="sendValueToServlet(this)" type="checkbox" name="개인정보" value="O" class="flex align-center" id="privacyYes">
                            <div>동의</div>
                        </div>
                    </div>

                </div>
                <div class="searchComponent-searchBar-list">
                    <div class="searchComponent-searchBar-list-key">이름</div>
                    <div class="searchComponent-searchBar-list-value">
                        <input value="" type="text" id="name" oninput="sendValueToServlet(event.target.value)">
                    </div>
                    <div class="searchComponent-searchBar-list-key"></div>
                    <div class="searchComponent-searchBar-list-value"></div>
                </div>
                <div class="searchComponent-searchBar-list">
                    <div class="searchComponent-searchBar-list-key">메세지 내용</div>
                    <div class="searchComponent-searchBar-list-value"></div>
                    <div class="searchComponent-searchBar-list-key"></div>
                    <div class="searchComponent-searchBar-list-value"></div>
                </div>

            </div>

        </div>
        <div class="listComponent">
            <div class="listComponent-topbar">
                <div class="listComponent-topbar-elementMedium">선택</div>
                <div class="listComponent-topbar-elementBig">고객코드</div>
                <div class="listComponent-topbar-elementBig">이름</div>
                <div class="listComponent-topbar-elementBig">나이</div>
                <div class="listComponent-topbar-elementBig">자산</div>
                <div class="listComponent-topbar-elementBig">거주지</div>
                <div class="listComponent-topbar-elementBig">개인정보동의</div>
                <div class="listComponent-topbar-elementBig">전화번호</div>
                <div class="listComponent-topbar-elementBig">이메일</div>
            </div>
            <div id="resultContainer">
                <%
                    List<voicefishingNotificationDTO> custInfos = (List<voicefishingNotificationDTO>) request.getAttribute("custInfos");
                    if (custInfos != null) {
                        for (voicefishingNotificationDTO custInfo : custInfos) { %>
                <div class="listComponent-listbar">
                    <div class="listComponent-topbar-elementMedium bg-white">
                        <input type="checkbox" checked>
                    </div>
                    <div class="listComponent-topbar-elementBig bg-white">
                        <%= custInfo.getCustNo() %>
                    </div>
                    <div class="listComponent-topbar-elementBig bg-white">
                        <%= custInfo.getCustNm() %>
                    </div>
                    <div class="listComponent-topbar-elementBig bg-white">
                        <%= custInfo.getAge() %>
                    </div>
                    <div class="listComponent-topbar-elementBig bg-white">
                        <%= custInfo.getAsset() %>
                    </div>
                    <div class="listComponent-topbar-elementBig bg-white">
                        <%= custInfo.getAddress() %>
                    </div>
                    <div class="listComponent-topbar-elementBig bg-white">
                        <%= custInfo.getPrivacy()%>
                    </div>
                    <div class="listComponent-topbar-elementBig bg-white">
                        <%= custInfo.getPhoneNo() %>
                    </div>
                    <div class="listComponent-topbar-elementBig bg-white">
                        <%= custInfo.getEmail() %>
                    </div>
                </div>
                <% } } %>

            </div>

        </div>
    </section>
</main>
</body>
</html>
