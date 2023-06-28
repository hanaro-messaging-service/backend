package messageHistory.overdueNotificationMessageHistory;


import common.DBConnPool;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
public class messageHistoryDAO extends DBConnPool {
    public messageHistoryDAO () {
        super();
    }

    public void  selectMessage(Map<String, Object> map) {
        // 메시지 전송내역 추가 DAO
        System.out.println("전송내역 삽입");
        String category = (String) map.get("category");
        String contents = (String) map.get("contents");
        String title = (String) map.get("title");
        String time = (String) map.get("time");
        String man = (String) map.get("man");
        String woman = (String) map.get("woman");
        if(man==null) man = "N";
        if(woman==null) woman="N";
        String gender = man+woman;

        String custNm = (String) map.get("custNm");
        String age = (String) map.get("age");
        String overdueYes = (String) map.get("overdueYes");
        String overdueNo = (String) map.get("overdueNo");
        if (overdueYes == null) overdueYes = "N";
        if (overdueNo == null) overdueNo = "N";
        String overdue = overdueYes + overdueNo;

        String asset = (String) map.get("asset");
        String privacy = (String) map.get("privacy");
        String subTerm = (String) map.get("subTerm");
        String custGrade = (String) map.get("custGrade");
        String creditRating = (String) map.get("creditRating");

//        String job = (String) map.get("job");
//        String address = (String) map.get("address");
//        String branch = (String) map.get("branch");
//        String recLoginDate = (String) map.get("recLoginDate");
        int counts = (int) map.get("counts");

        String query = "INSERT INTO overdue_send_message_list (category,contents,title,time,gender,counts,custNm,age,overdue,asset,privacy, subTerm, custGrade, creditRating) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try (PreparedStatement pstmt = con.prepareStatement(query)) {
            pstmt.setString(1, category);
            pstmt.setString(2, contents);
            pstmt.setString(3, title);
            pstmt.setString(4, time);
            pstmt.setString(5, gender);
            pstmt.setInt(6, counts);
            pstmt.setString(7, custNm);
            pstmt.setString(8, age);
            pstmt.setString(9, overdue);
            pstmt.setString(10, asset);
            pstmt.setString(11, privacy);
            pstmt.setString(12, subTerm);
            pstmt.setString(13, custGrade);
            pstmt.setString(14, creditRating);
            pstmt.executeUpdate();
            System.out.println(query);
            System.out.println(pstmt);
        } catch (Exception e) {
            e.printStackTrace();
        }
        finally {
            close();
        }
    }
    public List<messageHistoryDTO> readMessage () {
        String selectQuery = "SELECT * FROM overdue_send_message_list";
        List<messageHistoryDTO> messageInfos = new ArrayList<>();
        try(PreparedStatement pstmt = con.prepareStatement(selectQuery)){
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                messageHistoryDTO member = new messageHistoryDTO();
                member.setCategory(rs.getString("category"));
                member.setContents(rs.getString("contents"));
                member.setTitle(rs.getString("title"));
                member.setTime(rs.getString("time"));
                member.setGender(rs.getString("gender"));
                member.setCounts(rs.getInt("counts"));
                member.setCustNm(rs.getString("custNm"));
                member.setAge(rs.getString("age"));
                member.setOverdue(rs.getString("overdue"));
                member.setAsset(rs.getString("asset"));
                member.setPrivacy(rs.getString("privacy"));
                member.setSubTerm(rs.getString("subTerm"));
                member.setCustGrade(rs.getString("custGrade"));
                member.setCreditRating(rs.getString("creditRating"));
                messageInfos.add(member);

//                member.setJob(rs.getString("job"));
//                member.setRecLoginDate(rs.getString("recLoginDate"));
//                member.setAddress(rs.getString("address"));
//                member.setBranch(rs.getString("branch"));
            }
        }
        catch(Exception e) {

        }
        finally{
            close();
        }
        return messageInfos;
    }
}
