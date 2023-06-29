<!DOCTYPE html>
<html lang="en">
<!-- <html lang="en" style="height: 100%"> -->
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.Map"%>
<%@ page import="java.util.List" %>
<%@ page import="productPromotionMessageHistory.messageHistoryDAO"%>
<%@ page import="productPromotionMessageHistory.messageHistoryDTO"%>
<%@ page import="java.util.Arrays" %>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <!-- 차트 링크 -->
    <link rel="stylesheet" href="/pages/main/mainpage.css">
    <script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
</head>

<main>
    <jsp:include page="/components/sidebar.jsp" />
    <%
        messageHistoryDAO promoDao = new messageHistoryDAO();
        List<messageHistoryDTO> promoInfos = promoDao.readMessage();
    %>
    <% if (promoInfos != null) { %>
    <% for (messageHistoryDTO promoInfo : promoInfos) { %>
    <div hidden="" class="promoDate"><%=promoInfo.getTime()%></div>
    <div hidden="" class="promoCount"><%=promoInfo.getCounts()%></div>
    <%
        }}
    %>
    <section class="mainComponent">

        <div class="titleComponent">메인페이지</div>

        <div class="topComponent">


        </div>
        <div class="contentComponent">
            <div class="contentComponent-element">
                    <canvas style="width:100%;height:55vh;" canvas id = "prodChart"></canvas>
            </div>
            <div class="contentComponent-element">
                <canvas style="width:100%;height:55vh;" canvas id = "voiceChart"></canvas>
            </div>
            <div class="contentComponent-element">
                <canvas style="width:100%;height:55vh;" canvas id = "appChart"></canvas>
            </div>
            <div class="contentComponent-element">
                <canvas style="width:100%;height:55vh;" canvas id = "overChart"></canvas>
            </div>
        </div>
    </section>
</main>

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
<!-- 차트 -->
<script>
    var prod = document.getElementById('prodChart').getContext('2d');
    var prodDate = document.getElementsByClassName('promoDate');
    var prodCount = document.getElementsByClassName('promoCount');
    let prodDateArray = [];
    let prodCountArray = [];
    for (let i = 0; i < prodDate.length; i++) {

        var date = new Date(prodDate[i].innerHTML);

        var month = date.getMonth() + 1;
        var day = date.getDate();
        var hour = date.getHours();
        var minute = date.getMinutes();

        var outputDateString = month + '/' + day + ' ' + hour + ':' + minute ;
        prodDateArray.push(outputDateString);
        prodCountArray.push(prodCount[i].innerHTML);
    }
    console.log(prodDateArray)
    var voice = document.getElementById("voiceChart").getContext('2d');
    var app = document.getElementById("appChart").getContext('2d');
    var over = document.getElementById("overChart").getContext('2d');
    var chart = new Chart(prod, {
        type: 'line',
        data: {
            labels: prodDateArray,
            datasets: [{
                label: '수신 상품 프로모션 페이지',
                backgroundColor: 'transparent',
                borderColor: '#008485',
                data: prodCountArray
            }]
        },
        options: {
            scales: {
                x: {
                    display: false  // X축 레이블 숨김
                },
                y: {
                    min: 0,
                    max: 100,
                    stepSize: 100
                }
            },
            plugins: {
                tooltip: {
                    enabled: false,  // 툴팁 비활성화
                    mode: 'index',   // hover할 때만 툴팁 활성화
                    intersect: false
                }
            },
            hover: {
                mode: 'index',
                intersect: false
            }
        }
    });


    var chart = new Chart(voice, {
        // 챠트 종류를 선택
        type: 'line',

        // 챠트를 그릴 데이타
        data: {
            labels: ['January', 'February', 'March', 'April', 'May', 'June', 'July'],
            datasets: [{
                label: 'My First dataset',
                backgroundColor: 'transparent',
                borderColor: 'red',
                data: [0, 10, 5, 2, 20, 30, 45]
            }]
        },
        // 옵션
        options: {}
    });
    var chart = new Chart(app, {
        // 챠트 종류를 선택
        type: 'line',

        // 챠트를 그릴 데이타
        data: {
            labels: ['January', 'February', 'March', 'April', 'May', 'June', 'July'],
            datasets: [{
                label: 'My First dataset',
                backgroundColor: 'transparent',
                borderColor: 'red',
                data: [0, 10, 5, 2, 20, 30, 45]
            }]
        },
        // 옵션
        options: {}
    });
    var chart = new Chart(over, {
        // 챠트 종류를 선택
        type: 'line',

        // 챠트를 그릴 데이타
        data: {
            labels: ['January', 'February', 'March', 'April', 'May', 'June', 'July'],
            datasets: [{
                label: 'My First dataset',
                backgroundColor: 'transparent',
                borderColor: 'red',
                data: [0, 10, 5, 2, 20, 30, 45]
            }]
        },
        // 옵션
        options: {}
    });
</script>
</body>

</html>