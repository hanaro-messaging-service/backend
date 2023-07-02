package servlet;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import appPromotionMessagePackage.appPromotionDeleteDAO;
@WebServlet("/appPromotionDeleteServlet")
public class AppPromotionDeleteServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String selectedId = request.getParameter("tableId");
        Map<String,Object> map = new HashMap<>();
        map.put("tableId",selectedId);
        appPromotionDeleteDAO dao = new appPromotionDeleteDAO();
        dao.selectMessage(map);
        response.sendRedirect("/pages/manageMessage/appPromotionManage/appPromotionManage.jsp");
    }
}