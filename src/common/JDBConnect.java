package common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletContext;

public class JDBConnect {
    public Connection con;
    public Statement stmt;
    public PreparedStatement psmt;
    public ResultSet rs;

    // 기본 생성자
    public JDBConnect(ServletContext application) {
        try {
            // JDBC 드라이버 로드
            String driver = application.getInitParameter("MySQLDriver");
            Class.forName("com.mysql.jdbc.Driver");

            // DB에 연결
            String url = application.getInitParameter("MySQLURL");
            String id = application.getInitParameter("MySQLId");
            String pwd = application.getInitParameter("MySQLPwd");
            con = DriverManager.getConnection(url, id, pwd);

        }
        catch (Exception e) {
            e.printStackTrace();
        }
    }

    // 연결 해제(자원 반납)
    public void close() {
        try {
            if (rs != null) rs.close();
            if (stmt != null) stmt.close();
            if (psmt != null) psmt.close();
            if (con != null) con.close();


        }
        catch (Exception e) {
            e.printStackTrace();
        }
    }
}