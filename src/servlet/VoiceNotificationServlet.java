package servlet;

import voicefishingNotificationMessagePackage.voicefishingNotificationDAO;
import voicefishingNotificationMessagePackage.voicefishingNotificationDTO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
        String selectedLocationValue = request.getParameter("selectedLocationValue");


        // Process the data as required
        Map<String, Object> map = new HashMap<>();
        map.put("custNm", selectedNameValue);
        map.put("age", selectedAgeValue);
        map.put("address",selectedLocationValue);
        map.put("privacy", selectedPrivacyYesValue);

        // Set the response content type and encoding
        voicefishingNotificationDAO dao = new voicefishingNotificationDAO();
        List<voicefishingNotificationDTO> custInfos = dao.selectMessage(map);
        request.setAttribute("custInfos", custInfos);
        request.getRequestDispatcher("/").forward(request,response);
    }
}