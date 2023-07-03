package overdueNotificationMessage;

import common.DBConnPool;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class overdueNotificationCustomizeDAO extends DBConnPool {
    public overdueNotificationCustomizeDAO() {
        super();
    }

    public List<overdueNotificationCustomizeDTO> selectMessage(){
        String query  = "SELECT * FROM overdue_noti_message";
        List<overdueNotificationCustomizeDTO> custInfos = new ArrayList<>();
        try {
            PreparedStatement pstmt = con.prepareStatement(query);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                overdueNotificationCustomizeDTO member = new overdueNotificationCustomizeDTO();
                member.setId(rs.getString("id"));
                member.setPrivacy(rs.getString("privacy"));
                member.setOverdue(rs.getString("overdue"));
                member.setAge(rs.getString("age"));
                member.setGender(rs.getString("gender"));
                member.setCustGrade(rs.getString("custGrade"));
                member.setCreditRating(rs.getString("creditRating"));
                member.setAsset(rs.getString("asset"));
                member.setSubTerm(rs.getString("subTerm"));
                member.setCustNm(rs.getString("custNm"));
                member.setMContents(rs.getString("mContents"));
                member.setMTitle(rs.getString("mTitle"));
//                member.setJob(rs.getString("job"));
//                member.setAddress(rs.getString("address"));
//                member.setRecLoginDate(rs.getString("recLoginDate"));
//                member.setSubTerm(rs.getString("subTerm"));
//                member.setBranch(rs.getString("branch"));
//                member.setProdNm(rs.getString("prodNm"));
                custInfos.add(member);
            }

        } catch (Exception e) {
        System.out.println("고객 정보 조회 중 예외 발생");
            e.printStackTrace();
        }
        finally{
        System.out.println("CustomizeDAO 끝");
            close();
        }

        return custInfos;
    }


}
