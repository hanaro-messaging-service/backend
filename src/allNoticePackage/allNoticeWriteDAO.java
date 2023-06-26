package allNoticePackage;

import common.DBConnPool;
import java.sql.PreparedStatement;
import java.util.Map;

public class allNoticeWriteDAO extends DBConnPool {
    public allNoticeWriteDAO(){super();}

    public void selectMessage(Map<String, Object> map) {
        System.out.println("전체 발송 메시지 Write DAO");
        String custNm = (String) map.get("custNm");
        String privacy = (String) map.get("privacy");
        String age = (String) map.get("age");
        String mContents = (String)map.get("mContents");
        String mTitle = (String)map.get("mTitle");
        String tableId = (String)map.get("tableId");

        String query = "INSERT INTO all_noti_message (custNm, privacy, age, mTitle, mContents, id) " +
                "VALUES (?, ?, ?, ?, ?, ?)";

        try (PreparedStatement pstmt = con.prepareStatement(query)) {
            pstmt.setString(1, custNm);
            pstmt.setString(2, privacy);
            pstmt.setString(3, age);
            pstmt.setString(4, mTitle);
            pstmt.setString(5, mContents);
            pstmt.setString(6, tableId);

            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        finally{
            System.out.println("전체 발송 메시지 Write DAO 완료");
            close();
        }
    }
}
