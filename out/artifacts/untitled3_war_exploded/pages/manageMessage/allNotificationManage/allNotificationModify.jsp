
<%--<%@ page import="productPromotionPackage.productPromotionMessageDTO" %>--%>
<%@ page import="allNoticePackage.allNoticePackageDTO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>

<html>
<head>
    <title>하나로 메세지</title>
    <link rel="stylesheet" href="/pages/manageMessage/allNotificationManage/allNotificationModify.css" >

</head>
<body>


<main>
    <form action="/allNotificationModifyServlet" method="POST" >
        <section class="mainComponent">
            <div class="searchComponent">
                <div class="searchComponent-topBar">
                    <div class="searchComponent-topBar-left">
                        전체 안내 메시지 수정
                    </div>

                </div>

                <div class="searchComponent-titleBar">전체 안내 메시지</div>

                <div class="searchComponent-searchBar">
                    <div class="searchComponent-searchBar-list">
                        <div class="searchComponent-searchBar-list-key">나이</div>
                        <div class="searchComponent-searchBar-list-value" id="ageContainer">
                            <%
                                String ageValue = (String) request.getParameter("age");
                                System.out.println(request.getParameter("id"));
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


                        <div class="searchComponent-searchBar-list-key">개인정보동의여부</div>
                        <div class="searchComponent-searchBar-list-value">
                            <div class="checkbox">
                                <input  type="checkbox" name="privacyYes" value="Y" class="flex align-center" id="privacyYes" <%= "Y".equals(request.getParameter("privacyYes")) ? "checked" : "" %>>
                                <div>동의</div>
                            </div>
                        </div>
                    </div>

                    <div class="searchComponent-searchBar-list">
                        <div class="searchComponent-searchBar-list-key">거주지</div>
                        <div class="searchComponent-searchBar-list-value">
                            <!-- 거주지 -->
                            <%
                                System.out.println(request.getParameter("location"));
                            %>
                            <select name="location" id="location">
                                <option value="전체" <%= "전체".equals(request.getParameter("location")) ? "selected" : "" %>>전체</option>
                                <option value="서울특별시" <%= "서울특별시".equals(request.getParameter("location")) ? "selected" : "" %>>서울특별시</option>
                                <option value="경기도" <%= "경기도".equals(request.getParameter("location")) ? "selected" : "" %>>경기도</option>
                                <option value="경상도" <%= "경상도".equals(request.getParameter("location")) ? "selected" : "" %>>경상도</option>
                                <option value="강원도" <%= "강원도".equals(request.getParameter("location")) ? "selected" : "" %>>강원도</option>
                                <option value="충청도" <%= "충청도".equals(request.getParameter("location")) ? "selected" : "" %>>충청도</option>
                                <option value="전라도" <%= "전라도".equals(request.getParameter("location")) ? "selected" : "" %>>전라도</option>
                            </select>
                        </div>
                        <div class="searchComponent-searchBar-list-key"></div>
                        <div class="searchComponent-searchBar-list-value"></div>
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
