package sqlCommonFunction;

public class nameFilter {
    public static String addNameFilterCondition(String query, String name) {
        if (name != null && !name.isEmpty()) {
            query += " AND cust_info.custNm LIKE '%" + name + "%'";
        }
        return query;
    }
}
