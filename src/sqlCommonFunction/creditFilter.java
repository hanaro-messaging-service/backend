package sqlCommonFunction;

public class creditFilter {
    public static String addCreditRateCondition(String query, String credit) {
        if (credit != null && !credit.isEmpty()) {
            // 신용등급 리턴
            switch (credit) {
                case "1":
                    query += " AND cust_info.creditRating = 1";
                    break;
                case "2":
                    query += " AND cust_info.creditRating = 2";
                    break;
                case "3":
                    query += " AND cust_info.creditRating = 3";
                    break;
                case "4":
                    query += " AND cust_info.creditRating = 4";
                    break;
                case "5":
                    query += " AND cust_info.creditRating = 5";
                    break;
                case "6":
                    query += " AND cust_info.creditRating = 6";
                    break;
                case "7":
                    query += " AND cust_info.creditRating = 7";
                    break;
                case "8":
                    query += " AND cust_info.creditRating = 8";
                    break;
                case "9":
                    query += " AND cust_info.creditRating = 9";
                    break;
                case "10":
                    query += " AND cust_info.creditRating = 10";
                    break;
                default:
                    break;
            }
        }
        return query;
    }
}
