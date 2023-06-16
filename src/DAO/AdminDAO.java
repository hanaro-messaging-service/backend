package DAO;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class AdminDAO {
    private static final String jdbcUrl = "jdbc:mysql://localhost:3306/hanaromessage.c0p4ufgutplk.ap-northeast-2.rds.amazonaws.com";
    private static final String dbUser = "admin";
    private static final String dbPassword = "gkskfh1!";

    public boolean authenticateAdmin(String id, String password) {
        try (Connection connection = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword)) {
            String query = "SELECT * FROM admin_info WHERE id = ? AND password = ?";
            try (PreparedStatement statement = connection.prepareStatement(query)) {
                statement.setString(1, id);
                statement.setString(2, password);
                ResultSet resultSet = statement.executeQuery();

                return resultSet.next();
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // 에러 처리
        }

        return false;
    }
}