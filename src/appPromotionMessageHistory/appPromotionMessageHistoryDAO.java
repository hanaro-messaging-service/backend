package appPromotionMessageHistory;

import common.DBConnPool;
import appPromotionMessageHistory.appPromotionMessageHistoryDAO;
import appPromotionMessageHistory.appPromotionMessageHistoryDTO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Map;
import java.util.ArrayList;
import java.util.List;
public class appPromotionMessageHistoryDAO extends DBConnPool{
    public appPromotionMessageHistoryDAO () {
        super();
    }

    public void  selectMessage(Map<String, Object> map) {

        String category = (String) map.get("category");
        String contents = (String) map.get("contents");
        String title = (String) map.get("title");
        String time = (String) map.get("time");
        String custNm = (String) map.get("custNm");
        String man = (String) map.get("man");
        String woman = (String) map.get("woman");
        System.out.println(man+123);
        System.out.println(woman+123);
        if(man==null) man = "N";
        if(woman==null) woman="N";
        String gender = man+woman;
        String age = (String) map.get("age");
        String job = (String) map.get("job");
        String custGrade = (String) map.get("private");
        String subTerm = (String) map.get("period");
        String asset = (String) map.get("asset");
        String privacy = (String) map.get("privacy");
        String recLoginDate = (String) map.get("recLoginDate");
        int counts = (int) map.get("counts");

        String query = "INSERT INTO app_send_message_list (category,contents,title,time,counts,custNm, gender, age, job, custGrade, subTerm, asset, privacy, recLoginDate) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (PreparedStatement pstmt = con.prepareStatement(query)) {
            pstmt.setString(1, category);
            pstmt.setString(2, contents);
            pstmt.setString(3, title);
            pstmt.setString(4, time);
            pstmt.setInt(5, counts);
            pstmt.setString(6, custNm);
            pstmt.setString(7, gender);
            pstmt.setString(8, age);
            pstmt.setString(9, job);
            pstmt.setString(10, custGrade);
            pstmt.setString(11, subTerm);
            pstmt.setString(12, asset);
            pstmt.setString(13, privacy);
            pstmt.setString(14, recLoginDate);
            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        finally {
            close();
        }
    }
    public List<appPromotionMessageHistory.appPromotionMessageHistoryDTO> readMessage () {
        String selectQuery = "SELECT * FROM app_send_message_list";
        List<appPromotionMessageHistory.appPromotionMessageHistoryDTO> messageInfos = new ArrayList<>();
        try(PreparedStatement pstmt = con.prepareStatement(selectQuery)){
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                appPromotionMessageHistory.appPromotionMessageHistoryDTO member = new appPromotionMessageHistoryDTO();
                member.setCategory(rs.getString("category"));
                member.setContents(rs.getString("contents"));
                member.setTitle(rs.getString("title"));
                member.setCounts(rs.getInt("counts"));
                member.setTime(rs.getString("time"));
                member.setPrivacy(rs.getString("privacy"));
                member.setAge(rs.getString("age"));
                member.setGender(rs.getString("gender"));
                member.setJob(rs.getString("job"));
                member.setCustGrade(rs.getString("custGrade"));
                member.setAsset(rs.getString("asset"));
                member.setRecLoginDate(rs.getString("recLoginDate"));
                member.setSubTerm(rs.getString("subTerm"));
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

