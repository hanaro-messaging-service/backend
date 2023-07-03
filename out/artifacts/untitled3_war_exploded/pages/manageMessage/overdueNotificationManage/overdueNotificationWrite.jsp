<%@ page import="productPromotionPackage.productPromotionMessageDTO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<html>
<head>
    <title>하나로 메세지</title>

    <link rel="stylesheet" href="/pages/manageMessage/overdueNotificationManage/overdueNotificationWrite.css" >
    <%--    <script src="/pages/manageMessage/productPromotionManage/productPromotionWrite.js"></script>--%>
</head>
<body>


<main>
    <form action="/overdueNotificationWrite" method="POST" >
        <section class="mainComponent">
            <div class="searchComponent">
                <div class="searchComponent-topBar">
                    <div class="searchComponent-topBar-left">
                        상환관리 메시지 추가
                    </div>

                </div>

                <div class="searchComponent-titleBar">상환관리 메시지</div>

                <div class="searchComponent-searchBar">
                    <div class="searchComponent-searchBar-list">
                        <div class="searchComponent-searchBar-list-key">성별</div>
                        <div class="searchComponent-searchBar-list-value">
                            <div class="checkbox">
                                <input onchange="sendValueToServlet(this)" type="checkbox" name="man" value="M" class="flex align-center" id="man">
                                <div>남자</div>
                            </div>
                            <div class="checkbox">
                                <input onchange="sendValueToServlet(this)" type="checkbox" name="woman" value="F" id="woman">
                                <div>여자</div>
                            </div>
                        </div>

                        <div class="searchComponent-searchBar-list-key">개인정보동의여부</div>
                        <div class="searchComponent-searchBar-list-value">
                            <div class="checkbox">
                                <input onclick="sendValueToServlet(this)" type="checkbox" name="privacyYes" value="O" class="flex align-center" id="privacyYes">
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
                                <input onchange="sendValueToServlet(this)" type="checkbox" name="overdueYes" value="O" class="flex align-center" id="overdueYes">
                                <div>연체</div>
                            </div>
                            <div class="checkbox">
                                <input onchange="sendValueToServlet(this)" type="checkbox" name="overdueNo" value="X" id="overdueNo">
                                <div>미연체</div>
                            </div>
                        </div>
                    </div>
                    <div class="searchComponent-searchBar-list">
                        <div class="searchComponent-searchBar-list-key">고객등급</div>
                        <div class="searchComponent-searchBar-list-value">
                            <select name="custGrade" id="custGrade" onchange="sendValueToServlet(this.value)">
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
                        <div class="searchComponent-searchBar-list-key">신용등급</div>
                        <div class="searchComponent-searchBar-list-value">
                            <div class="searchComponent-searchBar-list-value">
                                <select name="creditRating" id="creditRating" onchange="sendValueToServlet(this.value)">
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
                        </div>
                        <div class="searchComponent-searchBar-list-key">이름</div>
                        <div class="searchComponent-searchBar-list-value">
                            <input name="name" value="" type="text" id="name" oninput="sendValueToServlet(event.target.value)">
                        </div>
                    </div>
                </div>

            </div>

        </section>
        <section class="textComponent">
            <div class="searchComponent-topBar-right">메세지 제목</div>
            <input name="mTitle" class="textComponent-messageInput">
            <div class="searchComponent-topBar-right">메세지 내용</div>
            <textarea name="mContents" class="textComponent-titleInput"></textarea>
            <div class="buttonList">
                <button class="submitButton" type="submit">저장</button>
                <a class="cancelButton" href="/pages/manageMessage/overdueNotificationManage/overdueNotificationManage.jsp">취소</a>
            </div>
        </section>
    </form>
</main>
</body>
</html>