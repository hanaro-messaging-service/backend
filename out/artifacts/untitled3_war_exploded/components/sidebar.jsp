<%--
  Created by IntelliJ IDEA.
  User: soo
  Date: 2023/06/26
  Time: 9:35 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
      .sidebar{

        width:20%;
        height:100vh;
        display:flex;
        flex-direction: column;
        align-items: flex-end;
      }

      .sidebar-main{
        height:6vh;
        width:90%;
        background-color: #008485;
        display:flex;
        align-items: center;
        padding-left:5%;
        font-size: 1.8rem;
        color:white;
      }
      .sidebar-submain {
        height:5.5vh;
        width:90%;
        padding-left:5%;
        background-color: #0DB6B8;
        display:flex;
        align-items: center;
        font-size:1.2rem;
        color:white;
      }
      .sidebar-content{
        cursor:pointer;
        list-style-type: circle;
        height:4.5vh;
        padding-left:5%;
        width:90%;
        font-size: 0.9rem;
        background-color: #00CED0;
        display:flex;
        align-items: center;
        color:white;
        border-bottom: 0.5px white solid;
        list-style-type: disc;
      }
    </style>
</head>
<body>
<section class="sidebar">
  <div class="sidebar-main">
    메시지
  </div>
  <div class="sidebar-submain">전송</div>
  <div class="sidebar-content"><li><a href="/pages/sendMessage/allNotificationMessage/allNotificationMessage.jsp">전체 안내 메시지 전송</a> </li></div>
  <div class="sidebar-content"><li><a href="/pages/sendMessage/voicefishingNotificationMessage/voicefishingNotificationMessage.jsp">보이스피싱 예방 안내 메시지 전송</a></li></div>
  <div class="sidebar-content"><li><a href="/pages/sendMessage/productPromotionMessage.jsp">수신 상품 프로모션 메시지 전송</a></li></div>
  <div class="sidebar-content"><li><a href="/pages/sendMessage/appPromotionMessage/appPromotionMessage.jsp">어플 프로모션 메시지 전송</a></li></div>
  <div class="sidebar-content"><li><a href="/pages/sendMessage/overdueNotificationMessage/overdueNotificationMessage.jsp">상환 관리 안내 메시지 전송</a></li></div>
  <div class="sidebar-submain">관리</div>
  <div class="sidebar-content"><li>전체 안내 메시지 관리</li></div>
  <div class="sidebar-content"><li><a href="/pages/manageMessage/voicefishingNotificationManage/voicefishingNotificationManage.jsp"> 보이스피싱 예방 안내 메시지 관리</a></li></div>
  <div class="sidebar-content"><li><a href="/pages/manageMessage/productPromotionManage/productPromotionManage.jsp">수신 상품 프로모션 메시지 관리</a></li></div>
  <div class="sidebar-content"><li><a href="/pages/manageMessage/appPromotionManage/appPromotionManage.jsp">어플 프로모션 메시지 관리</a></li></div>
  <div class="sidebar-content"><li ><a href="/pages/manageMessage/overdueNotificationManage/overdueNotificationManage.jsp">상환 관리 안내 메시지 관리</a></li></div>
  <div class="sidebar-submain"><a href="/pages/messageList/messageList.jsp">메시지 발송내역</a></div>
  <div class="sidebar-content"><li ><a href="/pages/messageList/voicefishingNotificationMessageList/voicefishingNotificationMessageList.jsp">보이스피싱 예방 안내 발송내역</a></li></div>
  <div class="sidebar-content"><li ><a href="/pages/messageList/productPromotionMessageList/prodMessageList.jsp">수신 상품 프로모션 발송내역</a></li></div>
  <div class="sidebar-content"><li ><a href="/pages/messageList/overdueNotificationMessageList/overdueNotificationMessageList.jsp">상환 관리 안내 발송내역</a></li></div>
  <div class="sidebar-submain"><a href="/pages/main/mainpage.jsp">메인페이지</a></div>

</section>
</body>
</html>
