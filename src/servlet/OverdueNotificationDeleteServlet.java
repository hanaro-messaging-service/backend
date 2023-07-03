package servlet;
// overdueNotificationDeleteServlet

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import overdueNotificationMessage.overdueNotificationDeleteDAO;
import productPromotionPackage.productPromotionDeleteDAO;

@WebServlet("/overdueNotificationDeleteServlet")

public class OverdueNotificationDeleteServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String selectedId = request.getParameter("tableId");
        Map<String,Object> map = new HashMap<>();
        map.put("tableId",selectedId);
        overdueNotificationDeleteDAO dao = new overdueNotificationDeleteDAO();
        dao.selectMessage(map);
        response.sendRedirect("/pages/manageMessage/overdueNotificationManage/overdueNotificationManage.jsp");

    }
}
