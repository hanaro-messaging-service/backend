<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 2023-06-21
  Time: 오후 5:08
  To change this template use File | Settings | File Templates.
--%>

<%@ page import="appPromotionMessagePackage.appPromotionMessageDTO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<html>
<head>
  <title>하나로 메세지</title>
  <link rel="stylesheet" href="/pages/sendMessage/appPromotionMessage/appPromotionMessage.css" >
  <script src="/pages/sendMessage/appPromotionMessage/appPromotionMessage.js"></script>
</head>
<body>
<header>
  헤더입니다
</header>
<main>
  <section class="sidebar">
    사이드바
  </section>
  <section class="mainComponent">
    <div class="searchComponent">
      <div class="searchComponent-topBar">
        <div class="searchComponent-topBar-left">메세지 관리</div>
        <div class="searchComponent-topBar-right">메세지 전송</div>
      </div>
      <div class="searchComponent-titleBar">수신 상품 프로모션 메시지</div>
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
              <input  onclick="sendValueToServlet(this)" type="checkbox" name="개인정보" value="Y" class="flex align-center" id="privacyYes">
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
          <div class="searchComponent-searchBar-list-key">직업</div>
          <div class="searchComponent-searchBar-list-value">
            <select name="job" id="job" onchange="sendValueToServlet(this.value)">
              <option value="전체">전체</option>
              <option value="학생">학생</option>
              <option value="공무원">공무원</option>
              <option value="전문직">전문직</option>
              <option value="무직">무직</option>
              <option value="주부">주부</option>
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
          <div class="searchComponent-searchBar-list-key">어플 접속일</div>
          <div class="searchComponent-searchBar-list-value">
            <select name="app" id="app" onchange="sendValueToServlet(this.value)">
              <option value="전체">전체</option>
              <option value="1개월 이내">1개월 이내</option>
              <option value="1개월-3개월">1개월-3개월</option>
              <option value="3개월 이상">3개월</option>
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
<%--        <div class="searchComponent-searchBar-list">--%>
<%--          <div class="searchComponent-searchBar-list-key">거주지</div>--%>
<%--          <div class="searchComponent-searchBar-list-value">--%>
<%--            <select name="location" id="location" onchange="sendValueToServlet(this.value)" >--%>
<%--              <option value="전체">전체</option>--%>
<%--              <option value="서울특별시">서울특별시</option>--%>
<%--              <option value="경기도">경기도</option>--%>
<%--              <option value="경상도">경상도</option>--%>
<%--              <option value="강원도">강원도</option>--%>
<%--              <option value="충청도">충청도</option>--%>
<%--              <option value="전라도">전라도</option>--%>
<%--            </select>--%>
<%--          </div>--%>
<%--          <div class="searchComponent-searchBar-list-key">개설지점</div>--%>
<%--          <div class="searchComponent-searchBar-list-value">--%>
<%--            <input value="" type="text" id="branch" oninput="sendValueToServlet(event.target.value)">--%>
<%--          </div>--%>
<%--        </div>--%>
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
        <div class="listComponent-topbar-element">선택</div>
        <div class="listComponent-topbar-element">이름</div>
        <div class="listComponent-topbar-element">성별</div>
        <div class="listComponent-topbar-element">나이</div>
        <div class="listComponent-topbar-elementMedium">직업</div>
<%--        <div class="listComponent-topbar-elementMedium">거주지</div>--%>
        <div class="listComponent-topbar-elementBig">고객등급</div>
<%--        <div class="listComponent-topbar-elementBig">개설지점</div>--%>
        <div class="listComponent-topbar-elementBig">가입기간</div>
        <div class="listComponent-topbar-elementBig">자산</div>
        <div class="listComponent-topbar-elementBig">개인정보동의</div>
        <div class="listComponent-topbar-elementBig">어플접속일</div>
      </div>
      <div id="resultContainer">
        <%
          List<appPromotionMessageDTO> custInfos = (List<appPromotionMessageDTO>) request.getAttribute("custInfos");
          if (custInfos != null) {
            for (appPromotionMessageDTO custInfo : custInfos) { %>
        <div class="listComponent-listbar">
          <div class="listComponent-topbar-element bg-white">
            <input type="checkbox" checked>
          </div>
          <div class="listComponent-topbar-element bg-white">
            <%= custInfo.getCustNm() %>
          </div>
          <div class="listComponent-topbar-element bg-white">
            <%= custInfo.getGender() %>
          </div>
          <div class="listComponent-topbar-element bg-white">
            <%= custInfo.getAge() %>
          </div>
          <div class="listComponent-topbar-elementMedium bg-white">
            <%= custInfo.getJob()%>
          </div>
<%--          <div class="listComponent-topbar-elementMedium bg-white">--%>
<%--            <%= custInfo.getAddress()%>--%>
<%--          </div>--%>
          <div class="listComponent-topbar-elementBig bg-white">
            <%= custInfo.getCustGrade()%>
          </div>
<%--          <div class="listComponent-topbar-elementBig bg-white">--%>
<%--            <%= custInfo.getBranch() %>--%>
<%--          </div>--%>
          <div class="listComponent-topbar-elementBig bg-white">
            <%= custInfo.getSubTerm()%>
          </div>
          <div class="listComponent-topbar-elementBig bg-white">
            <%= custInfo.getAsset()%>
          </div>
          <div class="listComponent-topbar-elementBig bg-white">
            <%= custInfo.getPrivacy()%>
          </div>
          <div class="listComponent-topbar-elementBig bg-white">
            <%= custInfo.getRecLoginDate()%>
          </div>
        </div>
        <% } } %>

      </div>

    </div>
  </section>
</main>
</body>
</html>
