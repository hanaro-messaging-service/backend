package servlet;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
@WebServlet(name = "CalcServlet2", value = "/CalcServlet2")
public class CalcServlet2 extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int num1 = 0;
        int num2 = 0;
        String name = "";
        request.setCharacterEncoding("utf-8");
        num1 = Integer.parseInt(request.getParameter("num1"));
        num2 = Integer.parseInt(request.getParameter("num2"));
        name = request.getParameter("userName");
        int result = num1 + num2;
        request.setAttribute("result", result);
        request.setAttribute("userName", name);
        //1. Dispatcher
        RequestDispatcher re =
                request.getRequestDispatcher("/basic/result_dispatcher.jsp");
        re.forward(request, response);
    }
}