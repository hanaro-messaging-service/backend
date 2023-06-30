package servlet;

import allNoticePackage.allNoticePackageDAO;
import allNoticePackage.allNoticePackageDTO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet("/AllNotificationServlet")
public class AllNotificationServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("AllNotificationServlet 시작");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String selectedPrivacyYesValue = request.getParameter("selectedPrivacyYesValue");
        String selectedAgeValue = request.getParameter("selectedAgeValue");
        String selectedNameValue = request.getParameter("selectedNameValue");
        String selectedLocationValue = request.getParameter("selectedLocationValue");


        // Process the data as required
        Map<String, Object> map = new HashMap<>();
        map.put("custNm", selectedNameValue);
        map.put("age", selectedAgeValue);
        map.put("address",selectedLocationValue);
        map.put("privacy", selectedPrivacyYesValue);
        map.put("location", selectedLocationValue);

        // Set the response content type and encoding
        allNoticePackageDAO dao = new allNoticePackageDAO();
        List<allNoticePackageDTO> custInfos = dao.selectMessage(map);
        System.out.println("AllNotificationServlet 종료");
        request.setAttribute("pageInfos", custInfos);
        request.getRequestDispatcher("/pages/sendMessage/allNotificationMessage/allNotificationMessage.jsp").forward(request,response);
    }
}