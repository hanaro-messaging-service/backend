package sqlCommonFunction;

public class privateRate {
    public static String addPrivateRateCondition(String query, String privateRate) {
        if (privateRate != null && !privateRate.isEmpty()) {
            switch (privateRate) {
                case "1":
                    query += " AND cust_info.custGrade = 1";
                    break;
                case "2":
                    query += " AND cust_info.custGrade = 2";
                    break;
                case "3":
                    query += " AND cust_info.custGrade = 3";
                    break;
                case "4":
                    query += " AND cust_info.custGrade = 4";
                    break;
                case "5":
                    query += " AND cust_info.custGrade = 5";
                    break;
                default:
                    break;
            }
        }
        return query;
    }
}
