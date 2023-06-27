<%@ page import="voicefishingNotificationMessagePackage.voicefishingNotificationDTO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="voicefishingNotificationMessagePackage.voicefishingNotificationCustomizeDAO" %>
<%@ page import="voicefishingNotificationMessagePackage.voicefishingNotificationCustomizeDTO" %>
<%@ page import="email.emailPromotionDAO" %>
<%@ page import="java.lang.reflect.Array" %>
<html>
<head>
    <title>하나로 메세지</title>
    <link rel="stylesheet" href="/pages/sendMessage/voicefishingNotificationMessage/voicefishingNotificationMessage.css" >
    <script src="/pages/sendMessage/voicefishingNotificationMessage/voicefishingNotificationMessage.js"></script>
</head>
<body>
<%

%>
<main>
  
    <jsp:include page="/components/sidebar.jsp" />
    <section class="mainComponent">
        <%
            voicefishingNotificationCustomizeDAO dao = new voicefishingNotificationCustomizeDAO();
            List<voicefishingNotificationCustomizeDTO> infos = dao.selectMessage();

        %>
        <div class="searchComponent">
            <div class="searchComponent-topBar">
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

        <div class="myMessage">
            <div style="margin-left:1.5vw; margin-right:1vw; width:120px;height:4vh;background-color:#008485; border-radius: 5px; display:flex; justify-content: center;
                            align-items:center; color:white;">마이메세지</div>

            <div class="myMessage-list">

                <%

                    if (infos != null) {


                        for (voicefishingNotificationCustomizeDTO custInfo : infos)
                        { %>
                <div class="myMessage-list-element" style="" onclick="modifyMessage([
                        '<%=custInfo.getId() %>',
                        '<%=custInfo.getCustNm() %>',
                        '<%=custInfo.getAge() %>',
                        '<%=custInfo.getAddress() %>',
                        '<%=custInfo.getAsset() %>',
                        '<%=custInfo.getPrivacy() %>',
                        '<%=custInfo.getProdNm() %>',
                        '<%=custInfo.getMContents() %>',
                        '<%=custInfo.getId()%>'
                        ])">


                    <%=
                    custInfo.getProdNm()
                    %>
                </div>

                <%
                        }}
                %>
            </div>
        </div>
        <div id="resultContainer" class="listComponent2">
            <form method="post" action="/pages/email/sendEmail.jsp" style="width:100%; display:flex; flex-direction: column; justify-content: center; align-items: center;" >

                    <%  int count = 0;
                List<voicefishingNotificationDTO> custInfos = (List<voicefishingNotificationDTO>) request.getAttribute("custInfos");
                java.util.Date currentDate = new java.util.Date();
                java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                String formattedDate = sdf.format(currentDate);
            %>
                <input hidden="" value="보이스피싱 예방 안내 프로모션" name="category">
                <%--            value값 수정--%>



                <input hidden="" value="<%= formattedDate %>" name="date">
                <table style="display:flex;justify-content: space-between; width: 90%; background: red;" >
                    <tr  hidden="">

                        <td hidden="">
                            보내는 사람 : <input type="text" name="from" value="hanaromessage@naver.com" />
                        </td>
                    </tr>
                    <tr hidden="">
                        <td hidden="">
                            받는 사람 : <input type="text" name="to" value="hanaromessage@naver.com" />
                        </td>
                    </tr>
                    <div style=" display:flex; width:90%; justify-content: space-between;">

                        <div style=" width:15%;height:4vh;background-color:#008485; border-radius: 5px; display:flex; justify-content: center;
                            align-items:center; color:white;
                         ">메시지 제목</div>
                        <input style=" width:80%; height:4vh; border: 2px solid #008485;" type="text" name="subject" id="prodNm"  value="" />

                    </div>
                    <div style=" display:flex; width:90%; align-items: center; justify-content: space-between;  margin-top:1vh;">

                        <div style=" width:15%;height:4vh;background-color:#008485; border-radius: 5px; display:flex; justify-content: center;
                            align-items:center; color:white;
                         ">
                            메세지 형식
                        </div>
                        <div style=" width:80%; height:4vh;display:flex; align-items: center; ">
                            <input  type="radio" name="format" value="text" checked />Text
                            <input type="radio" name="format" value="html" />HTML
                        </div>


                    </div>
                    <div style=" display:flex; width:90%; justify-content: space-between; margin-top:1vh;">

                        <div style=" width:15%; height:4vh;background-color:#008485; border-radius: 5px; display:flex; justify-content: center;
                            align-items:center; color:white;
                         ">메세지 내용</div>
                        <textarea style=" width:80%; height:20vh; border: 2px solid #008485;" name="content" id="mContents" cols="60" rows="10"></textarea>

                    </div>
                    <div style="display:flex; width:90%; justify-content: flex-end; margin-top:1vh;">
                        <button style="width:15%; height:4vh; background:white; border:1px solid #cccccc;" type="submit">전송하기</button>
                    </div>
                </table>

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
            <%

                if (custInfos != null) {
                    for (voicefishingNotificationDTO custInfo : custInfos) {
                        count++;
            %>
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

            <input hidden="" value="<%=count%>" name="counts">
            <input hidden="" id="getName"  name="name">
            <input hidden="" id="getAsset"  name="asset">
            <input hidden="" id="getPrivacyYes"  name="privacyYes">
            <input hidden="" id="getAge"  name="age">
            <input hidden="" id="getLocation"  name="location">

            </div>
            </form>
        </div>
    </section>
</main>
<script>


</script>
</body>
</html>
