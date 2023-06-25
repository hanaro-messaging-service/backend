package messageHistory;

import common.DBConnPool;
import productPromotionPackage.productPromotionCustomizeDTO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Map;
import java.util.ArrayList;
import java.util.List;
public class messageHistoryDAO extends DBConnPool {
    public messageHistoryDAO () {
        super();
    }

    public void  selectMessage(Map<String, Object> map) {

        String category = (String) map.get("category");
        String contents = (String) map.get("contents");
        String title = (String) map.get("title");
        String time = (String) map.get("time");
        int counts = (int) map.get("counts");
        System.out.println(counts);
        String query = "INSERT INTO message_detail (category,contents,title,time,counts) " +
                "VALUES (?, ?, ?, ?, ?)";

        try (PreparedStatement pstmt = con.prepareStatement(query)) {
            pstmt.setString(1, category);
            pstmt.setString(2, contents);
            pstmt.setString(3, title);
            pstmt.setString(4, time);
            pstmt.setInt(5, counts);
            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
         finally {
            close();
        }
    }
   public List<messageHistoryDTO> readMessage () {
       String selectQuery = "SELECT * FROM message_detail";
       List<messageHistoryDTO> messageInfos = new ArrayList<>();
       try(PreparedStatement pstmt = con.prepareStatement(selectQuery)){
           ResultSet rs = pstmt.executeQuery();
           while (rs.next()) {
               messageHistoryDTO member = new messageHistoryDTO();
               member.setCategory(rs.getString("category"));
               member.setContents(rs.getString("contents"));
               member.setTitle(rs.getString("title"));
               member.setCounts(rs.getInt("counts"));
               member.setTime(rs.getString("time"));
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
