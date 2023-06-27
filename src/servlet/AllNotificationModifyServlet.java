package servlet;

import allNoticePackage.allNoticeModifyDAO;
import allNoticePackage.allNoticePackageDTO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@WebServlet("/allNotificationModifyServlet")
public class AllNotificationModifyServlet extends HttpServlet{
    // 전체 안내 메시지 수정용 서블릿
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {}

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve the data sent from the JavaScript function
        System.out.println("allNotificationModifyServlet 시작");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String tableId = request.getParameter("tableId");
        String selectedPrivacyYesValue = request.getParameter("selectedPrivacyYesValue");
        String selectedAgeValue = request.getParameter("selectedAgeValue");
        String selectedNameValue = request.getParameter("selectedNameValue");
        String selectedLocationValue = request.getParameter("selectedLocationValue");
        System.out.println(selectedPrivacyYesValue + selectedAgeValue + selectedNameValue + tableId);

        // Process the data as required
        Map<String, Object> map = new HashMap<>();
        map.put("custNm", selectedNameValue);
        map.put("privacy", selectedPrivacyYesValue);
        map.put("age", selectedAgeValue);
        map.put("location", selectedLocationValue);
        map.put("tableId", tableId);

        // Set the response content type and encoding
        allNoticeModifyDAO dao = new allNoticeModifyDAO();
        dao.selectMessage(map);

        System.out.println("작업 완료");
        response.sendRedirect("/pages/manageMessage/allNotificationManage/allNotificationManage.jsp"); // 상대주소로 변경 완료
    }
}
