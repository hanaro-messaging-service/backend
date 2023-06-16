<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import = "DTO.MemberDTO" %>
<%@ page import="DAO.MemberDAO" %>

<%
    MemberDAO dao = new MemberDAO(application);
    MemberDTO memberDTO = dao.getMemberDTO();

%>
<html>
<head>
    <link rel="stylesheet" href="/pages/main/mainpage.css">
</head>
<body>

<header>
    <a href="/">
        메세지 관리
    </a>
    <a href="/pages/message/messagelist.jsp">
        메세지 추가
    </a>
    <a herf="">
        메세지 내역
    </a>
    <a>
        로그인
    </a>
</header>
<main>
    <div class="flex1 bt mt_50">
       <div>
           <span>이름</span>
           <input>
       </div>
        <div>
           버튼
        </div>
    </div>
    <div class="flex1">
        <div class="partition3 flex1">
            <div class="partition4 flex1 align-center justify-center">개인정보동의</div>
            <div class="partition6 flex1 align-center justify-evenly">
                <div class="flex align-center">
                    <input type="checkbox" name="개인정보" value="Y" class="flex align-center">
                    <div>동의</div>
                </div>
                <div class="flex align-center">
                    <input onclick=""type="checkbox" name="개인정보" value="N">
                    <div>비동의</div>
                </div>
            </div>
            </div>
        <div class="partition3 flex ">
            <div class="partition4 flex align-center justify-center">성별</div>
            <div class="partition6 flex align-center justify-evenly">
                <div class="flex align-center">
                    <input type="checkbox" name="성별" value="M" class="flex align-center">
                    <div>남자</div>
                </div>
                <div class="flex align-center">
                    <input type="checkbox" name="성별" value="F">
                    <div>여자</div>
                </div>
            </div>
        </div>
        <div class="partition3 flex">
            <div class="partition4 flex align-center justify-center" >나이</div>
            <div class="partition6 flex align-center justify-evenly">
                    <select name="age" id="age">
                        <option value="전체">전체</option>
                        <option value="20대">20대</option>
                        <option value="30대">30대</option>
                        <option value="40대">40대</option>
                        <option value="50대">50데</option>
                        <option value="60대">60데</option>
                        <option value="70대 이상">70대 이상</option>
                    </select>
                <select name="agepart" id="agepart">
                    <option value="전체">전체</option>
                    <option value="초반">초반</option>
                    <option value="중반">중반</option>
                    <option value="후반">후반</option>
                </select>

            </div>
        </div>
    </div>
    <div class="flex1 mt_10">
        <div class="partition3 flex1">
            <div class="partition4 flex1 align-center justify-center">직업</div>
            <div class="partition6 flex1 align-center justify-evenly">
                <select name="job" id="job">
                    <option value="전체">전체</option>
                    <option value="학생">학생</option>
                    <option value="공무원">공무원</option>
                    <option value="전문직">전문직</option>
                    <option value="무직">무직</option>
                    <option value="주부">주부</option>
                </select>
            </div>
        </div>
        <div class="partition3 flex ">
            <div class="partition4 flex align-center justify-center">고객등급</div>
            <div class="partition6 flex align-center justify-evenly">
                <select name="private" id="private">
                    <option value="전체">전체</option>
                    <option value="1">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                    <option value="4">4</option>
                    <option value="5">5</option>
                </select>
            </div>
        </div>
        <div class="partition3 flex">
            <div class="partition4 flex align-center justify-center" >자산</div>
            <div class="partition6 flex align-center justify-evenly">
                <select name="asset" id="asset">
                    <option value="javascript">전체</option>
                    <option value="0-1000000">100만원 이하</option>
                    <option value="1000000-10000000">100만원~1000만원</option>
                    <option value="10000000-30000000">1000만원-3000만원</option>
                    <option value="3000000이상">3000만원 이상</option>
                </select>

            </div>
        </div>
    </div>
    <div class="flex1 mt_10">
        <div class="partition3 flex1">
            <div class="partition4 flex1 align-center justify-center">어플 접속일</div>
            <div class="partition6 flex1 align-center justify-evenly">
                <select name="app" id="app">
                    <option value="전체">전체</option>
                    <option value="1개월 이내">1개월 이내</option>
                    <option value="1개월-3개월">1개월-3개월</option>
                    <option value="3개월 이상">3개월</option>
                </select>
            </div>
        </div>
        <div class="partition3 flex ">
            <div class="partition4 flex align-center justify-center">가입 기간</div>
            <div class="partition6 flex align-center justify-evenly">
                <select name="period" id="period">
                    <option value="전체">전체</option>
                    <option value="1년 미만">1년 미만</option>
                    <option value="1년-3년">1년-3년</option>
                    <option value="3년-5년">3년-5년</option>
                    <option value="5년-10년">5년-10년</option>
                    <option value="10년 이상">10년 이상</option>
                </select>
            </div>
        </div>
        <div class="partition3 flex">
            <div class="partition4 flex align-center justify-center" >연체 여부</div>
            <div class="partition6 flex align-center justify-evenly">
                <div class="flex align-center">
                    <input type="checkbox" name="money_exp" value="Y" class="flex align-center">
                    <div>있음</div>
                </div>
                <div class="flex align-center">
                    <input type="checkbox" name="money_exp" value="N">
                    <div>없음</div>
                </div>

            </div>
        </div>
    </div>

</main>
<section class="mt_50">
    <div class="flex2 bt height5">
        <div class="partiton0_9 flex justify-center align-center bg_grey bd_black_left  ">선택</div>
        <div class="partiton1_6 flex justify-center align-center bg_grey bd_black_left ">고객코드</div>
        <div class="partiton0_9 flex justify-center align-center bg_grey bd_black_left ">이름</div>
        <div class="partiton0_9 flex justify-center bg_grey  align-center bd_black_left">나이</div>
        <div class="partiton1_6 flex justify-center bg_grey align-center bd_black_left">거주지</div>
        <div class="partiton0_9 flex justify-center bg_grey  align-center bd_black_left">직업</div>
        <div class="partiton1_6 flex justify-center bg_grey  align-center bd_black_left">전화번호</div>
        <div class="partiton1_6 flex justify-center bg_grey align-center bd_black_left bd_black_right">고객등급</div>
    </div>
    <div class="flex2 bt">
        <div class="partiton0_9 flex justify-center align-center bd_black_all "> <input type="checkbox" id="scales" name="scales" checked></div>
        <div class="partiton1_6 flex justify-center align-center bd_black_all">AABB110109105</div>
        <div class="partiton0_9 flex justify-center align-center bd_black_all">홍길동</div>
        <div class="partiton0_9 flex justify-center align-center bd_black_all">21세</div>
        <div class="partiton1_6 flex justify-center align-center bd_black_all">서울특별시</div>
        <div class="partiton0_9 flex justify-center align-center bd_black_all">공무원</div>
        <div class="partiton1_6 flex justify-center align-center bd_black_all">010-1234-5678</div>
        <div class="partiton1_6 flex justify-center align-center bd_black_all bd_black_right">5</div>
    </div>
</section>
</body>
</html>