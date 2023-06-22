package sqlCommonFunction;

public class overdueFilter {
    public static String addOverdueFilterCondition(String query, String yes, String no) {
        if (yes != null && yes.equals("O") && no != null && no.equals("X")) {
            // Nothing to add to the query when both man and woman are selected
        } else {
            if (yes != null && yes.equals("O")) {
                query += " AND loan_acc_info.overdue = 'O'";
            }
            if (no != null && no.equals("X")) {
                query += " AND loan_acc_info.overdue = 'X'";
            }
        }
        return query;
    }
}
