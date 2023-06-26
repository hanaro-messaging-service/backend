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
        String mContents = (String)map.get("mContents");
        String tableId = (String)map.get("tableId");
        System.out.println("DAO"+tableId);
        String query = "UPDATE voice_noti_message SET custNm = ?, age = ?," +
                "privacy = ?," +
                "mContents = ? WHERE id = ?";

        try (PreparedStatement pstmt = con.prepareStatement(query)) {
            pstmt.setString(1, custNm);
            pstmt.setString(2, age);
            pstmt.setString(3, privacy);
            pstmt.setString(4,mContents);
            pstmt.setString(5,tableId);
            System.out.println(pstmt);
            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        finally{
            close();
        }
    }
}