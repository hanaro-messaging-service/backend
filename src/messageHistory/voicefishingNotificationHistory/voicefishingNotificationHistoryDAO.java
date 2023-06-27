package messageHistory.voicefishingNotificationHistory;

import common.DBConnPool;
import voicefishingNotificationMessagePackage.voicefishingNotificationCustomizeDTO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Map;
import java.util.ArrayList;
import java.util.List;
public class voicefishingNotificationHistoryDAO extends DBConnPool {
    public voicefishingNotificationHistoryDAO () {
        super();
    }

    public void  selectMessage(Map<String, Object> map) {

        String category = (String) map.get("category");
        String contents = (String) map.get("contents");
        String title = (String) map.get("title");
        String time = (String) map.get("time");
        String custNm = (String) map.get("custNm");
        String age = (String) map.get("age");
        String address = (String) map.get("address");
        String asset = (String) map.get("asset");
        String privacy = (String) map.get("privacy");
        int counts = (int) map.get("counts");

        String query = "INSERT INTO voice_send_message_list (category,contents,title,time,counts,custNm, age, address, asset, privacy) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (PreparedStatement pstmt = con.prepareStatement(query)) {
            pstmt.setString(1, category);
            pstmt.setString(2, contents);
            pstmt.setString(3, title);
            pstmt.setString(4, time);
            pstmt.setInt(5, counts);
            pstmt.setString(6, custNm);
            pstmt.setString(7, age);
            pstmt.setString(8, address);
            pstmt.setString(9, asset);
            pstmt.setString(10, privacy);
            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        finally {
            close();
        }
    }
    public List<voicefishingNotificationHistoryDTO> readMessage () {
        String selectQuery = "SELECT * FROM voice_send_message_list";
        List<voicefishingNotificationHistoryDTO> messageInfos = new ArrayList<>();
        try(PreparedStatement pstmt = con.prepareStatement(selectQuery)){
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                voicefishingNotificationHistoryDTO member = new voicefishingNotificationHistoryDTO();
                member.setCategory(rs.getString("category"));
                member.setContents(rs.getString("contents"));
                member.setTitle(rs.getString("title"));
                member.setCounts(rs.getInt("counts"));
                member.setTime(rs.getString("time"));
                member.setPrivacy(rs.getString("privacy"));
                member.setAge(rs.getString("age"));
                member.setAsset(rs.getString("asset"));
                member.setAddress(rs.getString("address"));
                member.setCustNm(rs.getString("custNm"));
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
