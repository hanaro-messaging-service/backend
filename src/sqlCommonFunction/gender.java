package sqlCommonFunction;

public class gender {
    public static String addGenderCondition(String query, String man, String woman) {
        if (man != null && man.equals("M") && woman != null && woman.equals("F")) {
            // Nothing to add to the query when both man and woman are selected
        } else {
            if (man != null && man.equals("M")) {
                query += " AND cust_info.gender = 'M'";
            }
            if (woman != null && woman.equals("F")) {
                query += " AND cust_info.gender = 'F'";
            }
        }
        return query;
    }
}
