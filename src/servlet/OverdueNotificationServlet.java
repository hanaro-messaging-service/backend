package servlet;

import overdueNotificationMessage.overdueNotificationDAO;
import overdueNotificationMessage.overdueNotificationDTO;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/OverdueNotificationServlet")
public class OverdueNotificationServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {}

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve the data sent from the JavaScript function

        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String selectedManValue = request.getParameter("selectedManValue");
        String selectedWomanValue = request.getParameter("selectedWomanValue");
        String selectedPrivacyYesValue = request.getParameter("selectedPrivacyYesValue");
        String selectedJobValue = request.getParameter("selectedJobValue");
        String selectedPrivateValue = request.getParameter("selectedCustGradeValue");
        String selectedAgeValue = request.getParameter("selectedAgeValue");
        String selectedPeriodValue = request.getParameter("selectedPeriodValue");
        String selectedNameValue = request.getParameter("selectedNameValue");
        String selectedAssetValue = request.getParameter("selectedAssetValue");
        String selectedLocationValue = request.getParameter("selectedLocationValue");
        String selectedBranchValue = request.getParameter("selectedBranchValue");
        String selectedStartValue = request.getParameter("selectedStartValue");
        String selectedLastValue = request.getParameter("selectedLastValue");


        String selectedCreditValue = request.getParameter("selectedCreditRatingValue");
        String selectedOverdueYesValue = request.getParameter("selectedOverdueYes");
        String selectedOverdueNoValue = request.getParameter("selectedOverdueNo");

        // Process the data as required
        Map<String, Object> map = new HashMap<>();
        Map<String, Object> pageMap = new HashMap<>();
        map.put("custNm", selectedNameValue);
        map.put("asset", selectedAssetValue);
        map.put("man", selectedManValue);
        map.put("woman", selectedWomanValue);
        map.put("age", selectedAgeValue);
        map.put("privacyYes", selectedPrivacyYesValue);
        map.put("job", selectedJobValue);
        map.put("custGrade", selectedPrivateValue); // 고객등급(custGrade)
        map.put("period", selectedPeriodValue);
        map.put("branch",selectedBranchValue);
        map.put("creditRating", selectedCreditValue); // 신용등급(custRating)
        map.put("overdueYes", selectedOverdueYesValue);
        map.put("overdueNo", selectedOverdueNoValue);
        map.put("location", selectedLocationValue);

        pageMap.put("custNm", selectedNameValue);
        pageMap.put("asset", selectedAssetValue);
        pageMap.put("man", selectedManValue);
        pageMap.put("woman", selectedWomanValue);
        pageMap.put("age", selectedAgeValue);
        pageMap.put("privacyYes", selectedPrivacyYesValue);
        pageMap.put("job", selectedJobValue);
        pageMap.put("custGrade", selectedPrivateValue); // 고객등급(custGrade)
        pageMap.put("period", selectedPeriodValue);
        pageMap.put("branch",selectedBranchValue);
        pageMap.put("creditRating", selectedCreditValue); // 신용등급(custRating)
        pageMap.put("overdueYes", selectedOverdueYesValue);
        pageMap.put("overdueNo", selectedOverdueNoValue);
        pageMap.put("location", selectedLocationValue);
        pageMap.put("start",selectedStartValue);
        pageMap.put("last",selectedLastValue);
        // Set the response content type and encoding
        overdueNotificationDAO dao = new overdueNotificationDAO();
        if(Integer.parseInt(selectedStartValue) != 0) {
            overdueNotificationDAO pageDao = new overdueNotificationDAO();
            List<overdueNotificationDTO> pageInfos = pageDao.selectPaginatedMessage(pageMap);
            request.setAttribute("pageInfos",pageInfos);
            int a = Integer.parseInt(request.getParameter("totalPages"));
            request.setAttribute("custInfos",a);
        }
        else{
            int custInfos = dao.selectMessage(map);
            overdueNotificationDAO pageDao = new overdueNotificationDAO();
            List<overdueNotificationDTO> pageInfos = pageDao.selectPaginatedMessage(pageMap);
            request.setAttribute("pageInfos", pageInfos);
            request.setAttribute("custInfos", custInfos);
        }

        request.getRequestDispatcher("pages/sendMessage/overdueNotificationMessage/overdueNotificationMessage.jsp").forward(request,response); // 상대주소로 변경 완료
    }
}