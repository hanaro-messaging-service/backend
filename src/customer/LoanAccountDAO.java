package customer;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import common.DBConnPool;
import java.time.LocalDate;
import java.time.Period;

public class LoanAccountDAO extends DBConnPool {
    public LoanAccountDAO () {
        super();

    }

    public String selectLoanInfo(Map<String, Object> map) {
        String query = "SELECT c.* FROM loan_acc_info a " +
                "JOIN com_acc_info b ON a.accNo = b.accNo " +
                "JOIN cust_info c ON b.custNo = c.custNo " +
                "WHERE 1=1";

        String moneyExpYes = (String) map.get("moneyExpYes");

        String moneyExpNo = (String) map.get("moneyExpNo");
        if (moneyExpYes != null && moneyExpYes.equals("Y")&&moneyExpNo != null && moneyExpNo.equals("N")) {
            return query;
        }
        if (moneyExpYes != null && moneyExpYes.equals("Y")) {
            query += " AND a.overdue = 'y'";
        }

        if (moneyExpNo != null && moneyExpNo.equals("N")) {
            query += " AND a.overdue = 'n'";
        }

        return query;
    }

}
