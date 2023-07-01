<%@ page import="allNoticePackage.allNoticePackageDTO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="allNoticePackage.allNoticeCustomizeDAO" %>
<%@ page import="allNoticePackage.allNoticeCustomizeDTO" %>
<html>
<head>
    <title>하나로 메세지</title>
    <link rel="stylesheet" href="/pages/sendMessage/allNotificationMessage/allNotificationMessage.css?ver=1" >
    <script src="/pages/sendMessage/allNotificationMessage/allNotificationMessage.js?ver=1"></script>
</head>
<body>
<jsp:include page="/components/header.jsp" />
<main>
    <jsp:include page="/components/sidebar.jsp" />
    <section class="mainComponent">
        <%
            allNoticeCustomizeDAO dao = new allNoticeCustomizeDAO();
            List<allNoticeCustomizeDTO> infos = dao.selectMessage();

        %>
        <div class="searchComponent">
            <div class="searchComponent-topBar">
                <div class="searchComponent-topBar-left">전체 안내 메세지 관리</div>
            </div>
            <div class="searchComponent-titleBar">전체 안내 메시지</div>
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
                            <input  onclick="sendValueToServlet(this)" type="checkbox" name="privacyYes" value="O" class="flex align-center" id="privacyYes">
                            <div>동의</div>
                        </div>
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
                    <div class="searchComponent-searchBar-list-key">이름</div>
                    <div class="searchComponent-searchBar-list-value">
                        <input value="" type="text" id="name" oninput="sendValueToServlet(event.target.value)">
                    </div>
                </div>
            </div>

        </div>
        <%--메시지 + 출력 시작--%>
        <div class="myMessage">
            <div style="width:15%;height:4vh;background-color:#008485; border-radius: 5px; display:flex; justify-content: center;
                            align-items:center; color:white;">마이메세지</div>

            <div class="myMessage-list">

                <%

                    if (infos != null) {

                        for (allNoticeCustomizeDTO custInfo : infos)
                        { %>
                <div class="myMessage-list-element" style="" onclick="modifyMessage([
                        '<%=custInfo.getId() %>',
                        '<%=custInfo.getCustNm() %>',
                        '<%=custInfo.getAge() %>',
                        '<%=custInfo.getPrivacy() %>',
                        '<%=custInfo.getLocation()%>',
                        '<%=custInfo.getMContents() %>',
                        '<%=custInfo.getMTitle()%>'
                        ])">


                    <%=
                    custInfo.getMTitle()
                    %>
                </div>

                <%
                        }}
                %>
            </div>
        </div>
        <%--현재버전--%>
        <div id="resultContainer" class="listComponent2">
            <form method="post" action="/pages/email/allNotificationSendEmail/allNotificationSendEmail.jsp" style="width:100%; display:flex; flex-direction: column; justify-content: center; align-items: center;" >

                <%  int count = 0;
                    if(request.getAttribute("custInfos")!=null) {
                        int custInfos = (int) request.getAttribute("custInfos");
                    }

//                System.out.println(custInfos);
                    java.util.Date currentDate = new java.util.Date();
                    java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                    String formattedDate = sdf.format(currentDate);
                %>
                <input hidden="" value="전체안내" name="category">
                <%--            value값 수정--%>



                <input hidden="" value="<%= formattedDate %>" name="date">
                <table style="display:flex;justify-content: space-between; width: 90%; background: red;" >
                    <tr  hidden="">

                        <td hidden="">
                            보내는 사람 : <input type="text" name="from" value="hanaromessage@naver.com" />
                        </td>
                    </tr>

                    <div style=" display:flex; width:90%; justify-content: space-between;">

                        <div style=" width:15%;height:4vh;background-color:#008485; border-radius: 5px; display:flex; justify-content: center;
                            align-items:center; color:white;
                         ">메시지제목</div>
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
                        <div class="listComponent-topbar-elementBig">고객코드</div>
                        <div class="listComponent-topbar-elementBig">이름</div>
                        <div class="listComponent-topbar-elementBig">나이</div>
                        <div class="listComponent-topbar-elementBig">거주지</div>
                        <div class="listComponent-topbar-elementBig">개인정보동의</div>
                        <div class="listComponent-topbar-elementBig">전화번호</div>
                        <div class="listComponent-topbar-elementBig">이메일</div>
                    </div>
                    <%
                        List<allNoticePackageDTO> pageInfos = (List<allNoticePackageDTO>) request.getAttribute("pageInfos");
                        if (pageInfos != null) {
                            for (allNoticePackageDTO custInfo : pageInfos) {
                                count++;
                                if (count > 10){ break;} // 트래픽 과다 방지용(10개만)
                    %>
                    <div class="listComponent-listbar">


                        <input hidden="" type="text" name="to" value="<%=custInfo.getEmail()%>" />

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

                    <%  } %>
                    <%--                    페이지네이션--%>
                    <div style="display:flex">
                        <%  if(request.getAttribute("custInfos")!=null) {
                            int custInfos = (int) request.getAttribute("custInfos");
                            int pageCount = 0;
                            int pageLength = custInfos/10+1;

                            for (int i = 0; i<pageLength; i++) {

                        %>
                        <%--                        서블릿으로 전송--%>
                        <div onclick="sendPageValueToServlet(<%=(pageCount)*10%>,<%=10%>)">
                            <%= pageCount+1%>
                        </div>
                        <%
                                    pageCount++;
                                }
                            }
                        %>
                    </div>
                    <input hidden="" value="<%= pageInfos.size()%>" name="counts">
                    <%
                        }
                    %>
                    <%

                    %>
                    <div>

                    </div>
                    <%--                    어떻게 필터링 하고 보냈는지 저장용--%>
                    <%--                    <input hidden="" value="<%= pageInfos.size()%>" name="counts">--%>
                    <input hidden="" id="getName"  name="name">
                    <input hidden="" id="getPrivacyYes"  name="privacyYes">
                    <input hidden="" id="getAge"  name="age">
                    <input hidden="" id="getLocation"  name="location">
                    <%--                    <input hidden="" id="getJob"  name="job">--%>
                    <%--                    <input hidden="" id="getPrivate"  name="private">--%>

                </div>
            </form>
        </div>
    </section>
</main>
</body>
</html>
