package allNoticePackage;

import common.DBConnPool;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class allNoticeCustomizeDAO extends DBConnPool {
    public allNoticeCustomizeDAO() {super();}
    public List<allNoticeCustomizeDTO> selectMessage(){
        System.out.println("전체 공지 CustomizeDAO");
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
            System.out.println("고객 정보 조회 중 예외 발생");
            e.printStackTrace();
        }
        finally{
            System.out.println("전체 공지 CustomizeDAO 끝");
            close();
        }

        return custInfos;
    }
}
