package voicefishingNotificationMessagePackage;

import common.DBConnPool;

import java.sql.PreparedStatement;
import java.util.Map;

public class voicefishingNotificationModifyDAO extends DBConnPool {
    public voicefishingNotificationModifyDAO() {
        super();
    }

    public void selectMessage(Map<String, Object> map) {
        String custNm = (String) map.get("custNm");
        String age = (String) map.get("age");
        String privacy = (String) map.get("privacy");
        String prodNm = (String) map.get("prodNm");
        String mContents = (String)map.get("mContents");
        String tableId = (String)map.get("tableId");

        String query = "UPDATE voice_noti_message SET custNm = ?, age = ?," +
                "privacy = ?," +
                "prodNm = ?, mContents = ? WHERE id = ?";

        try (PreparedStatement pstmt = con.prepareStatement(query)) {
            pstmt.setString(1, custNm);
            pstmt.setString(2, age);
            pstmt.setString(3, privacy);
            pstmt.setString(4, prodNm);
            pstmt.setString(5,mContents);
            pstmt.setString(6,tableId);

            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        finally{
            close();
        }
    }
}