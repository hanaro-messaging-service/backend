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
        String selectedPrivateValue = request.getParameter("selectedPrivateValue");
        String selectedAgeValue = request.getParameter("selectedAgeValue");
        String selectedPeriodValue = request.getParameter("selectedPeriodValue");
        String selectedNameValue = request.getParameter("selectedNameValue");
        String selectedAppValue = request.getParameter("selectedAppValue");
        String selectedAssetValue = request.getParameter("selectedAssetValue");
        String selectedLocationValue = request.getParameter("selectedLocationValue");
        String selectedBranchValue = request.getParameter("selectedBranchValue");
        System.out.println(selectedPrivateValue);

        String selectedCreditValue = request.getParameter("selectedCreditValue");
        String selectedOverdueYesValue = request.getParameter("selectedOverdueYes");
        String selectedOverdueNoValue = request.getParameter("selectedOverdueNo");

        // Process the data as required
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
        map.put("credit", selectedCreditValue);
        map.put("overdue", selectedOverdueYesValue);
        map.put("non_overdue", selectedOverdueNoValue);

        // Set the response content type and encoding
        overdueNotificationDAO dao = new overdueNotificationDAO();
        List<overdueNotificationDTO> custInfos = dao.selectMessage(map);
        request.setAttribute("custInfos", custInfos);
        request.getRequestDispatcher("pages/sendMessage/overdueNotificationMessage/overdueNotificationMessage.jsp").forward(request,response); // 상대주소로 변경 완료
    }
}