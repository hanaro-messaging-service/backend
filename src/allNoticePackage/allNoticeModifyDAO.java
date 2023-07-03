package allNoticePackage;

import common.DBConnPool;
import java.sql.PreparedStatement;
import java.util.Map;

public class allNoticeModifyDAO extends DBConnPool{
    public allNoticeModifyDAO(){super();}

    public void selectMessage(Map<String, Object> map) {
        String custNm = (String) map.get("custNm");
        String privacy = (String) map.get("privacy");
        String age = (String) map.get("age");
        String mTitle = (String)map.get("mTitle");
        String mContents = (String)map.get("mContents");
        String tableId = (String)map.get("tableId");
        String location = (String)map.get("location");

        String query = "UPDATE all_noti_message SET custNm = ?, privacy = ?, age = ?, mTitle = ?, mContents = ?, location = ?" +
                " WHERE id = ?";

        try (PreparedStatement pstmt = con.prepareStatement(query)) {
            pstmt.setString(1, custNm);
            pstmt.setString(2, privacy);
            pstmt.setString(3, age);
            pstmt.setString(4, mTitle);
            pstmt.setString(5, mContents);
            pstmt.setString(6, location);
            pstmt.setString(7, tableId);
            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        finally{
            close();
        }
    }
}
