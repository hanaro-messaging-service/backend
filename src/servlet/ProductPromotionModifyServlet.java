package servlet;

import productPromotionPackage.productPromotionModifyDAO;
import productPromotionPackage.productPromotionWriteDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@WebServlet("/productPromotionModifyServlet")
public class ProductPromotionModifyServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String selectedManValue = request.getParameter("man");
        String selectedWomanValue = request.getParameter("woman");
        String selectedPrivacyYesValue = request.getParameter("privacyYes");
        String selectedJobValue = request.getParameter("job");
        String selectedPrivateValue = request.getParameter("private");
        String selectedAgeValue = request.getParameter("age");
        String selectedPeriodValue = request.getParameter("period");
        String selectedNameValue = request.getParameter("custNm");
        String selectedAppValue = request.getParameter("app");
        String selectedAssetValue = request.getParameter("asset");
        String selectedLocationValue = request.getParameter("location");
        String selectedBranchValue = request.getParameter("branch");
        String prodNmValue = request.getParameter("prodNm");
        String mContentsValue = request.getParameter("mContents");
        String tableId = request.getParameter("tableId");
        Map<String, Object> map = new HashMap<>();
        map.put("custNm", selectedNameValue);
        map.put("recLoginDate", selectedAppValue);
        map.put("asset", selectedAssetValue);
        map.put("man", selectedManValue);
        map.put("woman", selectedWomanValue);
        map.put("age", selectedAgeValue);
        map.put("privacy", selectedPrivacyYesValue);
        map.put("job", selectedJobValue);
        map.put("private", selectedPrivateValue);
        map.put("period", selectedPeriodValue);
        map.put("branch",selectedBranchValue);
        map.put("address",selectedLocationValue);
        map.put("prodNm", prodNmValue);
        map.put("mContents", mContentsValue);
        map.put("tableId", tableId);
        productPromotionModifyDAO dao = new productPromotionModifyDAO();
        dao.selectMessage(map);
//        request.getRequestDispatcher("/pages/manageMessage/productPromotionManage/productPromotionModify.jsp").forward(request,response);
        response.sendRedirect("/pages/manageMessage/productPromotionManage/productPromotionManage.jsp");
    }
}