package servlet;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import productPromotionPackage.productPromotionDeleteDAO;
@WebServlet("/productPromotionDeleteServlet")
public class ProductPromotionDeleteServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String selectedId = request.getParameter("tableId");
        System.out.println(selectedId);
        Map<String,Object> map = new HashMap<>();
        map.put("tableId",selectedId);
        productPromotionDeleteDAO dao = new productPromotionDeleteDAO();
        dao.selectMessage(map);
        response.sendRedirect("/pages/manageMessage/productPromotionManage/productPromotionManage.jsp");

    }
}