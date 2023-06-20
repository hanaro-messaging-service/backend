package sqlCommonFunction;

public class jobFilter {
    public static String addJobCondition(String query, String job) {
        if (job != null && !job.isEmpty()) {
            switch (job) {
                case "학생":
                    query += " AND cust_info.job = '학생'";
                    break;
                case "공무원":
                    query += " AND cust_info.job = '공무원'";
                    break;
                case "전문직":
                    query += " AND cust_info.job = '전문직'";
                    break;
                case "주부":
                    query += " AND cust_info.job = '주부'";
                    break;
                case "무직":
                    query += " AND cust_info.job = '무직'";
                    break;
                default:
                    break;
            }
        }
        return query;
    }
}
