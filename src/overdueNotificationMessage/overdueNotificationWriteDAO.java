package overdueNotificationMessage;

import common.DBConnPool;

import java.sql.PreparedStatement;
import java.util.Map;

public class overdueNotificationWriteDAO extends DBConnPool {
    public overdueNotificationWriteDAO() {
        super();
    }

    public void selectMessage(Map<String, Object> map) {
        String custNm = (String) map.get("custNm");
        String man = (String) map.get("man");
        String woman = (String) map.get("woman");
        if(man==null) man = "N";
        if(woman==null) woman="N";
        String gender = man+woman;
        String custGrade = (String) map.get("custGrade");
        String creditRating = (String) map.get("creditRating");
        String age = (String) map.get("age");
        String subTerm = (String) map.get("subTerm");
        String asset = (String) map.get("asset");
        String privacy = (String) map.get("privacy");

        String overdueYes = (String) map.get("overdueYes");
        String overdueNo = (String) map.get("overdueNo");
        if(overdueYes==null) overdueYes="N";
        if(overdueNo==null) overdueNo="N";

        String mContents = (String)map.get("mContents");
        String mTitle = (String)map.get("mTitle");
        String tableId = (String)map.get("tableId");

        String overdue = overdueYes+overdueNo;
        String query = "INSERT INTO overdue_noti_message (custNm, gender, custGrade, creditRating, age, subTerm, asset, privacy, overdue, mContents, mTitle, id) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (PreparedStatement pstmt = con.prepareStatement(query)) {
            pstmt.setString(1, custNm);
            pstmt.setString(2, gender);
            pstmt.setString(3, custGrade);
            pstmt.setString(4, creditRating);
            pstmt.setString(5, age);
            pstmt.setString(6, subTerm);
            pstmt.setString(7, asset);
            pstmt.setString(8, privacy);
            pstmt.setString(9, overdue);
            pstmt.setString(10, mContents);
            pstmt.setString(11, mTitle);
            pstmt.setString(12, tableId);

            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        finally{

            close();
        }
    }
}
