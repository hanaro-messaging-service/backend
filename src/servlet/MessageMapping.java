package servlet;

import messageCust.MessageCustoimizeDTO;
import messageCust.MessageCustomizeDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.net.URLDecoder;
import java.util.HashMap;
import java.util.Map;
import java.util.List;
@WebServlet("/MessageMapping")
public class MessageMapping extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String custNm = request.getParameter("custNm");
        custNm = URLDecoder.decode(custNm, "UTF-8");
        String message = request.getParameter("messageText");
        message = URLDecoder.decode(message, "UTF-8");
        String privacyYes = request.getParameter("privacyYes");
        String privacyNo = request.getParameter("privacyNo");
        String male = request.getParameter("male");
        String female = request.getParameter("female");
        String age = request.getParameter("age");
        String job = request.getParameter("job");
        job = URLDecoder.decode(job, "UTF-8");
        String privateRate = request.getParameter("privateRate");
        String asset = request.getParameter("asset");
        asset = URLDecoder.decode(asset, "UTF-8");
        String app = request.getParameter("app");
        app = URLDecoder.decode(app, "UTF-8");
        String period = request.getParameter("period");
        period = URLDecoder.decode(period, "UTF-8");
        String moneyExpYes = request.getParameter("moneyExpYes");
        String moneyExpNo = request.getParameter("moneyExpNo");
        MessageCustomizeDAO messageCustomizeDAO = new MessageCustomizeDAO();
        Map<String, Object> map = new HashMap<>();
        map.put("custNm", custNm);
        map.put("message", message);
        map.put("privacyYes", privacyYes);
        map.put("privacyNo", privacyNo);
        map.put("male", male);
        map.put("female", female);
        map.put("age", age);
        map.put("job", job);
        map.put("privateRate", privateRate);
        map.put("asset", asset);
        map.put("app", app);
        map.put("period", period);
        map.put("moneyExpYes", moneyExpYes);
        map.put("moneyExpNo", moneyExpNo);
        List < MessageCustoimizeDTO> messageInfos = messageCustomizeDAO.selectMessage(map);
//        for (Map.Entry<String, Object> entry : map.entrySet()) {
//        .(entry.getKey() + ": " + entry.getValue());
//        }

        response.sendRedirect("/pages/message/messagelist.jsp");
    }
}
