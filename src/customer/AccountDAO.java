package customer;
import java.time.LocalDate;
import java.time.Period;
import common.DBConnPool;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
public class AccountDAO extends DBConnPool {
    public AccountDAO() { super ();}

    public String selectAccountInfo(Map<String, Object> map) {
        String query = "SELECT c.* FROM com_acc_info a JOIN cust_info c ON a.custNo = c.custNo WHERE 1=1";


        if (map.containsKey("asset")) {
            String selectedPeriodValue = (String) map.get("asset");
            if (selectedPeriodValue == null) {

            }
            else if (selectedPeriodValue.equals("100만원 이하")) {
                query += " AND c.custNo IN (SELECT custNo FROM com_acc_info WHERE balance <= 1000000)";
            } else if (selectedPeriodValue.equals("100만원에서 1000만원")) {
                query += " AND c.custNo IN (SELECT custNo FROM com_acc_info WHERE balance > 1000000 AND balance <= 10000000)";
            } else if (selectedPeriodValue.equals("1000만원에서 3000만원")) {
                query += " AND c.custNo IN (SELECT custNo FROM com_acc_info WHERE balance > 10000000 AND balance <= 30000000)";
            } else if (selectedPeriodValue.equals("3000만원 이상")) {
                query += " AND c.custNo IN (SELECT custNo FROM com_acc_info WHERE balance > 30000000)";
            }
        }

        if (map.containsKey("period")) {
            String selectedOpeningDate = (String) map.get("period");
            LocalDate currentDate = LocalDate.now();
            LocalDate startDate;
            LocalDate endDate;

            if (selectedOpeningDate == null) {

            }
            else {
                if (selectedOpeningDate.equals("1년 미만")) {
                    endDate = currentDate;
                    startDate = endDate.minusYears(1);
                } else if (selectedOpeningDate.equals("1년-3년")) {
                    endDate = currentDate.minusYears(1);
                    startDate = endDate.minusYears(2);
                } else if (selectedOpeningDate.equals("3년-5년")) {
                    endDate = currentDate.minusYears(3);
                    startDate = endDate.minusYears(2);
                } else if (selectedOpeningDate.equals("5년-10년")) {
                    endDate = currentDate.minusYears(5);
                    startDate = endDate.minusYears(5);
                } else if (selectedOpeningDate.equals("10년 이상")) {
                    startDate = currentDate.minusYears(10);
                    endDate = startDate.minusYears(100);
                    query += " AND a.openingDate >= '" + endDate + "' AND a.openingDate <= '" + startDate + "'";
                    return query;
                } else {

                    return query;
                }
                query += " AND a.openingDate >= '" + startDate + "' AND a.openingDate <= '" + endDate + "'";
            }



        }

        return query;
    }
}
