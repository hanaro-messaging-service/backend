package appPromotionMessagePackage;
import common.DBConnPool;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Map;

public class appPromotionDeleteDAO extends DBConnPool {
    public appPromotionDeleteDAO() {
        super();
    }

    public void selectMessage(Map<String, Object> map) {
        String tableId = (String) map.get("tableId");

        String query = "DELETE FROM app_promo_message WHERE id = ?";
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