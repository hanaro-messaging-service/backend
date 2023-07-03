package messageCust;
import common.DBConnPool;

import java.io.UnsupportedEncodingException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.net.URLDecoder;

public class MessageCustomizeDAO extends DBConnPool {
    public MessageCustomizeDAO() {
        super();
    }

    public List<MessageCustoimizeDTO> selectMessage(Map<String, Object> map) throws UnsupportedEncodingException {
        List<MessageCustoimizeDTO> messageList = new ArrayList<>();
        String age = (String) map.get("age");
        String job = (String) map.get("job");
        String custNm = (String) map.get("custNm");
        String message = (String) map.get("message");
        String privacyYes = (String)map.get("privacyYes");
        String privacyNo = (String)map.get("privacyNo");
        String male = (String)map.get("male");
        String female = (String)map.get("female");
        String privateRate = (String)map.get("privateRate");
        String asset = (String)map.get("asset");
        String app = (String)map.get("app");
        String period = (String)map.get("period");
        String moneyExpYes =(String)map.get("moneyExpYes");
        String moneyExpNo = (String)map.get("moneyExpNo");


        String query = "INSERT INTO message_list (custNm, message, privacyYes, privacyNo, male, female, age, job, privateRate, asset, app, period, moneyExpYes, moneyExpNo) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try {
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, (String) map.get("custNm"));
            pstmt.setString(2, (String) map.get("message"));
            pstmt.setString(3, (String) map.get("privacyYes"));
            pstmt.setString(4, (String) map.get("privacyNo"));
            pstmt.setString(5, (String) map.get("male"));
            pstmt.setString(6, (String) map.get("female"));
            pstmt.setString(7, (String) map.get("age"));
            pstmt.setString(8, (String) map.get("job"));
            pstmt.setString(9, (String) map.get("privateRate"));
            pstmt.setString(10, (String) map.get("asset"));
            pstmt.setString(11, (String) map.get("app"));
            pstmt.setString(12, (String) map.get("period"));
            pstmt.setString(13, (String) map.get("moneyExpYes"));
            pstmt.setString(14, (String) map.get("moneyExpNo"));

            pstmt.executeUpdate();

            pstmt.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }


        return messageList;
    }
}
