<%@ page import="java.io.BufferedReader"%>
<%@ page import="java.io.FileReader"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.Map"%>
<%@ page import="java.util.List" %>
<%@ page import="email.emailSMTP"%>
<%@ page import="productPromotionMessageHistory.prodMessageHistoryDAO" %>
<%@ page import="productPromotionMessageHistory.prodMessageHistoryDTO" %>
<%@ page import="java.lang.reflect.Array" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%
  // 폼값(이메일 내용) 저장
  request.setCharacterEncoding("UTF-8");
  response.setCharacterEncoding("UTF-8");
  if (request.getParameter("subject").equals("") || request.getParameter("content").equals("")) {
    out.print("<script>window.alert('이메일 전송 실패! 메시지제목과 내용을 확인하세요!'); window.location.href='/pages/sendMessage/productPromotionMessage.jsp'</script>");
  }
  if (request.getParameter("subject") == null || request.getParameter("content") == null || request.getParameter("subject").equals("") || request.getParameter("content").equals("")) {
    out.print("<script>window.alert('이메일 전송 실패'); window.location.href='/pages/sendMessage/productPromotionMessage.jsp'</script>");
  }
  Map<String, String> emailInfo = new HashMap<String, String>();
  Map<String, String[]> toInfo = new HashMap<>();
  System.out.println("인코딩"+request.getParameter("content"));
  emailInfo.put("from", request.getParameter("from"));  // 보내는 사람
  // 받는 사람들의 이메일 배열
  String[] toEmails = request.getParameterValues("to");
  toInfo.put("to", toEmails);
  emailInfo.put("subject", request.getParameter("subject"));  // 제목
  System.setProperty("https.protocols", "TLSv1,TLSv1.1,TLSv1.2");



  System.setProperty("jdk.tls.client.protocols", "TLSv1.2");
// 내용은 메일 포맷에 따라 다르게 처리
  String content = request.getParameter("content");  // 내용
//  System.out.println(content);
  String format = request.getParameter("format");    // 메일 포맷(text 혹은 html)
//  System.out.println("format"+format);
  if (format.equals("text")) {
    // 텍스트 포맷일 때는 그대로 저장
    emailInfo.put("content", content);
    emailInfo.put("format", "text/plain;charset=UTF-8");
  }
  else if (format.equals("html")) {
    // HTML 포맷일 때는 HTML 형태로 변환해 저장
    content = content.replace("\r\n", "<br/>");  // 줄바꿈을 HTML 형태로 수정

    String htmlContent = ""; // HTML용으로 변환된 내용을 담을 변수
    try {
      // HTML 메일용 템플릿 파일 읽기
      String templatePath = application.getRealPath("/pages/email/emailTemplate.html");
      BufferedReader br = new BufferedReader(new FileReader(templatePath));

      // 한 줄씩 읽어 htmlContent 변수에 저장
      String oneLine;
      while ((oneLine = br.readLine()) != null) {
        htmlContent += oneLine + "\n";
      }
      br.close();
    }
    catch (Exception e) {
      e.printStackTrace();
    }

    // 템플릿의 "__CONTENT__" 부분을 메일 내용 대체 (변환 완료)
    htmlContent = htmlContent.replace("__CONTENT__", content);
    // 변환된 내용을 저장
    emailInfo.put("content", htmlContent);
    emailInfo.put("format", "text/html;charset=UTF-8");
  }
  //  여기까지는 이메일 보내는 로직
  // 이후가 db쌓는 로직
  String category = request.getParameter("category");
  String contents = request.getParameter("content");
  String title = request.getParameter("subject");
  String time =request.getParameter("date");
  String selectedManValue = request.getParameter("man");
  String selectedWomanValue = request.getParameter("woman");
  String selectedPrivacyYesValue = request.getParameter("privacyYes");
  String selectedJobValue = request.getParameter("job");
  String selectedPrivateValue = request.getParameter("private");
  String selectedAgeValue = request.getParameter("age");
  String selectedPeriodValue = request.getParameter("period");
  String selectedNameValue = request.getParameter("name");
  String selectedAppValue = request.getParameter("app");
  String selectedAssetValue = request.getParameter("asset");
  String selectedLocationValue = request.getParameter("location");
  String selectedBranchValue = request.getParameter("branch");
  Map<String, Object> map = new HashMap<>();
  map.put("category",category);
  map.put("contents",contents);
  map.put("title",title);
  map.put("time",time);
  map.put("custNm", selectedNameValue);
  map.put("recLoginDate", selectedAppValue);
  map.put("asset", selectedAssetValue);
  map.put("man", selectedManValue);
  map.put("woman", selectedWomanValue);
  map.put("age", selectedAgeValue);
  map.put("privacy", selectedPrivacyYesValue);
  map.put("job", selectedJobValue);
  map.put("private", selectedPrivateValue);
  map.put("period", selectedPeriodValue);
  map.put("branch",selectedBranchValue);
  map.put("address",selectedLocationValue);
  String counts = request.getParameter("counts");
  int countValue = 0;
  if (counts != null) {
    countValue = Integer.parseInt(counts);
  }
  map.put("counts", countValue);


  System.out.println("counts"+counts);
  try {
    emailSMTP smtpServer = new emailSMTP();  // 메일 전송 클래스 생성
    smtpServer.emailSending(emailInfo,toInfo);      // 전송
    prodMessageHistoryDAO dao = new prodMessageHistoryDAO();
    dao.selectMessage(map);

    out.print("<script>window.alert('이메일 전송 성공'); </script>");
    response.sendRedirect("/pages/messageList/messageList.jsp"); // 리다이렉트
  }
  catch (Exception e) {
    out.print("<script>window.alert(''이메일 전송 실패! 검색 목록, 메세지 제목, 메세지 내용 확인하세요''); window.location.href='/pages/sendMessage/productPromotionMessage.jsp'</script>");
    e.printStackTrace();
  }
%>