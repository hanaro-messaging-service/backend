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
        System.out.println("OverdueNotificationServlet 시작");
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
        System.out.println(selectedPrivateValue);

        String selectedCreditValue = request.getParameter("selectedCreditRatingValue");
        String selectedOverdueYesValue = request.getParameter("selectedOverdueYes");
        String selectedOverdueNoValue = request.getParameter("selectedOverdueNo");

        // Process the data as required
        Map<String, Object> map = new HashMap<>();
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

        // Set the response content type and encoding
        overdueNotificationDAO dao = new overdueNotificationDAO();
        List<overdueNotificationDTO> custInfos = dao.selectMessage(map);
        System.out.println("OverdueNotificationServlet 종료");
        request.setAttribute("pageInfos", custInfos);
        request.getRequestDispatcher("pages/sendMessage/overdueNotificationMessage/overdueNotificationMessage.jsp").forward(request,response); // 상대주소로 변경 완료
    }
}