package servlet;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import allNoticePackage.allNoticeDeleteDAO;

@WebServlet("/allNotificationDeleteServlet")
public class AllNotificationDeleteServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String selectedId = request.getParameter("tableId");

        Map<String,Object> map = new HashMap<>();
        map.put("tableId",selectedId);
        allNoticeDeleteDAO dao = new allNoticeDeleteDAO();
        dao.selectMessage(map);
        response.sendRedirect("/pages/manageMessage/allNotificationManage/allNotificationManage.jsp");

    }
}
