package sqlCommonFunction;

public class privacyFilter {
    public static String addPrivacyFilterCondition(String query, String privacyYes) {
        if (privacyYes != null && privacyYes.equals("O")) {
            query += " AND cust_info.privacy = 'O'";
        }
        return query;
    }
}
