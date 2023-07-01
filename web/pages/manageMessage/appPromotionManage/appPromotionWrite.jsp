
<%@ page import="productPromotionPackage.productPromotionMessageDTO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<html>
<head>
    <title>하나로 메세지</title>

    <link rel="stylesheet" href="/pages/manageMessage/appPromotionManage/appPromotionWrite.css" >
    <%--    <script src="/pages/manageMessage/productPromotionManage/productPromotionWrite.js"></script>--%>
</head>
<body>


<main>
    <form action="/appPromotionWriteServlet" method="POST" >
        <section class="mainComponent">
            <div class="searchComponent">
                <div class="searchComponent-topBar">
                    <div class="searchComponent-topBar-left">
                         어플리케이션 프로모션 메시지 추가
                    </div>

                </div>

                <div class="searchComponent-titleBar">수신 상품 프로모션 메시지</div>

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
                                <input  onclick="sendValueToServlet(this)" type="checkbox" name="privacyYes" value="Y" class="flex align-center" id="privacyYes">
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
                    <div class="searchComponent-searchBar-list">
                        <div class="searchComponent-searchBar-list-key">이름</div>
                        <div class="searchComponent-searchBar-list-value">
                            <input value="" type="text" name="name" id="name" oninput="sendValueToServlet(event.target.value)">
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

                </div>

            </div>

        </section>
        <section class="textComponent">
            <div class="searchComponent-topBar-right">메세지 제목</div>
            <input name="prodNm" class="textComponent-messageInput">
            <div class="searchComponent-topBar-right">메세지 내용</div>
            <textarea name="mContents" class="textComponent-titleInput"></textarea>
            <div class="buttonList">
                <button class="submitButton" type="submit">저장</button>
                <a class="cancelButton" href="/pages/manageMessage/appPromotionManage/appPromotionManage.jsp">취소</a>
            </div>
        </section>
    </form>
</main>
</body>
</html>
