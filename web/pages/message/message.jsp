<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<% response.setCharacterEncoding("utf-8"); %>
<html>
<head>
  <link rel="stylesheet" href="./message.css">
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
<form method="post" action="/MessageMapping">
  <main>
    <div class="flex1 bt mt_50">
      <div>
        <span>이름</span>
        <input name="custNm" value="" type="text" id="name" oninput="sendValueToServlet(event.target.value)">
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
            <input name="privacyYes" onclick="sendValueToServlet(this)" type="checkbox" name="개인정보" value="O" class="flex align-center" id="privacyYes">
            <div>동의</div>
          </div>
          <div class="flex align-center">
            <input name="privacyNo" onclick="sendValueToServlet(this)" type="checkbox" name="개인정보" value="X" id="privacyNo">
            <div>비동의</div>
          </div>
        </div>
      </div>
      <div class="partition3 flex ">
        <div class="partition4 flex align-center justify-center">성별</div>
        <div class="partition6 flex align-center justify-evenly">
          <div class="flex align-center">
            <input name="male" onchange="sendValueToServlet(this)" type="checkbox" name="성별" value="M" class="flex align-center" id="man">
            <div>남자</div>
          </div>
          <div class="flex align-center">
            <input name="female" onchange="sendValueToServlet(this)" type="checkbox" name="성별" value="F" id="woman">
            <div>여자</div>
          </div>
        </div>
      </div>
      <div class="partition3 flex">
        <div class="partition4 flex align-center justify-center" >나이</div>
        <div class="partition6 flex align-center justify-evenly">
          <select name="age" id="age" onchange="sendValueToServlet(this.value)">
            <option value="전체">전체</option>
            <option value="20대">20대</option>
            <option value="30대">30대</option>
            <option value="40대">40대</option>
            <option value="50대">50대</option>
            <option value="60대">60대</option>
            <option value="70대 이상">70대 이상</option>
          </select>
          <select name="agepart" id="agepart" onchange="sendValueToServlet(this.value)">
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
      <div class="partition3 flex ">
        <div class="partition4 flex align-center justify-center">고객등급</div>
        <div class="partition6 flex align-center justify-evenly">
          <select name="privateRate" id="private" onchange="sendValueToServlet(this.value)">
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
          <select name="asset" id="asset" onchange="sendValueToServlet(this.value)">
            <option value="전체">전체</option>
            <option value="100만원 이하">100만원 이하</option>
            <option value="100만원에서 1000만원">100만원~1000만원</option>
            <option value="1000만원에서 3000만원">1000만원-3000만원</option>
            <option value="3000만원 이상">3000만원 이상</option>
          </select>

        </div>
      </div>
    </div>
    <div class="flex1 mt_10">
      <div class="partition3 flex1">
        <div class="partition4 flex1 align-center justify-center">어플 접속일</div>
        <div class="partition6 flex1 align-center justify-evenly">
          <select name="app" id="app" onchange="sendValueToServlet(this.value)">
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
      <div class="partition3 flex">
        <div class="partition4 flex align-center justify-center" >연체 여부</div>
        <div class="partition6 flex align-center justify-evenly">
          <div class="flex align-center">
            <input name="moneyExpYes" id="moneyExpYes" onclick="sendValueToServlet(this)" type="checkbox" name="money_exp" value="O" class="flex align-center">
            <div>있음</div>
          </div>
          <div class="flex align-center">
            <input name="moneyExpNo" id="moneyExpNo" onclick="sendValueToServlet(this)" type="checkbox" name="money_exp" value="X">
            <div>없음</div>
          </div>

        </div>
      </div>
    </div>

  </main>
<section class="mt_50">
<div class="flex2">
  <div>메세지 입력</div>
  <textarea name="messageText" class="messageTextarea"> </textarea>
  <input type="submit" value="확인">
</div>
</section>
</form>
</body>
</html>