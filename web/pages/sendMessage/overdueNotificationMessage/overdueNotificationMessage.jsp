
<%@ page import="overdueNotificationMessage.overdueNotificationDTO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<html>
<head>
    <title>하나로 메세지</title>
    <link rel="stylesheet" href="./overdueNotificationMessage.css" >
    <script src="./overdueNotificationMessage.js"></script>
</head>
<body>
<header>
헤더입니다
</header>
<main>
    <section class="sidebar">
        <div class="sidebar-main">
            메시지
        </div>
        <div class="sidebar-submain">전송</div>
        <div class="sidebar-content"><li>전체 안내 메시지 전송</li></div>
        <div class="sidebar-content"><li><a href="/pages/sendMessage/voicefishingNotificationMessage/voicefishingNotificationMessage.jsp">보이스피싱 예방 안내 메시지 전송</a></li></div>
        <div class="sidebar-content"><li><a href="/">수신 상품 프로모션 메시지 전송</a></li></div>
        <div class="sidebar-content"><li><a href="/pages/sendMessage/appPromotionMessage/appPromotionMessage.jsp">어플 프로모션 메시지 전송</a></li></div>
        <div class="sidebar-content"><li><a href="/pages/sendMessage/overdueNotificationMessage/overdueNotificationMessage.jsp">상황 관리 안내 메시지 전송</a></li></div>
        <div class="sidebar-submain">관리</div>
        <div class="sidebar-content"><li>전체 안내 메시지 관리</li></div>
        <div class="sidebar-content"><li><a href="/pages/manageMessage/voicefishingNotificationManage/voicefishingNotificationManage.jsp"> 보이스피싱 예방 안내 메시지 관리</a></li></div>
        <div class="sidebar-content"><li><a href="/pages/manageMessage/productPromotionManage/productPromotionManage.jsp">수신 상품 프로모션 메시지 관리</a></li></div>
        <div class="sidebar-content"><li><a href="/pages/manageMessage/appPromotionManage/appPromotionManage.jsp">어플 프로모션 메시지 관리</a></li></div>
        <div class="sidebar-content"><li ><a href="/pages/manageMessage/overdueNotificationManage/overdueNotificationManage.jsp">상황 관리 안내 메시지 관리</a></li></div>
    </section>
    <section class="mainComponent">
    <div class="searchComponent">
    <div class="searchComponent-topBar">
        <div class="searchComponent-topBar-left">메세지 관리</div>
        <div class="searchComponent-topBar-right">메세지 전송</div>
    </div>
    <div class="searchComponent-titleBar">상환 관리 안내 메시지</div>
    <div class="searchComponent-searchBar">
        <div class="searchComponent-searchBar-list">
            <div class="searchComponent-searchBar-list-key">성별</div>
            <div class="searchComponent-searchBar-list-value">
                <div class="checkbox">
                    <input onchange="sendValueToServlet(this)" type="checkbox" name="성별" value="M" class="flex align-center" id="man">
                    <div>남자</div>
                </div>
                <div class="checkbox">
                    <input onchange="sendValueToServlet(this)" type="checkbox" name="성별" value="F" id="woman">
                    <div>여자</div>
                </div>
            </div>
            <div class="searchComponent-searchBar-list-key">개인정보동의여부</div>
            <div class="searchComponent-searchBar-list-value">
                <div class="checkbox">
                    <input onclick="sendValueToServlet(this)" type="checkbox" name="개인정보" value="O" class="flex align-center" id="privacyYes">
                    <div>동의</div>
                </div>
            </div>
        </div>
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
            <div class="searchComponent-searchBar-list-key">연체여부</div>
            <div class="searchComponent-searchBar-list-value">
                <div class="checkbox">
                    <input onchange="sendValueToServlet(this)" type="checkbox" name="연체여부" value="O" class="flex align-center" id="overdueYes">
                    <div>연체</div>
                </div>
                <div class="checkbox">
                    <input onchange="sendValueToServlet(this)" type="checkbox" name="연체여부" value="X" id="overdueNo">
                    <div>미연체</div>
                </div>
            </div>
        </div>
        <div class="searchComponent-searchBar-list">
            <div class="searchComponent-searchBar-list-key">신용등급</div>
            <div class="searchComponent-searchBar-list-value">
                <select name="credit" id="credit" onchange="sendValueToServlet(this.value)">
                    <option value="전체">전체</option>
                    <option value="1">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                    <option value="4">4</option>
                    <option value="5">5</option>
                    <option value="6">6</option>
                    <option value="7">7</option>
                    <option value="8">8</option>
                    <option value="9">9</option>
                    <option value="10">10</option>
                </select>
            </div>

            <div class="searchComponent-searchBar-list-key">자산</div>
            <div class="searchComponent-searchBar-list-value">
                <select name="asset" id="asset" onchange="sendValueToServlet(this.value)">
                    <option value="전체">전체</option>
                    <option value="100만원 이하">100만원 이하</option>
                    <option value="100만원에서 1000만원">100만원~1000만원</option>
                    <option value="1000만원에서 3000만원">1000만원-3000만원</option>
                    <option value="3000만원 이상">3000만원 이상</option>
                </select>
            </div>
        </div>
        <div class="searchComponent-searchBar-list">
            <div class="searchComponent-searchBar-list-key">고객등급</div>
            <div class="searchComponent-searchBar-list-value">
                <select name="private" id="private" onchange="sendValueToServlet(this.value)">
                    <option value="전체">전체</option>
                    <option value="1">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                    <option value="4">4</option>
                    <option value="5">5</option>
                </select>
            </div>

            <div class="searchComponent-searchBar-list-key">가입 기간</div>
            <div class="searchComponent-searchBar-list-value">
                <select name="period" id="period" onchange="sendValueToServlet(this.value)" >
                    <option value="전체">전체</option>
                    <option value="1년 미만">1년 미만</option>
                    <option value="1년-3년">1년-3년</option>
                    <option value="3년-5년">3년-5년</option>
                    <option value="5년-10년">5년-10년</option>
                    <option value="10년 이상">10년 이상</option>
                </select>
            </div>
        </div>
        <div class="searchComponent-searchBar-list">
            <div class="searchComponent-searchBar-list-key">거주지</div>
            <div class="searchComponent-searchBar-list-value">
                <select name="location" id="location" onchange="sendValueToServlet(this.value)" >
                    <option value="전체">전체</option>
                    <option value="서울특별시">서울특별시</option>
                    <option value="경기도">경기도</option>
                    <option value="경상도">경상도</option>
                    <option value="강원도">강원도</option>
                    <option value="충청도">충청도</option>
                    <option value="전라도">전라도</option>
                </select>
            </div>
            <div class="searchComponent-searchBar-list-key">개설지점</div>
            <div class="searchComponent-searchBar-list-value">
                <input value="" type="text" id="branch" oninput="sendValueToServlet(event.target.value)">
            </div>
        </div>
        <div class="searchComponent-searchBar-list">
            <div class="searchComponent-searchBar-list-key">이름</div>
            <div class="searchComponent-searchBar-list-value">
                <input value="" type="text" id="name" oninput="sendValueToServlet(event.target.value)">
            </div>
            <div class="searchComponent-searchBar-list-key">상품명</div>
            <div class="searchComponent-searchBar-list-value">
                <select name="period" id="where2" onchange="sendValueToServlet(this.value)" >
                    <option value="전체">전체</option>
                    <option value="1년 미만">1년 미만</option>
                    <option value="1년-3년">1년-3년</option>
                    <option value="3년-5년">3년-5년</option>
                    <option value="5년-10년">5년-10년</option>
                    <option value="10년 이상">10년 이상</option>
                </select>
            </div>
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
             <div class="listComponent-topbar-element" >선택</div>
             <div class="listComponent-topbar-element" id="midBox">고객코드</div>
             <div class="listComponent-topbar-element" >이름</div>
             <div class="listComponent-topbar-element" id="ageBox">나이</div>
             <div class="listComponent-topbar-element" >성별</div>
             <div class="listComponent-topbar-elementMedium" id="overdueBox">연체여부</div>  <!-- 추가사항 -->
             <div class="listComponent-topbar-elementMedium" id="creditBox">신용등급</div>
             <div class="listComponent-topbar-elementMedium" id="gradeBox">고객등급</div>
             <div class="listComponent-topbar-elementMedium">자산</div>
             <div class="listComponent-topbar-elementBig">개인정보동의</div>
             <div class="listComponent-topbar-elementBig">전화번호</div>
             <div class="listComponent-topbar-elementBig">이메일</div>
        </div>
        <div id="resultContainer">
            <%
                List<overdueNotificationDTO> custInfos = (List<overdueNotificationDTO>) request.getAttribute("custInfos");
                if (custInfos != null) {
                    for (overdueNotificationDTO custInfo : custInfos) { %>
            <div class="listComponent-listbar">
                <div class="listComponent-topbar-element bg-white">
                    <input type="checkbox">
                </div>
                <div class="listComponent-topbar-element bg-white">
                    <%= custInfo.getCustNo() %>
                </div>
                <div class="listComponent-topbar-element bg-white">
                    <%= custInfo.getCustNm() %>
                </div>
                <div class="listComponent-topbar-element bg-white">
                    <%= custInfo.getAge() %>
                </div>
                <div class="listComponent-topbar-element bg-white">
                    <%= custInfo.getGender()%>
                </div>
                <div class="listComponent-topbar-elementMedium bg-white">
                    <%= custInfo.getOverdue()%>
                </div>
                <div class="listComponent-topbar-elementMedium bg-white">
                    <%= custInfo.getCredit() %>
                </div>
                <div class="listComponent-topbar-elementMedium bg-white">
                    <%= custInfo.getCustGrade()%>
                </div>
                <div class="listComponent-topbar-elementMedium bg-white">
                    <%= custInfo.getAsset()%>
                </div>
                <div class="listComponent-topbar-elementBig bg-white">
                    <%= custInfo.getPrivacy()%>
                </div>
                <div class="listComponent-topbar-elementBig bg-white">
                    <%= custInfo.getPhoneNum()%>
                </div>
                <div class="listComponent-topbar-elementBig bg-white">
                    <%= custInfo.getEmail()%>
                </div>
            </div>
            <% } } %>

        </div>

    </div>
    </section>
</main>
</body>
</html>
