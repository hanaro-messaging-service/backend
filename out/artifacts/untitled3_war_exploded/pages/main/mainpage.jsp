<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
                    <input type="radio" name="개인정보" value="Y" class="flex align-center">
                    <div>동의</div>
                </div>
                <div class="flex align-center">
                    <input type="radio" name="개인정보" value="N">
                    <div>비동의</div>
                </div>
            </div>
            </div>
        <div class="partition3 flex ">
            <div class="partition4 flex align-center justify-center">성별</div>
            <div class="partition6 flex align-center justify-evenly">
                <div class="flex align-center">
                    <input type="radio" name="성별" value="M" class="flex align-center">
                    <div>남자</div>
                </div>
                <div class="flex align-center">
                    <input type="radio" name="성별" value="F">
                    <div>여자</div>
                </div>
            </div>
        </div>
        <div class="partition3 flex">
            <div class="partition4 flex align-center justify-center" >나이</div>
            <div class="partition6 flex align-center justify-evenly">
                <div class="flex align-center justify-center">
                    <input type="text" class="input30">
                    <div>세</div>
                </div>
                <div>~</div>
                <div class="flex align-center justify-center">
                    <input type="text" class="input30">
                    <div>세</div>
                </div>

            </div>
        </div>
    </div>
    <div class="flex1 mt_10">
        <div class="partition3 flex1">
            <div class="partition4 flex1 align-center justify-center">직업</div>
            <div class="partition6 flex1 align-center justify-evenly">
                <select name="languages" id="lang">
                    <option value="javascript">JavaScript</option>
                    <option value="php">PHP</option>
                    <option value="java">Java</option>
                    <option value="golang">Golang</option>
                    <option value="python">Python</option>
                    <option value="c#">C#</option>
                    <option value="C++">C++</option>
                    <option value="erlang">Erlang</option>
                </select>
            </div>
        </div>
        <div class="partition3 flex ">
            <div class="partition4 flex align-center justify-center">고객등급</div>
            <div class="partition6 flex align-center justify-evenly">
                <select name="languages" id="lang">
                    <option value="javascript">JavaScript</option>
                    <option value="php">PHP</option>
                    <option value="java">Java</option>
                    <option value="golang">Golang</option>
                    <option value="python">Python</option>
                    <option value="c#">C#</option>
                    <option value="C++">C++</option>
                    <option value="erlang">Erlang</option>
                </select>
            </div>
        </div>
        <div class="partition3 flex">
            <div class="partition4 flex align-center justify-center" >자산</div>
            <div class="partition6 flex align-center justify-evenly">
                <div class="flex align-center justify-center">
                    <input type="text" class="input30">
                    <div>세</div>
                </div>
                <div>~</div>
                <div class="flex align-center justify-center">
                    <input type="text" class="input30">
                    <div>세</div>
                </div>

            </div>
        </div>
    </div>
    <div class="flex1 mt_10">
        <div class="partition3 flex1">
            <div class="partition4 flex1 align-center justify-center">어플 접속일</div>
            <div class="partition6 flex1 align-center justify-evenly">
                <select name="languages" id="lang">
                    <option value="javascript">JavaScript</option>
                    <option value="php">PHP</option>
                    <option value="java">Java</option>
                    <option value="golang">Golang</option>
                    <option value="python">Python</option>
                    <option value="c#">C#</option>
                    <option value="C++">C++</option>
                    <option value="erlang">Erlang</option>
                </select>
            </div>
        </div>
        <div class="partition3 flex ">
            <div class="partition4 flex align-center justify-center">가입 기간</div>
            <div class="partition6 flex align-center justify-evenly">
                <select name="languages" id="lang">
                    <option value="javascript">JavaScript</option>
                    <option value="php">PHP</option>
                    <option value="java">Java</option>
                    <option value="golang">Golang</option>
                    <option value="python">Python</option>
                    <option value="c#">C#</option>
                    <option value="C++">C++</option>
                    <option value="erlang">Erlang</option>
                </select>
            </div>
        </div>
        <div class="partition3 flex">
            <div class="partition4 flex align-center justify-center" >연체 여부</div>
            <div class="partition6 flex align-center justify-evenly">
                <div class="flex align-center">
                    <input type="radio" name="money_exp" value="Y" class="flex align-center">
                    <div>있음</div>
                </div>
                <div class="flex align-center">
                    <input type="radio" name="money_exp" value="N">
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