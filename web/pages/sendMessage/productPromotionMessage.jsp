
<%@ page import="productPromotionPackage.productPromotionMessageDTO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="productPromotionPackage.productPromotionCustomizeDAO" %>
<%@ page import="productPromotionPackage.productPromotionCustomizeDTO" %>
<%@ page import="email.emailPromotionDAO" %>
<%@ page import="java.lang.reflect.Array" %>
<html>
<head>
    <title>하나로 메세지</title>
    <link rel="stylesheet" href="/pages/sendMessage/productPromotionMessage.css" >
    <script src="/pages/sendMessage/productPromotionMessage.js"></script>
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</head>
<body>

<jsp:include page="/components/header.jsp" />
<main>
    <jsp:include page="/components/sidebar.jsp" />
    <section class="mainComponent">
        <div style="
   position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background-color: rgba(0, 0, 0, 0.5);
  display: none;
  justify-content: center;
  align-items: center;
  flex-direction: column;
  z-index: 9999;" id="loading-overlay">
            <div style="display:flex;">

                <div class="spinner-grow " style="width:5rem;height:5rem;margin-right:5rem;" role="status">

                    <span class="visually-hidden">Loading...</span>
                </div>
                <div class="spinner-grow" style="width:5rem;height:5rem; margin-right:5rem;" role="status">

                    <span class="visually-hidden">Loading...</span>
                </div>
                <div class="spinner-grow" style="width:5rem;height:5rem" role="status">

                    <span class="visually-hidden">Loading...</span>
                </div>
            </div>

            <div style="font-size:3rem; font-weight: bold; color:white; margin-top:2vh;">로딩중입니다..잠시만 기다려주세요!</div>
        </div>
        <%
            productPromotionCustomizeDAO dao = new productPromotionCustomizeDAO();
            List<productPromotionCustomizeDTO> infos = dao.selectMessage();

        %>
        <div class="searchComponent">
            <div class="searchComponent-topBar">
                <div class="searchComponent-topBar-left">수신 상품 프로모션 메시지 전송</div>

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
                            <input  onclick="sendValueToServlet(this)" type="checkbox" name="개인정보" value="O" class="flex align-center" id="privacyYes">
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
                    <div class="searchComponent-searchBar-list-key">이름</div>
                    <div class="searchComponent-searchBar-list-value">
                        <input value="" type="text" id="name" oninput="sendValueToServlet(event.target.value)">
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
                    <div class="searchComponent-searchBar-list-key">개설지점</div>
                    <div class="searchComponent-searchBar-list-value">
                        <input value="" type="text" id="branch" oninput="sendValueToServlet(event.target.value)">
                    </div>
                </div>

                    <select name="period" id="period" onchange="sendValueToServlet(this.value)" hidden="" >
                        <option value="전체">전체</option>
                        <option value="1년 미만">1년 미만</option>
                        <option value="1년-3년">1년-3년</option>
                        <option value="3년-5년">3년-5년</option>
                        <option value="5년-10년">5년-10년</option>
                        <option value="10년 이상">10년 이상</option>
                    </select>

            </div>

        </div>

        <div class="myMessage">
            <div style="width:15%;height:4vh;background-color:#008485; border-radius: 5px; display:flex; justify-content: center;
                            align-items:center; color:white;">마이메세지</div>

            <div class="myMessage-list">

                <%

                    if (infos != null) {

                        for (productPromotionCustomizeDTO custInfo : infos)
                        { %>
                <div class="myMessage-list-element" style="" onclick="modifyMessage([
                        '<%=custInfo.getId() %>',
                        '<%=custInfo.getCustNm() %>',
                        '<%=custInfo.getGender() %>',
                        '<%=custInfo.getAge() %>',
                        '<%=custInfo.getJob() %>',
                        '<%=custInfo.getAddress() %>',
                        '<%=custInfo.getCustGrade() %>',
                        '<%=custInfo.getBranch() %>',
                        '<%=custInfo.getSubTerm() %>',
                        '<%=custInfo.getAsset() %>',
                        '<%=custInfo.getPrivacy() %>',
                        '<%=custInfo.getRecLoginDate() %>',
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


        <form method="post" action="/pages/email/productPromotionSendEmail.jsp" onsubmit="return validateForm()" style="width:100%; display:flex; flex-direction: column; justify-content: center; align-items: center;" >

            <%  int count = 0;
                if(request.getAttribute("custInfos")!=null) {
                    int custInfos = (int) request.getAttribute("custInfos");
                }

//                System.out.println(custInfos);
                java.util.Date currentDate = new java.util.Date();
                java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                String formattedDate = sdf.format(currentDate);
            %>
            <input hidden="" value="수신 상품 프로모션" name="category">
<%--            value값 수정--%>



            <input hidden="" value="<%= formattedDate %>" name="date">
            <table style="display:flex;justify-content: space-between; width: 90%; background: red;" >
                <tr  hidden="">

                    <td hidden="">
                        보내는 사람 : <input type="text" name="from" value="qudtjr1116@naver.com" />
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
                        <textarea style=" width:80%; height:20vh; border: 2px solid #008485;" name="content" id="mContents" cols="60" rows="10" value=""></textarea>

                </div>
                <div style="display:flex; width:90%; justify-content: flex-end; margin-top:1vh;">
                        <button style="cursor:pointer; width:15%; height:4vh; background:white; border:1px solid #cccccc;" type="submit">전송하기</button>
                </div>
            </table>

        <div class="listComponent">
            <div class="listComponent-topbar">
                <div class="listComponent-topbar-element">이름</div>
                <div class="listComponent-topbar-element">성별</div>
                <div class="listComponent-topbar-element">나이</div>
                <div class="listComponent-topbar-elementMedium">직업</div>
                <div class="listComponent-topbar-elementMedium">거주지</div>
                <div class="listComponent-topbar-element">고객등급</div>
                <div class="listComponent-topbar-elementBig">개설지점</div>
                <div class="listComponent-topbar-elementMedium">가입기간</div>
                <div class="listComponent-topbar-elementMedium">자산</div>
                <div class="listComponent-topbar-elementMedium">개인정보동의</div>
                <div class="listComponent-topbar-elementBig">어플접속일</div>
                <div class="listComponent-topbar-elementVeryBig">이메일</div>
            </div>
            <%
                List<productPromotionMessageDTO> pageInfos = (List<productPromotionMessageDTO>) request.getAttribute("pageInfos");
                if (pageInfos != null) {
                    for (productPromotionMessageDTO custInfo : pageInfos) {
                        count++;
            %>
                <div class="listComponent-listbar">


                    <input hidden="" type="text" name="to" value="<%=custInfo.getEmail()%>" />

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
                    <div class="listComponent-topbar-elementMedium bg-white">
                        <%= custInfo.getAddress()%>
                    </div>
                    <div class="listComponent-topbar-element bg-white">
                        <%= custInfo.getCustGrade()%>
                    </div>
                    <div class="listComponent-topbar-elementBig bg-white">
                        <%= custInfo.getBranch() %>
                    </div>
                    <div class="listComponent-topbar-elementMedium bg-white">
                        <%= custInfo.getSubTerm()%>
                    </div>
                    <div class="listComponent-topbar-elementMedium bg-white">
                        <%= custInfo.getAsset()%>
                    </div>
                    <div class="listComponent-topbar-elementMedium bg-white">
                        <%= custInfo.getPrivacy()%>
                    </div>
                    <div class="listComponent-topbar-elementBig bg-white">
                        <%= custInfo.getRecLoginDate()%>
                    </div>
                    <div class="listComponent-topbar-elementVeryBig bg-white">
                        <%= custInfo.getEmail()%>
                    </div>

                </div>

                <%  } %>
            <div style="display:flex; width:100%; flex-wrap:wrap;">
                <%  if(request.getAttribute("custInfos")!=null) {
                    int custInfos = (int) request.getAttribute("custInfos");
                    int pageCount = 0;
                    int pageLength = custInfos/10+1;

                %>
                <input hidden="" value="<%=custInfos%>" id="totalCount"/>
                <input hidden="" value="<%=custInfos%>" name="counts">
                <div class="paginationContainer">
                    <div class="pagination">
                        <ul> <!--pages or li are comes from javascript --> </ul>
                    </div>
                </div>

                <%

                    }
                %>
            </div>

                <%
                    }
                %>

            <input hidden="" id="getName"  name="name">
            <input hidden="" id="getApp"   name="app">
            <input hidden="" id="getAsset"  name="asset">
            <input hidden="" id="getMan"  name="man">
            <input hidden="" id="getWoman"  name="woman">
            <input hidden="" id="getPrivacyYes"  name="privacyYes">
            <input hidden="" id="getJob"  name="job">
            <input hidden="" id="getPrivate"  name="private">
            <input hidden="" id="getAge"  name="age">
            <input hidden="" id="getPeriod"  name="period">
            <input hidden="" id="getLocation"  name="location">
            <input hidden="" id="getBranch"  name="branch">

            </div>
        </form>
        </div>
    </section>
</main>



</body>
</html>