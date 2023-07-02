package sqlCommonFunction;

public class recLogindateFilter {

        public static String addDateRangeFilterCondition(String query, String dateRange) {
            if (dateRange != null && !dateRange.isEmpty()) {
                if (dateRange.equals("1개월 이내")) {
                    query += " AND cust_info.recLoginDate >= DATE_SUB(CURDATE(), INTERVAL 1 MONTH)";
                } else if (dateRange.equals("1개월-3개월")) {
                    query += " AND cust_info.recLoginDate >= DATE_SUB(CURDATE(), INTERVAL 3 MONTH)" +
                            " AND cust_info.recLoginDate <= DATE_SUB(CURDATE(), INTERVAL 1 MONTH)";
                } else if (dateRange.equals("3개월 이상")) {
                    query += " AND cust_info.recLoginDate <= DATE_SUB(CURDATE(), INTERVAL 3 MONTH)";
                }
            }
            return query;
        }

}
