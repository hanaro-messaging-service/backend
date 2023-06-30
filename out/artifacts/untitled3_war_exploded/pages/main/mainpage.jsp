<!DOCTYPE html>
<html lang="en">
<!-- <html lang="en" style="height: 100%"> -->
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.Map"%>
<%@ page import="java.util.List" %>
<%@ page import="productPromotionMessageHistory.prodMessageHistoryDAO"%>
<%@ page import="productPromotionMessageHistory.prodMessageHistoryDTO"%>
<%@ page import="appPromotionMessageHistory.appPromotionMessageHistoryDAO"%>
<%@ page import="appPromotionMessageHistory.appPromotionMessageHistoryDTO"%>
<%@ page import="messageHistory.voicefishingNotificationHistory.voicefishingNotificationHistoryDAO" %>
<%@ page import="messageHistory.voicefishingNotificationHistory.voicefishingNotificationHistoryDTO" %>
<%@ page import="messageHistory.overdueNotificationMessageHistory.messageHistoryDAO" %>
<%@ page import="messageHistory.overdueNotificationMessageHistory.messageHistoryDTO" %>
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
<body>
<div style="display:flex; align-items: center; justify-content: space-between; padding:0 2vw;">
    <div style="display:flex; align-items: center; margin-bottom: 1vh; ">
        <image src="/pages/main/image3.png" style="width:20%;height:20%;"></image>
        <div style="font-size:1.6rem; font-weight: bold; color:#008485;">
            <div>HANARO</div>
            <div>MESSAGE</div>
        </div>
    </div>
    <div style="display:flex; justify-content: center; align-items: center; width:10%; height: 5vh; background: #008485; color:white; border-radius: 5px; font-size:1.2rem;">
    로그아웃
    </div>

</div>


<main>
    <jsp:include page="/components/sidebar.jsp" />
    <%
        prodMessageHistoryDAO promoDao = new prodMessageHistoryDAO();
        List<prodMessageHistoryDTO> promoInfos = promoDao.readMessage();
        messageHistoryDAO overdueDao = new messageHistoryDAO();
        List<messageHistoryDTO> overdueInfos = overdueDao.readMessage();
        voicefishingNotificationHistoryDAO dao = new voicefishingNotificationHistoryDAO();
        List<voicefishingNotificationHistoryDTO> voiceInfos = dao.readMessage();
        appPromotionMessageHistoryDAO appDao = new appPromotionMessageHistoryDAO();
        List<appPromotionMessageHistoryDTO> appInfos = appDao.readMessage();
    %>
    <% if (promoInfos != null) { %>
    <% for (prodMessageHistoryDTO promoInfo : promoInfos) { %>
    <div hidden="" class="promoDate"><%=promoInfo.getTime()%></div>
    <div hidden="" class="promoCount"><%=promoInfo.getCounts()%></div>
    <%
        }}
    %>
    <% if (overdueInfos != null) { System.out.println(overdueInfos); %>
    <% for (messageHistoryDTO overdueInfo : overdueInfos) { %>
    <div hidden="" class="overdueDate"><%=overdueInfo.getTime()%></div>
    <div hidden="" class="overdueCount"><%=overdueInfo.getCounts()%></div>
    <%
            }}
    %>
    <% if (voiceInfos != null) { %>
    <% for (voicefishingNotificationHistoryDTO voiceInfo : voiceInfos) { %>
    <div hidden="" class="voiceDate"><%=voiceInfo.getTime()%></div>
    <div hidden="" class="voiceCount"><%=voiceInfo.getCounts()%></div>
    <%
            }}
    %>
    <% if (appInfos != null) { %>
    <% for (appPromotionMessageHistoryDTO appInfo : appInfos) { %>
    <div hidden="" class="appDate"><%=appInfo.getTime()%></div>
    <div hidden="" class="appCount"><%=appInfo.getCounts()%></div>
    <%
            }}
    %>

    <section class="mainComponent">

        <div class="titleComponent">메인페이지</div>


        <div class="contentComponent">
            <div class="contentComponent-element">
                <div style="display:flex;  font-size:2rem; color:#008485;">전체사용내역</div>
                <div style="height:50vh;">
                    <canvas style="height:50vh;" id="myChart1"></canvas>
                </div>

            </div>
            <div class="contentComponent-element">
                <div style="display:flex;  font-size:2rem; color:#008485;">수신 상품 프로모션 메시지</div>
                <div style="height:50vh;">
                    <canvas style="width:100%;height:50vh;" canvas id = "prodChart"></canvas>
                </div>

            </div>
            <div class="contentComponent-element">
                <div style="display:flex;  font-size:2rem; color:#008485;">보이스피싱 메시지</div>
                <div style="height:50vh;">
                    <canvas style="width:100%;height:50vh;" canvas id = "voiceChart"></canvas>
                </div>
            </div>
            <div class="contentComponent-element">
                <div style="display:flex;  font-size:2rem; color:#008485;">어플 프로모션 메시지</div>
                <div style="height:50vh;">
                    <canvas style="width:100%;height:50vh;" canvas id = "appChart"></canvas>
                </div>
            </div>
            <div class="contentComponent-element">
                <div style="display:flex;  font-size:2rem; color:#008485;">상환 관리 메시지</div>
                <div style="height:50vh;">
                    <canvas style="width:100%;height:50vh;" canvas id = "overChart"></canvas>
                </div>
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
    var voiceDate = document.getElementsByClassName('voiceDate');
    var voiceCount = document.getElementsByClassName('voiceCount');

    let voiceDateArray = [];
    let voiceCountArray = [];
    for (let i = 0; i < voiceDate.length; i++) {

        var date = new Date(voiceDate[i].innerHTML);

        var month = date.getMonth() + 1;
        var day = date.getDate();
        var hour = date.getHours();
        var minute = date.getMinutes();

        var outputDateString = month + '/' + day + ' ' + hour + ':' + minute ;
        voiceDateArray.push(outputDateString);
        voiceCountArray.push(voiceCount[i].innerHTML);
    }
    var app = document.getElementById("appChart").getContext('2d');
    var appDate = document.getElementsByClassName('appDate');
    var appCount = document.getElementsByClassName('appCount');

    let appDateArray = [];
    let appCountArray = [];
    for (let i = 0; i < appDate.length; i++) {

        var date = new Date(appDate[i].innerHTML);

        var month = date.getMonth() + 1;
        var day = date.getDate();
        var hour = date.getHours();
        var minute = date.getMinutes();

        var outputDateString = month + '/' + day + ' ' + hour + ':' + minute ;
        appDateArray.push(outputDateString);
        appCountArray.push(appCount[i].innerHTML);
    }
    var over = document.getElementById("overChart").getContext('2d');
    var overDate = document.getElementsByClassName('overdueDate');
    var overCount = document.getElementsByClassName('overdueCount');
    console.log(overDate,overCount);
    let overDateArray = [];
    let overCountArray = [];
    for (let i = 0; i < overDate.length; i++) {

        var date = new Date(overDate[i].innerHTML);

        var month = date.getMonth() + 1;
        var day = date.getDate();
        var hour = date.getHours();
        var minute = date.getMinutes();

        var outputDateString = month + '/' + day + ' ' + hour + ':' + minute ;
        overDateArray.push(outputDateString);
        overCountArray.push(overCount[i].innerHTML);
    }
    console.log(overDateArray,overCountArray.reduce((acc,cur)=>Number(acc)+Number(cur)))

    data = {
        datasets: [{
            backgroundColor: ['#008485','#6878ad','#b0eaeb','#f0aaed','skyblue'],
            data: [prodCountArray.reduce((acc,cur)=>Number(acc)+Number(cur)),voiceCountArray.reduce((acc,cur)=>Number(acc)+Number(cur)),appCountArray.reduce((acc,cur)=>Number(acc)+Number(cur)),overCountArray.reduce((acc,cur)=>Number(acc)+Number(cur)),50]
        }],
        // 라벨의 이름이 툴팁처럼 마우스가 근처에 오면 나타남
        labels: ['수신 상품 프로모션','보이스피싱 예방 관리','어플 프로모션','상환 관리 안내','전체안내']
    };

    // 가운데 구멍이 없는 파이형 차트

    var ctx1 = document.getElementById("myChart1");
    var myPieChart = new Chart(ctx1, {
        type: 'pie',
        data: data,
        options: {}
    });
    var chart = new Chart(prod, {
        // 챠트 종류를 선택
        type: 'line',
        // 챠트를 그릴 데이타
        data: {
            labels: prodDateArray,
            datasets: [{
                label: '수신 상품 프로모션',
                backgroundColor: 'transparent',
                borderColor: '#008485',
                data: prodCountArray
            }]
        },
        // 옵션
        options: {
            scales: {
                x: {
                    grid: {
                        display: false,
                        beginAtZero: true
                    }
                },
                y: {
                    grid: {
                        display: false
                    }
                }
            }
        }
    });

    var chart = new Chart(voice, {
        // 챠트 종류를 선택
        type: 'line',
        // 챠트를 그릴 데이타
        data: {
            labels: voiceDateArray,
            datasets: [{
                label: '보이스피싱',
                backgroundColor: 'transparent',
                borderColor: '#6878ad',
                data: voiceCountArray
            }]
        },
        // 옵션
        options: {
            scales: {
                x: {
                    grid: {
                        display: false
                    }
                },
                y: {
                    grid: {
                        display: false
                    }
                }
            }
        }
    });
    var chart = new Chart(app, {
        // 챠트 종류를 선택
        type: 'line',

        // 챠트를 그릴 데이타
        data: {
            labels: appDateArray,
            datasets: [{
                label: '어플 프로모션',
                backgroundColor: 'transparent',
                borderColor: '#b0eaeb',
                data: appCountArray
            }]
        },
        // 옵션
        options: {
            scales: {
                x: {
                    grid: {
                        display: false
                    }
                },
                y: {
                    grid: {
                        display: false
                    }
                }
            }
        }
    });
    var chart = new Chart(over, {
        // 챠트 종류를 선택
        type: 'line',

        // 챠트를 그릴 데이타
        data: {
            labels:overDateArray,
            datasets: [{
                label: '상환관리',
                backgroundColor: 'transparent',
                borderColor: 'skyblue',
                data: overCountArray
            }]
        },
        // 옵션
        options: {
            scales: {
                x: {
                    grid: {
                        display: false
                    }
                },
                y: {
                    grid: {
                        display: false
                    }
                }
            }
        }
    });
</script>
</body>

</html>