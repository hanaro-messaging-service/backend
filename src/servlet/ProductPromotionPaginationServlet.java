package servlet;

import productPromotionPackage.productPromotionMessageDAO;
import productPromotionPackage.productPromotionMessageDTO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet("/productPromotionPaginationServlet")
public class ProductPromotionPaginationServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String selectedManValue = request.getParameter("selectedManValue");
        String selectedWomanValue = request.getParameter("selectedWomanValue");
        String selectedPrivacyYesValue = request.getParameter("selectedPrivacyYesValue");
        String selectedJobValue = request.getParameter("selectedJobValue");
        String selectedPrivateValue = request.getParameter("selectedPrivateValue");
        String selectedAgeValue = request.getParameter("selectedAgeValue");
        String selectedPeriodValue = request.getParameter("selectedPeriodValue");
        String selectedNameValue = request.getParameter("selectedNameValue");
        String selectedAppValue = request.getParameter("selectedAppValue");
        String selectedAssetValue = request.getParameter("selectedAssetValue");
        String selectedLocationValue = request.getParameter("selectedLocationValue");
        String selectedBranchValue = request.getParameter("selectedBranchValue");
        String selectedStartValue = request.getParameter("selectedStartValue");
        String selectedLastValue = request.getParameter("selectedLastValue");
        Map<String, Object> pageMap = new HashMap<>();
        pageMap.put("custNm", selectedNameValue);
        pageMap.put("recLoginDate", selectedAppValue);
        pageMap.put("asset", selectedAssetValue);
        pageMap.put("man", selectedManValue);
        pageMap.put("woman", selectedWomanValue);
        pageMap.put("age", selectedAgeValue);
        pageMap.put("privacy", selectedPrivacyYesValue);
        pageMap.put("job", selectedJobValue);
        pageMap.put("private", selectedPrivateValue);
        pageMap.put("period", selectedPeriodValue);
        pageMap.put("branch",selectedBranchValue);
        pageMap.put("address",selectedLocationValue);
        pageMap.put("start",selectedStartValue);
        pageMap.put("last",selectedLastValue);
        System.out.println("start"+selectedStartValue);
        System.out.println("last"+selectedLastValue);
        productPromotionMessageDAO pageDao = new productPromotionMessageDAO();
        List<productPromotionMessageDTO> pageInfos = pageDao.selectPaginatedMessage(pageMap);
        request.setAttribute("pageInfos", pageInfos);
        request.getRequestDispatcher("/pages/sendMessage/productPromotionMessage.jsp").forward(request,response);
    }
}