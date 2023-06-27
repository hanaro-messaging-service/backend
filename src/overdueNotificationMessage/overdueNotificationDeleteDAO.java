package overdueNotificationMessage;

import common.DBConnPool;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Map;

public class overdueNotificationDeleteDAO extends DBConnPool {
    public overdueNotificationDeleteDAO() {super();}
    public void selectMessage(Map<String, Object> map) {
        String tableId = (String) map.get("tableId");

        String query = "DELETE FROM overdue_noti_message WHERE id = ?";
        try (PreparedStatement pstmt = con.prepareStatement(query)) {
            pstmt.setString(1, tableId);
            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        finally{
            close();
        }
    }
}
