
<%--<%@ page import="productPromotionPackage.productPromotionMessageDTO" %>--%>
<%@ page import="overdueNotificationMessage.overdueNotificationDTO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>

<html>
<head>
  <title>하나로 메세지</title>
  <link rel="stylesheet" href="/pages/manageMessage/overdueNotificationManage/overdueNotificationModify.css" >


</head>
<body>


<main>
  <form action="/overdueNotificationModifyServlet" method="POST" >
    <section class="mainComponent">
      <div class="searchComponent">
        <div class="searchComponent-topBar">
          <div class="searchComponent-topBar-left">
            상환관리 안내 메시지 수정
          </div>

        </div>

        <div class="searchComponent-titleBar">상환관리 안내 메시지</div>

        <div class="searchComponent-searchBar">
          <div class="searchComponent-searchBar-list">
            <div class="searchComponent-searchBar-list-key">성별</div>
            <div class="searchComponent-searchBar-list-value">
              <div class="checkbox">
                <input type="checkbox" name="man" value="M" class="flex align-center" id="man" <%= request.getParameter("gender") != null && request.getParameter("gender").length() > 1 && request.getParameter("gender").charAt(0) == 'M' ? "checked" : "" %>>
                <div>남자</div>
              </div>
              <div class="checkbox">
                <input  type="checkbox" name="woman" value="F" id="woman" <%= request.getParameter("gender") != null && request.getParameter("gender").length() > 1 && request.getParameter("gender").charAt(1) == 'F' ? "checked" : "" %>>
                <div>여자</div>
              </div>
            </div>


            <div class="searchComponent-searchBar-list-key">개인정보동의여부</div>
            <div class="searchComponent-searchBar-list-value">
              <div class="checkbox">
                <input  type="checkbox" name="privacyYes" value="Y" class="flex align-center" id="privacyYes" <%= "O".equals(request.getParameter("privacyYes")) ? "checked" : "" %>>
                <div>동의</div>
              </div>
            </div>
          </div>

          <div class="searchComponent-searchBar-list">
            <div class="searchComponent-searchBar-list-key">나이</div>
            <div class="searchComponent-searchBar-list-value" id="ageContainer">
              <%
                String ageValue = (String) request.getParameter("age");
                System.out.println( request.getParameter("id"));
              %>
             <% if(ageValue != null) { %>
              <select name="age" id="age">
                <option value="전체" <%= "전체".equals(ageValue) ? "selected" : "" %>>전체</option>
                <option value="20대" <%= "20대".equals(ageValue) ? "selected" : "" %>>20대</option>
                <option value="30대" <%= "30대".equals(ageValue) ? "selected" : "" %>>30대</option>
                <option value="40대" <%= "40대".equals(ageValue) ? "selected" : "" %>>40대</option>
                <option value="50대" <%= "50대".equals(ageValue) ? "selected" : "" %>>50대</option>
                <option value="60대" <%= "60대".equals(ageValue) ? "selected" : "" %>>60대</option>
                <option value="70대 이상" <%= "70대 이상".equals(ageValue) ? "selected" : "" %>>70대 이상</option>
              </select>
            <%
              }
            %>
            </div>

            <div class="searchComponent-searchBar-list-key">연체여부</div>
            <div class="searchComponent-searchBar-list-value">
              <div class="checkbox">
                <input type="checkbox" name="overdueYes" value="O" class="flex align-center" id="overdueYes" <%= request.getParameter("overdue") != null && request.getParameter("overdue").length() > 1 && request.getParameter("overdue").charAt(0) == 'O' ? "checked" : "" %>>
                <div>연체</div>
              </div>
              <div class="checkbox">
                <input type="checkbox" name="overdueNo" value="X" id="overdueNo" <%= request.getParameter("overdue") != null && request.getParameter("overdue").length() > 1 && request.getParameter("overdue").charAt(1) == 'X' ? "checked" : "" %>>
                <div>미연체</div>
              </div>
            </div>
          </div>
          <div class="searchComponent-searchBar-list">
            <div class="searchComponent-searchBar-list-key">고객등급</div>
            <div class="searchComponent-searchBar-list-value">
              <!-- 고객등급 -->
              <select name="custGrade" id="custGrade" >
                <option value="전체" <%= "전체".equals(request.getParameter("custGrade")) ? "selected" : "" %>>전체</option>
                <option value="1" <%= "1".equals(request.getParameter("custGrade")) ? "selected" : "" %>>1</option>
                <option value="2" <%= "2".equals(request.getParameter("custGrade")) ? "selected" : "" %>>2</option>
                <option value="3" <%= "3".equals(request.getParameter("custGrade")) ? "selected" : "" %>>3</option>
                <option value="4" <%= "4".equals(request.getParameter("custGrade")) ? "selected" : "" %>>4</option>
                <option value="5" <%= "5".equals(request.getParameter("custGrade")) ? "selected" : "" %>>5</option>
              </select>

            </div>
            <div class="searchComponent-searchBar-list-key">자산</div>
            <div class="searchComponent-searchBar-list-value">
              <!-- 자산 -->
              <select name="asset" id="asset" >
                <option value="전체" <%= "전체".equals(request.getParameter("asset")) ? "selected" : "" %>>전체</option>
                <option value="100만원 이하" <%= "100만원 이하".equals(request.getParameter("asset")) ? "selected" : "" %>>100만원 이하</option>
                <option value="100만원에서 1000만원" <%= "100만원에서 1000만원".equals(request.getParameter("asset")) ? "selected" : "" %>>100만원~1000만원</option>
                <option value="1000만원에서 3000만원" <%= "1000만원에서 3000만원".equals(request.getParameter("asset")) ? "selected" : "" %>>1000만원-3000만원</option>
                <option value="3000만원 이상" <%= "3000만원 이상".equals(request.getParameter("asset")) ? "selected" : "" %>>3000만원 이상</option>
              </select>

            </div>
          </div>
          <div class="searchComponent-searchBar-list">
            <div class="searchComponent-searchBar-list-key">신용등급</div>
            <div class="searchComponent-searchBar-list-value">
              <!-- 신용등급 -->
              <select name="creditRating" id="creditRating" >
                <option value="전체" <%= "전체".equals(request.getParameter("creditRating")) ? "selected" : "" %>>전체</option>
                <option value="1" <%= "1".equals(request.getParameter("creditRating")) ? "selected" : "" %>>1</option>
                <option value="2" <%= "2".equals(request.getParameter("creditRating")) ? "selected" : "" %>>2</option>
                <option value="3" <%= "3".equals(request.getParameter("creditRating")) ? "selected" : "" %>>3</option>
                <option value="4" <%= "4".equals(request.getParameter("creditRating")) ? "selected" : "" %>>4</option>
                <option value="5" <%= "5".equals(request.getParameter("creditRating")) ? "selected" : "" %>>5</option>
                <option value="6" <%= "6".equals(request.getParameter("creditRating")) ? "selected" : "" %>>6</option>
                <option value="7" <%= "7".equals(request.getParameter("creditRating")) ? "selected" : "" %>>7</option>
                <option value="8" <%= "8".equals(request.getParameter("creditRating")) ? "selected" : "" %>>8</option>
                <option value="9" <%= "9".equals(request.getParameter("creditRating")) ? "selected" : "" %>>9</option>
                <option value="10" <%= "10".equals(request.getParameter("creditRating")) ? "selected" : "" %>>10</option>
              </select>

            </div>
                <div class="searchComponent-searchBar-list-key">이름</div>
                <div class="searchComponent-searchBar-list-value">
                  <%--              이름--%>
                  <%--              <input name="branch" value="<%= request.getParameter("branch") %>" type="text" id="branch" >--%>
                  <input value="<%= request.getParameter("custNm") %>" type="text" id="name" name="custNm">
                </div>
<%--            <div class="searchComponent-searchBar-list-key">가입 기간</div>--%>
<%--            <div class="searchComponent-searchBar-list-value">--%>
<%--              <!-- 가입 기간 -->--%>
<%--              <select name="period" id="period" >--%>
<%--                <option value="전체" <%= "전체".equals(request.getParameter("period")) ? "selected" : "" %>>전체</option>--%>
<%--                <option value="1년 미만" <%= "1년 미만".equals(request.getParameter("period")) ? "selected" : "" %>>1년 미만</option>--%>
<%--                <option value="1년-3년" <%= "1년-3년".equals(request.getParameter("period")) ? "selected" : "" %>>1년-3년</option>--%>
<%--                <option value="3년-5년" <%= "3년-5년".equals(request.getParameter("period")) ? "selected" : "" %>>3년-5년</option>--%>
<%--                <option value="5년-10년" <%= "5년-10년".equals(request.getParameter("period")) ? "selected" : "" %>>5년-10년</option>--%>
<%--                <option value="10년 이상" <%= "10년 이상".equals(request.getParameter("period")) ? "selected" : "" %>>10년 이상</option>--%>
<%--              </select>--%>

<%--            </div>--%>
          </div>
        </div>

      </div>

    </section>
    <section class="textComponent">
      <div class="searchComponent-topBar-right">메세지 제목</div>
      <input name="mTitle" value="<%= request.getParameter("mTitle") %>" class="textComponent-messageInput">
      <div class="searchComponent-topBar-right">메세지 내용</div>
      <textarea name="mContents" class="textComponent-titleInput"><%= request.getParameter("mContents") %></textarea>
      <div class="buttonList">
        <button class="submitButton" type="submit">저장</button>
        <a class="cancelButton" href="/">취소</a>
      </div>
      <input name="tableId" hidden="" value="<%= request.getParameter("id") %>" >
    </section>
  </form>
</main>

</body>
</html>
