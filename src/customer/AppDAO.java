package customer;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import common.DBConnPool;
import java.time.LocalDate;
import java.time.Period;

public class AppDAO extends DBConnPool {
    public AppDAO() {
        super();
    }

    public int selectCount(Map<String, Object> map) {
        int totalCount = 0;
        String query = "SELECT COUNT(*) FROM app_info WHERE 1=1";

        if (map.containsKey("dateRange")) {
            String dateRange = (String) map.get("dateRange");
            if (dateRange.equals("1개월 이내")) {
                query += " AND recLoginDate >= DATE_SUB(CURDATE(), INTERVAL 1 MONTH)";
            } else if (dateRange.equals("1개월-3개월")) {
                query += " AND recLoginDate >= DATE_SUB(CURDATE(), INTERVAL 3 MONTH)" +
                        " AND recLoginDate <= DATE_SUB(CURDATE(), INTERVAL 1 MONTH)";
            } else if (dateRange.equals("3개월 이상")) {
                query += " AND recLoginDate <= DATE_SUB(CURDATE(), INTERVAL 3 MONTH)";
            }
        }

        try {
            stmt = con.createStatement();
            rs = stmt.executeQuery(query);
            rs.next();
            totalCount = rs.getInt(1);
        } catch (Exception e) {
            System.out.println("게시물 카운트 중 예외 발생");
            e.printStackTrace();
        }

        return totalCount;
    }

    public String selectAppInfo(Map<String, Object> map) {
        String query = "SELECT c.* FROM app_info a JOIN cust_info c ON a.custNo = c.custNo WHERE 1=1";


        if (map.containsKey("dateRange")) {
            String dateRange = (String) map.get("dateRange");
            if (dateRange.equals("1개월 이내")) {
                query += " AND a.recLoginDate >= DATE_SUB(CURDATE(), INTERVAL 1 MONTH)";
            } else if (dateRange.equals("1개월-3개월")) {
                query += " AND a.recLoginDate >= DATE_SUB(CURDATE(), INTERVAL 3 MONTH)" +
                        " AND a.recLoginDate <= DATE_SUB(CURDATE(), INTERVAL 1 MONTH)";
            } else if (dateRange.equals("3개월 이상")) {
                query += " AND a.recLoginDate <= DATE_SUB(CURDATE(), INTERVAL 3 MONTH)";
            }
        }
        return query;
    }


}
