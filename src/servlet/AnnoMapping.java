package servlet;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import customer.MemberDAO;
import customer.MemberDTO;

@WebServlet("/annoMapping")
public class AnnoMapping extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String selectedNameValue = request.getParameter("selectedNameValue");
        String selectedAppValue = request.getParameter("selectedAppValue");
        String selectedAssetValue = request.getParameter("selectedAssetValue");
        String selectedCheckBoxManValue = request.getParameter("selectedManValue");
        String selectedCheckBoxWomanValue = request.getParameter("selectedWomanValue");
        String selectedCheckBoxPrivacyYes = request.getParameter("selectedPrivacyYesValue");
        String selectedCheckBoxPrivacyNo = request.getParameter("selectedPrivacyNoValue");
        String selectedJobValue = request.getParameter("selectedJobValue");
        String selectedPrivateValue = request.getParameter("selectedPrivateValue");
        String selectedAgeValue = request.getParameter("selectedAgeValue");
        String selectedAgePartValue = request.getParameter("selectedAgePartValue");
        String selectedPeriodValue = request.getParameter("selectedPeriodValue");
        String selectedMoneyExpYes = request.getParameter("selectedMoneyExpYesValue");
        String selectedMoneyExpNo = request.getParameter("selectedMoneyExpNoValue");
        System.out.println(selectedMoneyExpYes);
        System.out.println(selectedMoneyExpNo);
        // DAO를 사용하여 데이터 조회
        MemberDAO memberDAO = new MemberDAO();
        Map<String, Object> map = new HashMap<>();

        map.put("name",selectedNameValue);
        map.put("asset",selectedAssetValue);
        map.put("dateRange", selectedAppValue);
        map.put("man", selectedCheckBoxManValue);
        map.put("woman", selectedCheckBoxWomanValue);
        map.put("age", selectedAgeValue);
        map.put("agePart", selectedAgePartValue);
        map.put("privacyYes",selectedCheckBoxPrivacyYes);
        map.put("privacyNo",selectedCheckBoxPrivacyNo);
        map.put("job", selectedJobValue);
        map.put("private",selectedPrivateValue);
        map.put("period", selectedPeriodValue);
        map.put("moneyExpYes",selectedMoneyExpYes);
        map.put("moneyExpNo",selectedMoneyExpNo);

        List<MemberDTO> custInfos = memberDAO.selectCustomer(map);


        request.setAttribute("custInfos", custInfos);
        request.getRequestDispatcher("/").forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setCharacterEncoding("UTF-8"); // 응답의 인코딩 설정

        System.out.println("Hello World");
    }
}
