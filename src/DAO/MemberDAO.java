package DAO;
import javax.servlet.ServletContext;
import DTO.MemberDTO;
import common.JDBConnect;
import java.sql.ResultSetMetaData;
public class MemberDAO extends JDBConnect{
    public MemberDAO(ServletContext application) {
        super(application);
    }

    public MemberDTO getMemberDTO() {
        MemberDTO dto = new MemberDTO();
        String query = "SELECT * FROM cust_info";

        try{
            psmt = con.prepareStatement(query);;
            rs = psmt.executeQuery();

            while (rs.next()) {
                ResultSetMetaData metaData = rs.getMetaData();
                int columnCount = metaData.getColumnCount();
                for (int i = 1; i <= columnCount; i++) {
                    Object value = rs.getObject(i);
                    System.out.println(value);
                }
                System.out.println("-------------------"); // 각 행 사이에 구분을 위해 출력합니다.
            }
        }
        catch(Exception e) {
            e.printStackTrace();
        }
        return dto;
    }

}
