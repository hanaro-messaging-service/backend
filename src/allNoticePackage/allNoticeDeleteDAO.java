package allNoticePackage;

import common.DBConnPool;

import java.sql.PreparedStatement;
import java.util.Map;

public class allNoticeDeleteDAO extends DBConnPool{
    public allNoticeDeleteDAO(){ super();}
    public void selectMessage(Map<String, Object> map) {
        String tableId = (String) map.get("tableId");

        String query = "DELETE FROM all_noti_message WHERE id = ?";
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
