package productPromotionPackage;

import common.DBConnPool;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Map;

public class productPromotionWriteDAO extends DBConnPool {
    public productPromotionWriteDAO() {
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
        String address = (String) map.get("address");
        String custGrade = (String) map.get("private");
        String branch = (String) map.get("branch");
        String subTerm = (String) map.get("period");
        String asset = (String) map.get("asset");
        String privacy = (String) map.get("privacy");
        String recLoginDate = (String) map.get("recLoginDate");
        String prodNm = (String)map.get("prodNm");
        String mContents = (String)map.get("mContents");
        System.out.println(mContents);
        String query = "INSERT INTO prod_promo_message () " +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (PreparedStatement pstmt = con.prepareStatement(query)) {
            pstmt.setString(1, custNm);
            pstmt.setString(2, gender);
            pstmt.setString(3, age);
            pstmt.setString(4, job);
            pstmt.setString(5, address);
            pstmt.setString(6, custGrade);
            pstmt.setString(7, branch);
            pstmt.setString(8, subTerm);
            pstmt.setString(9, asset);
            pstmt.setString(10, privacy);
            pstmt.setString(11, recLoginDate);
            pstmt.setString(12,prodNm);
            pstmt.setString(13,mContents);

            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        finally{
            close();
        }
    }
}
