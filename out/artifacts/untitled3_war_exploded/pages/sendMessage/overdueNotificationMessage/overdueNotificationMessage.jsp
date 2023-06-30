
<%@ page import="overdueNotificationMessage.overdueNotificationDTO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="overdueNotificationMessage.overdueNotificationCustomizeDAO" %>
<%@ page import="overdueNotificationMessage.overdueNotificationCustomizeDTO" %>
<html>
<head>
    <title>하나로 메세지</title>
    <link rel="stylesheet" href="./overdueNotificationMessage.css?ver=1" >
    <script src="./overdueNotificationMessage.js?ver=1"></script>
</head>
<body>
<main>
    <jsp:include page="/components/sidebar.jsp" />
    <section class="mainComponent">
        <%
            overdueNotificationCustomizeDAO dao = new overdueNotificationCustomizeDAO();
            List<overdueNotificationCustomizeDTO> infos = dao.selectMessage();

        %>
        <div class="searchComponent">
            <div class="searchComponent-topBar">
            </div>
            <div class="searchComponent">
                <div class="searchComponent-topBar">
                    <div class="searchComponent-topBar-left">메세지 전송</div>
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

                            for (overdueNotificationCustomizeDTO custInfo : infos)
                            { %>
                    <div class="myMessage-list-element" style="" onclick="modifyMessage([
                            '<%=custInfo.getId() %>',
                            '<%=custInfo.getCustNm() %>',
                            '<%=custInfo.getGender() %>',
                            '<%=custInfo.getCustGrade() %>',
                            '<%=custInfo.getCreditRating() %>',
                            '<%=custInfo.getAge() %>',
                            '<%=custInfo.getSubTerm() %>',
                            '<%=custInfo.getAsset() %>',
                            '<%=custInfo.getPrivacy() %>',
                            '<%=custInfo.getOverdue() %>',
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
            <div id="resultContainer" class="listComponent2">
                <form method="post" action="/pages/email/overdueNotificationSendEmail/overdueNotificationSendEmail.jsp" style="width:100%; display:flex; flex-direction: column; justify-content: center; align-items: center;" >

                    <%  int count = 0;
                        if(request.getAttribute("custInfos")!=null) {
                            int custInfos = (int) request.getAttribute("custInfos");
                        }

//                System.out.println(custInfos);
                        java.util.Date currentDate = new java.util.Date();
                        java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                        String formattedDate = sdf.format(currentDate);
                    %>
                    <input hidden="" value="상환 안내" name="category">
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
                            <div class="listComponent-topbar-element">고객코드</div>
                            <div class="listComponent-topbar-element" >이름</div>
                            <div class="listComponent-topbar-element">나이</div>
                            <div class="listComponent-topbar-element" >성별</div>
                            <div class="listComponent-topbar-elementMedium">연체여부</div>  <!-- 추가사항 -->
                            <div class="listComponent-topbar-elementMedium">신용등급</div>
                            <div class="listComponent-topbar-elementMedium">고객등급</div>
                            <div class="listComponent-topbar-elementMedium">자산</div>
                            <div class="listComponent-topbar-elementBig">개인정보동의</div>
                            <div class="listComponent-topbar-elementBig">전화번호</div>
                            <div class="listComponent-topbar-elementBig">이메일</div>
                        </div>
                        <%
                            List<overdueNotificationDTO> pageInfos = (List<overdueNotificationDTO>) request.getAttribute("pageInfos");
                            if (pageInfos != null) {
                                for (overdueNotificationDTO custInfo : pageInfos) {
                                    count++;
                                    if (count > 10){ break;} // 트래픽 과다 방지용(10개만)
                        %>
                        <div class="listComponent-listbar">


                            <input hidden="" type="text" name="to" value="<%=custInfo.getEmail()%>" />

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
                                <%= custInfo.getCreditRating() %>
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
                        <input hidden="" id="getMan"  name="man">
                        <input hidden="" id="getWoman"  name="woman">
                        <input hidden="" id="getPrivacyYes"  name="privacyYes">
                        <input hidden="" id="getAge"  name="age">
                        <input hidden="" id="getOverdueYes"  name="overdueYes">
                        <input hidden="" id="getOverdueNo"  name="overdueNo">
                        <input hidden="" id="getAsset"  name="asset">
                        <input hidden="" id="getCustGrade"  name="custGrade">
                        <input hidden="" id="getCreditRating"  name="creditRating">
                        <%--                    <input hidden="" id="getJob"  name="job">--%>
                        <%--                    <input hidden="" id="getPrivate"  name="private">--%>

                    </div>
                </form>
            </div>
    </section>
</main>
</body>
</html>
