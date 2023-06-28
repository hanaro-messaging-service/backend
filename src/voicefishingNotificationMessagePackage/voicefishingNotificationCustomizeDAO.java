package voicefishingNotificationMessagePackage;

import common.DBConnPool;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
public class voicefishingNotificationCustomizeDAO extends DBConnPool {
    public voicefishingNotificationCustomizeDAO () {
        super();
    }

    public List<voicefishingNotificationCustomizeDTO> selectMessage(){
        String query  = "SELECT * FROM voice_noti_message";
        List<voicefishingNotificationCustomizeDTO> custInfos = new ArrayList<>();
        try {
            PreparedStatement pstmt = con.prepareStatement(query);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                voicefishingNotificationCustomizeDTO member = new voicefishingNotificationCustomizeDTO();
                member.setPrivacy(rs.getString("privacy"));
                member.setAge(rs.getString("age"));
                member.setAsset(rs.getString("asset"));
                member.setCustNm(rs.getString("custNm"));
                member.setProdNm(rs.getString("prodNm"));
                member.setMContents(rs.getString("mContents"));
                member.setId(rs.getString("id"));
                custInfos.add(member);
            }

        } catch (Exception e) {
            System.out.println("고객 정보 조회 중 예외 발생");
            e.printStackTrace();
        }
        finally{
            close();
        }

        return custInfos;
    }


}
