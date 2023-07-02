package appPromotionMessagePackage;

import common.DBConnPool;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class appPromotionCustomizeDAO extends DBConnPool{
    public appPromotionCustomizeDAO () { super(); }

    public List<appPromotionCustomizeDTO> selectMessage(){
        String query  = "SELECT * FROM app_promo_message";
        List<appPromotionCustomizeDTO> custInfos = new ArrayList<>();
        try {
            PreparedStatement pstmt = con.prepareStatement(query);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                appPromotionCustomizeDTO member = new appPromotionCustomizeDTO();
                member.setPrivacy(rs.getString("privacy"));
                member.setAge(rs.getString("age"));
                member.setGender(rs.getString("gender"));
                member.setJob(rs.getString("job"));
                member.setCustGrade(rs.getString("custGrade"));
                member.setAsset(rs.getString("asset"));
                member.setRecLoginDate(rs.getString("recLoginDate"));
                member.setSubTerm(rs.getString("subTerm"));
                member.setCustNm(rs.getString("custNm"));
                member.setProdNm(rs.getString("prodNm"));
                member.setMContents(rs.getString("mContents"));
                member.setId(rs.getString("id"));
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
