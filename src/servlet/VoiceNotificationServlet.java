package servlet;

import productPromotionPackage.productPromotionMessageDAO;
import productPromotionPackage.productPromotionMessageDTO;
import voicefishingNotificationMessagePackage.voicefishingNotificationDAO;
import voicefishingNotificationMessagePackage.voicefishingNotificationDAO;
import voicefishingNotificationMessagePackage.voicefishingNotificationDTO;

import customer.MemberDTO;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/VoiceNotificationServlet")
public class VoiceNotificationServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve the data sent from the JavaScript function

        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String selectedPrivacyYesValue = request.getParameter("selectedPrivacyYesValue");
        String selectedAgeValue = request.getParameter("selectedAgeValue");
        String selectedNameValue = request.getParameter("selectedNameValue");
        String selectedStartValue = request.getParameter("selectedStartValue");
        String selectedLastValue = request.getParameter("selectedLastValue");


        // Process the data as required
        Map<String, Object> map = new HashMap<>();
        Map<String, Object> pageMap = new HashMap<>();
        map.put("custNm", selectedNameValue);
        map.put("age", selectedAgeValue);;
        map.put("privacy", selectedPrivacyYesValue);
        map.put("start",selectedStartValue);
        map.put("last",selectedLastValue);


        pageMap.put("custNm", selectedNameValue);
        pageMap.put("age", selectedAgeValue);
        pageMap.put("privacy", selectedPrivacyYesValue);
        pageMap.put("start",selectedStartValue);
        pageMap.put("last",selectedLastValue);

        voicefishingNotificationDAO dao = new voicefishingNotificationDAO();
        if(Integer.parseInt(selectedStartValue) != 0) {
            voicefishingNotificationDAO pageDao = new voicefishingNotificationDAO();
            List<voicefishingNotificationDTO> pageInfos = pageDao.selectPaginatedMessage(pageMap);
            request.setAttribute("pageInfos", pageInfos);
            int a = Integer.parseInt(request.getParameter("totalPages"));
            request.setAttribute("custInfos",a);
        }
        else {

            int custInfos = dao.selectMessage(map);
            voicefishingNotificationDAO pageDao = new voicefishingNotificationDAO();
            List<voicefishingNotificationDTO> pageInfos = pageDao.selectPaginatedMessage(pageMap);
            request.setAttribute("custInfos", custInfos);
            request.setAttribute("pageInfos", pageInfos);
        }
        // Set the response content type and encoding

        request.getRequestDispatcher("/pages/sendMessage/voicefishingNotificationMessage/voicefishingNotificationMessage.jsp").forward(request,response);
    }
}