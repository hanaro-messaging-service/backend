package servlet;

import messageCust.MessageCustoimizeDTO;
import messageCust.MessageCustomizeDAO;
import overdueNotificationMessage.overdueNotificationWriteDAO;
import overdueNotificationMessage.overdueNotificationWriteDTO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.net.URLDecoder;
import java.util.HashMap;
import java.util.Map;
import java.util.List;
@WebServlet("/overdueNotificationWrite")
public class OverdueNotificationWriteServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String tableId = request.getParameter("tableId");
        String selectedNameValue = request.getParameter("custNm");
        String selectedManValue = request.getParameter("man");
        String selectedWomanValue = request.getParameter("woman");
        String selectedCustGradeValue = request.getParameter("custGrade");
        String selectedCreditRatingValue = request.getParameter("creditRating");
        String selectedAgeValue = request.getParameter("age");
        String selectedSubTermValue = request.getParameter("subTerm");
        String selectedAssetValue = request.getParameter("asset");
        String selectedPrivacyYesValue = request.getParameter("privacyYes");
        String selectedOverdueYesValue = request.getParameter("overdueYes");
        String selectedOverdueNoValue = request.getParameter("overdueNo");
        String mContentsValue = request.getParameter("mContents");
        String mTitleValue = request.getParameter("mTitle");

        System.out.println("servlet"+tableId);

        Map<String, Object> map = new HashMap<>();
        map.put("custNm", selectedNameValue);
        map.put("man", selectedManValue);
        map.put("woman", selectedWomanValue);
        map.put("custGrade", selectedCustGradeValue);
        map.put("creditRating", selectedCreditRatingValue);
        map.put("age", selectedAgeValue);
        map.put("subTerm", selectedSubTermValue);
        map.put("asset", selectedAssetValue);
        map.put("privacy", selectedPrivacyYesValue);
        map.put("overdueYes", selectedOverdueYesValue);
        map.put("overdueNo", selectedOverdueNoValue);
        map.put("mContents", mContentsValue);
        map.put("mTitle", mTitleValue);
        map.put("tableId", tableId);

        overdueNotificationWriteDAO dao = new overdueNotificationWriteDAO();
        dao.selectMessage(map);
        System.out.println("삽입 완료");

        response.sendRedirect("/pages/manageMessage/overdueNotificationManage/overdueNotificationManage.jsp");

    }
}
