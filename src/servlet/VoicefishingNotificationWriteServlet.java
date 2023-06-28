package servlet;

import voicefishingNotificationMessagePackage.voicefishingNotificationWriteDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@WebServlet("/VoicefishingNotificationWrite")
public class VoicefishingNotificationWriteServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String selectedPrivacyYesValue = request.getParameter("privacyYes");
        String selectedAgeValue = request.getParameter("age");
        String selectedNameValue = request.getParameter("name");
        String prodNmValue = request.getParameter("prodNm");
        String mContentsValue = request.getParameter("mContents");
        Map<String, Object> map = new HashMap<>();
        System.out.println(selectedNameValue);
        map.put("custNm", selectedNameValue);
        map.put("age", selectedAgeValue);
        map.put("privacy", selectedPrivacyYesValue);
        map.put("prodNm", prodNmValue);
        map.put("mContents", mContentsValue);

        voicefishingNotificationWriteDAO dao = new voicefishingNotificationWriteDAO();
        dao.selectMessage(map);


        response.sendRedirect("/pages/manageMessage/voicefishingNotificationManage/voicefishingNotificationManage.jsp");

    }
}
