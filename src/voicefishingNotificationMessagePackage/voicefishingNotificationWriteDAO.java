package voicefishingNotificationMessagePackage;

import common.DBConnPool;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Map;

public class voicefishingNotificationWriteDAO extends DBConnPool {
    public voicefishingNotificationWriteDAO() {
        super();
    }

    public void selectMessage(Map<String, Object> map) {
        String custNm = (String) map.get("custNm");
        String age = (String) map.get("age");
        String privacy = (String) map.get("privacy");
        String mContents = (String)map.get("mContents");
        System.out.println(mContents);
        String query = "INSERT INTO voice_noti_message (custNm, age, privacy, mContents) " +
                "VALUES (?, ?, ?, ?)";

        try (PreparedStatement pstmt = con.prepareStatement(query)) {
            pstmt.setString(1, custNm);
            pstmt.setString(2, age);
            pstmt.setString(3, privacy);
            pstmt.setString(4,mContents);

            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        finally{
            close();
        }
    }
}
