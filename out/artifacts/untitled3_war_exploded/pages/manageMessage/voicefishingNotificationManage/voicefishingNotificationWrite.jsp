
<%@ page import="voicefishingNotificationMessagePackage.voicefishingNotificationCustomizeDTO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<html>
<head>
    <title>하나로 메세지</title>

    <link rel="stylesheet" href="/pages/manageMessage/voicefishingNotificationManage/voicefishingNotificationWrite.css" >
    <%--    <script src="/pages/manageMessage/vociefishingNotificationManage/voicefishingNotificationWrite.js"></script>--%>
</head>
<body>


<main>
    <form action="/voicefishingNotificationWrite" method="POST" >
        <section class="mainComponent">
            <div class="searchComponent">
                <div class="searchComponent-topBar">
                    <div class="searchComponent-topBar-left">
                        보이스피싱 예빙 안내 메시지 추가
                    </div>

                </div>

                <div class="searchComponent-titleBar">보이스피싱 예방 안내 메시지</div>

                <div class="searchComponent-searchBar">
                    <div class="searchComponent-searchBar-list">

                        <div class="searchComponent-searchBar-list-key">개인정보동의여부</div>
                        <div class="searchComponent-searchBar-list-value">
                            <div class="checkbox">
                                <input  onclick="sendValueToServlet(this)" type="checkbox" name="privacyYes" value="O" class="flex align-center" id="privacyYes">
                                <div>동의</div>
                            </div>
                        </div>

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

                    </div>

                    <div class="searchComponent-searchBar-list">
                        <div class="searchComponent-searchBar-list-key">이름</div>
                        <div class="searchComponent-searchBar-list-value">
                            <input value="" type="text" name="name" id="name" oninput="sendValueToServlet(event.target.value)">
                        </div>

                        <div class="searchComponent-searchBar-list-key"></div>
                        <div class="searchComponent-searchBar-list-value">
                        </div>

                    </div>


                </div>

            </div>

        </section>
        <section class="textComponent">
            <div class="searchComponent-topBar-right">메세지 제목</div>
            <input name="mContents" class="textComponent-messageInput">
            <div class="searchComponent-topBar-right">메세지 내용</div>
            <textarea name="mContents" class="textComponent-titleInput"></textarea>
            <div class="buttonList">
                <button class="submitButton" type="submit">저장</button>
                <a class="cancelButton" href="/">취소</a>
            </div>
        </section>
    </form>
</main>
</body>
</html>
