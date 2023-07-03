package servlet;

import voicefishingNotificationMessagePackage.voicefishingNotificationModifyDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@WebServlet("/VoicefishingNotificationModifyServlet")
public class VoicefishingNotificationModifyServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String selectedPrivacyYesValue = request.getParameter("privacyYes");
        String selectedAgeValue = request.getParameter("age");
        String selectedNameValue = request.getParameter("custNm");
        String prodNmValue = request.getParameter("prodNm");
        String mContentsValue = request.getParameter("mContents");
        String tableId = request.getParameter("tableId");
        Map<String, Object> map = new HashMap<>();
        map.put("custNm", selectedNameValue);
        map.put("age", selectedAgeValue);
        map.put("privacy", selectedPrivacyYesValue);
        map.put("prodNm", prodNmValue);
        map.put("mContents", mContentsValue);
        map.put("tableId", tableId);
        voicefishingNotificationModifyDAO dao = new voicefishingNotificationModifyDAO();
        dao.selectMessage(map);
//        request.getRequestDispatcher("/pages/manageMessage/voicefishingNotificationManage/voicefishingNotificationModify.jsp").forward(request,response);
        response.sendRedirect("/pages/manageMessage/voicefishingNotificationManage/voicefishingNotificationManage.jsp");
    }
}