package messageHistory.allNotificationMessageHistory;


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

    public void selectMessage(Map<String, Object> map) {
        // 메시지 전송내역 추가 DAO
        System.out.println("전송내역 삽입");
        String category = (String) map.get("category");
        String contents = (String) map.get("contents");
        String title = (String) map.get("title");
        String time = (String) map.get("time");
        String custNm = (String) map.get("custNm");
        String age = (String) map.get("age");
        String privacy = (String) map.get("privacy");
        String location = (String) map.get("location");
        int counts = (int) map.get("counts");

        String query = "INSERT INTO all_send_message_list (category,contents,title,time,counts,custNm,age,privacy,location) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try (PreparedStatement pstmt = con.prepareStatement(query)) {
            pstmt.setString(1, category);
            pstmt.setString(2, contents);
            pstmt.setString(3, title);
            pstmt.setString(4, time);
            pstmt.setInt(5, counts);
            pstmt.setString(6, custNm);
            pstmt.setString(7, age);
            pstmt.setString(8, privacy);
            pstmt.setString(9, location);
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
        String selectQuery = "SELECT * FROM all_send_message_list";
        List<messageHistoryDTO> messageInfos = new ArrayList<>();
        try(PreparedStatement pstmt = con.prepareStatement(selectQuery)){
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                messageHistoryDTO member = new messageHistoryDTO();
                member.setCategory(rs.getString("category"));
                member.setContents(rs.getString("contents"));
                member.setTitle(rs.getString("title"));
                member.setTime(rs.getString("time"));
                member.setCounts(rs.getInt("counts"));
                member.setCustNm(rs.getString("custNm"));
                member.setAge(rs.getString("age"));
                member.setPrivacy(rs.getString("privacy"));
                member.setLocation(rs.getString("location"));
                messageInfos.add(member);

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
