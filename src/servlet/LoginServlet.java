package servlet;
import DAO.AdminDAO;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/login")

public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("dd");
        String id = request.getParameter("id");
        String password = request.getParameter("password");

        AdminDAO adminDAO = new AdminDAO();
        boolean authenticated = adminDAO.authenticateAdmin(id, password);

        if (authenticated) {
            response.sendRedirect("dashboard.jsp");

        } else {
            response.sendRedirect("login.jsp");
        }
    }

}