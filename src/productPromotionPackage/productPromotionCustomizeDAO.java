package productPromotionPackage;

import common.DBConnPool;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
public class productPromotionCustomizeDAO extends DBConnPool {
    public productPromotionCustomizeDAO () {
        super();
    }

    public List<productPromotionCustomizeDTO> selectMessage(){
        String query  = "SELECT * FROM prod_promo_message";
        List<productPromotionCustomizeDTO> custInfos = new ArrayList<>();
        try {
            PreparedStatement pstmt = con.prepareStatement(query);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                productPromotionCustomizeDTO member = new productPromotionCustomizeDTO();
                member.setPrivacy(rs.getString("privacy"));
                member.setAge(rs.getString("age"));
                member.setGender(rs.getString("gender"));
                member.setJob(rs.getString("job"));
                member.setCustGrade(rs.getString("custGrade"));
                member.setAsset(rs.getString("asset"));
                member.setRecLoginDate(rs.getString("recLoginDate"));
                member.setSubTerm(rs.getString("subTerm"));
                member.setAddress(rs.getString("address"));
                member.setBranch(rs.getString("branch"));
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
