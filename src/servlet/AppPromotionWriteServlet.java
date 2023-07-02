package servlet;

import appPromotionMessagePackage.appPromotionWriteDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.net.URLDecoder;
import java.util.HashMap;
import java.util.Map;
import java.util.List;
@WebServlet("/appPromotionWriteServlet")
public class AppPromotionWriteServlet extends HttpServlet {
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
        String selectedNameValue = request.getParameter("name");
        String selectedAppValue = request.getParameter("app");
        String selectedAssetValue = request.getParameter("asset");
        String prodNmValue = request.getParameter("prodNm");
        String mContentsValue = request.getParameter("mContents");
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
        map.put("prodNm", prodNmValue);
        map.put("mContents", mContentsValue);

        appPromotionWriteDAO dao = new appPromotionWriteDAO();
        dao.selectMessage(map);


        response.sendRedirect("/pages/manageMessage/appPromotionManage/appPromotionManage.jsp");

    }
}
