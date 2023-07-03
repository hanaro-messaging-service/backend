
<%@ page import="voicefishingNotificationMessagePackage.voicefishingNotificationDTO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="email.emailPromotionDAO" %>
<html>
<head>
    <title>하나로 메시지</title>

    <link rel="stylesheet" href="/pages/messageList/voicefishingNotificationMessageList/voicefishingNotificationMessageDetail.css" >
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <!-- 차트 링크 -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>

</head>
<body>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
        integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
        crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
        integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
        crossorigin="anonymous"></script>
<!-- 차트 -->

<%
    emailPromotionDAO dao = new emailPromotionDAO();
    int viewCount = dao.showChart();
%>
<main>
    <form action="/VoicefishingNotificationModifyServlet" method="POST" >
        <section class="mainComponent">
            <div class="searchComponent">
                <div class="searchComponent-topBar">
                    <div class="searchComponent-topBar-left">
                        보이스피싱 예방 안내 발송 상세내역
                    </div>

                </div>

                <div class="searchComponent-titleBar">보이스피싱 예방 안내 메시지</div>

                <div class="searchComponent-searchBar">
                    <div class="searchComponent-searchBar-list">

                        <div class="searchComponent-searchBar-list-key">개인정보동의여부</div>
                        <div class="searchComponent-searchBar-list-value">
                            <div class="checkbox">
                                <input  type="checkbox" name="privacyYes" value="O" class="flex align-center" id="privacyYes" <%= "O".equals(request.getParameter("privacyYes")) ? "checked" : "" %>>
                                <div>동의</div>
                            </div>
                        </div>

                        <div class="searchComponent-searchBar-list-key">나이</div>
                        <div class="searchComponent-searchBar-list-value" id="ageContainer">
                            <%
                                String ageValue = (String) request.getParameter("age");

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
                    </div>

                    <div class="searchComponent-searchBar-list">
                        <div class="searchComponent-searchBar-list-key">이름</div>
                        <div class="searchComponent-searchBar-list-value">
                            <input value="<%= request.getParameter("custNm") %>" type="text" id="name" name="custNm">
                        </div>

                        <div class="searchComponent-searchBar-list-key">메시지 전송시간</div>
                        <div class="searchComponent-searchBar-list-value">
                            <%= request.getParameter("time") %>
                        </div>

                    </div>
                    <div class="searchComponent-searchBar-list">
                        <div class="searchComponent-searchBar-list-key">메시지 발송수</div>
                        <div class="searchComponent-searchBar-list-value" id="counts">
                            <%= request.getParameter("counts") %>

                        </div>
                        <div class="searchComponent-searchBar-list-key"></div>
                        <div class="searchComponent-searchBar-list-value" id="time">

                        </div>
                    </div>

                </div>

            </div>

        </section>
        <section class="textComponent">
            <div style="width:100%;">
                <div class="searchComponent-topBar-right">메시지 제목</div>
                <input name="prodNm" value="<%= request.getParameter("title") %>" class="textComponent-messageInput">

                <div class="searchComponent-topBar-right">메시지 내용</div>
                <textarea name="mContents" class="textComponent-titleInput"><%= request.getParameter("contents") %></textarea>
                <input name="tableId" hidden="" value="<%= request.getParameter("id") %>" >
            </div>
            <div>

                <!-- 부트스트랩 -->
                <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
                        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
                        crossorigin="anonymous"></script>
                <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
                        integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
                        crossorigin="anonymous"></script>
                <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
                        integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
                        crossorigin="anonymous"></script>

            </div>
            <div class="buttonList">
                <a class="cancelButton" href="/pages/messageList/voicefishingNotificationMessageList/voicefishingNotificationMessageList.jsp">목록</a>
            </div>
        </section>
    </form>
</main>
<script>
    // <input> 요소에 disabled 속성 적용
    var inputElements = document.querySelectorAll("input");
    for (var i = 0; i < inputElements.length; i++) {
        inputElements[i].disabled = true;
    }

    // <select> 요소에 disabled 속성 적용
    var selectElements = document.querySelectorAll("select");
    for (var i = 0; i < selectElements.length; i++) {
        selectElements[i].disabled = true;
    }
    // <textarea> 요소에 disabled 속성 적용
    var textareaElements = document.querySelectorAll("textarea");
    for (var i = 0; i < textareaElements.length; i++) {
        textareaElements[i].disabled = true;
    }

    var ctx = document.getElementById('myChart');
    var time =document.getElementById('time').innerHTML;
    var counts = document.getElementById('counts').innerHTML;
    var view = document.getElementById('view').innerHTML;
    var myChart = new Chart(ctx, {
        type: 'bar',
        data: {
            labels: [`메세지`, '응답'],
            datasets: [{
                label: '메세지/응답',
                data: [counts, view],
                backgroundColor: [
                    'rgba(255, 99, 132, 0.2)',
                    'rgba(54, 162, 235, 0.2)',
                ],
                borderColor: [
                    'rgba(255, 99, 132, 1)',
                    'rgba(54, 162, 235, 1)',
                ],
                borderWidth: 1
            }]
        },
        options: {
            scales: {
                yAxes: [{
                    ticks: {
                        beginAtZero: true
                    }
                }]
            }
        }
    });

</script>
</body>
</html>