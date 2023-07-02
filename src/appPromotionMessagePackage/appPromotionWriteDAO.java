package appPromotionMessagePackage;

import common.DBConnPool;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Map;

public class appPromotionWriteDAO extends DBConnPool {
    public appPromotionWriteDAO() {
        super();
    }

    public void selectMessage(Map<String, Object> map) {
        String custNm = (String) map.get("custNm");
        String man = (String) map.get("man");
        String woman = (String) map.get("woman");
        if(man==null) man = "N";
        if(woman==null) woman="N";
        String gender = man+woman;
        String age = (String) map.get("age");
        String job = (String) map.get("job");
        String custGrade = (String) map.get("private");
        String subTerm = (String) map.get("period");
        String asset = (String) map.get("asset");
        System.out.println(asset);
        String privacy = (String) map.get("privacy");
        String recLoginDate = (String) map.get("recLoginDate");
        String prodNm = (String)map.get("prodNm");
        String mContents = (String)map.get("mContents");
        String query = "INSERT INTO app_promo_message (custNm, gender, age, job, custGrade,  subTerm, asset, privacy, recLoginDate,prodNm,mContents) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (PreparedStatement pstmt = con.prepareStatement(query)) {
            pstmt.setString(1, custNm);
            pstmt.setString(2, gender);
            pstmt.setString(3, age);
            pstmt.setString(4, job);
            pstmt.setString(5, custGrade);
            pstmt.setString(6, subTerm);
            pstmt.setString(7, asset);
            pstmt.setString(8, privacy);
            pstmt.setString(9, recLoginDate);
            pstmt.setString(10,prodNm);
            pstmt.setString(11,mContents);

            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        finally{
            close();
        }
    }
}
