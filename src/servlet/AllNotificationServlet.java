package servlet;

import allNoticePackage.allNoticePackageDAO;
import allNoticePackage.allNoticePackageDTO;
import productPromotionPackage.productPromotionMessageDAO;
import productPromotionPackage.productPromotionMessageDTO;

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
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String selectedPrivacyYesValue = request.getParameter("selectedPrivacyYesValue");
        String selectedAgeValue = request.getParameter("selectedAgeValue");
        String selectedNameValue = request.getParameter("selectedNameValue");
        String selectedLocationValue = request.getParameter("selectedLocationValue");
        String selectedStartValue = request.getParameter("selectedStartValue");
        String selectedLastValue = request.getParameter("selectedLastValue");

        // Process the data as required
        Map<String, Object> map = new HashMap<>();
        Map<String, Object> pageMap = new HashMap<>();
        map.put("custNm", selectedNameValue);
        map.put("age", selectedAgeValue);
        map.put("address",selectedLocationValue);
        map.put("privacy", selectedPrivacyYesValue);
        map.put("location", selectedLocationValue);
        pageMap.put("custNm", selectedNameValue);
        pageMap.put("age", selectedAgeValue);
        pageMap.put("address",selectedLocationValue);
        pageMap.put("privacy", selectedPrivacyYesValue);
        pageMap.put("location", selectedLocationValue);
        pageMap.put("start",selectedStartValue);
        pageMap.put("last",selectedLastValue);

        // Set the response content type and encoding
        allNoticePackageDAO dao = new allNoticePackageDAO();


        if(Integer.parseInt(selectedStartValue) != 0) {
            allNoticePackageDAO pageDao = new allNoticePackageDAO();
            List<allNoticePackageDTO> pageInfos = pageDao.selectPaginatedMessage(pageMap);
            request.setAttribute("pageInfos", pageInfos);
            int a = Integer.parseInt(request.getParameter("totalPages"));
            request.setAttribute("custInfos",a);
        }
        else {

            int custInfos = dao.selectMessage(map);
            allNoticePackageDAO pageDao = new allNoticePackageDAO();
            List<allNoticePackageDTO> pageInfos = pageDao.selectPaginatedMessage(pageMap);
            request.setAttribute("pageInfos", pageInfos);
            request.setAttribute("custInfos", custInfos);
        }
        request.getRequestDispatcher("/pages/sendMessage/allNotificationMessage/allNotificationMessage.jsp").forward(request,response);
    }
}