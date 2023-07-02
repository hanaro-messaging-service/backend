package allNoticePackage;

import common.DBConnPool;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class allNoticeCustomizeDAO extends DBConnPool {
    public allNoticeCustomizeDAO() {super();}
    public List<allNoticeCustomizeDTO> selectMessage(){

        String query  = "SELECT * FROM all_noti_message"; // 쿼리 가져옴
        List<allNoticeCustomizeDTO> custInfos = new ArrayList<>();
        try {
            PreparedStatement pstmt = con.prepareStatement(query);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                allNoticeCustomizeDTO member = new allNoticeCustomizeDTO();
                member.setId(rs.getString("id"));
                member.setPrivacy(rs.getString("privacy"));
                member.setAge(rs.getString("age"));
                member.setMContents(rs.getString("mContents"));
                member.setMTitle(rs.getString("mTitle"));
                member.setLocation(rs.getString("location"));

                custInfos.add(member);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        finally{
            close();
        }

        return custInfos;
    }
}
