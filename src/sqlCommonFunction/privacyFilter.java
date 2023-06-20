package sqlCommonFunction;

public class privacyFilter {
    public static String addPrivacyFilterCondition(String query, String privacyYes) {
        if (privacyYes != null && privacyYes.equals("Y")) {
            query += " AND cust_info.privacy = 'Y'";
        }
        return query;
    }
}
