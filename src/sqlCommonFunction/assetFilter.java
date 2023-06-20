package sqlCommonFunction;

public class assetFilter {
    public static String addAssetFilterCondition(String query, String selectedPeriodValue) {
        if (selectedPeriodValue != null) {
            if (selectedPeriodValue.equals("100만원 이하")) {
                query += " AND com_acc_info.balance <= 1000000";
            } else if (selectedPeriodValue.equals("100만원에서 1000만원")) {
                query += " AND com_acc_info.balance > 1000000 AND com_acc_info.balance <= 10000000";
            } else if (selectedPeriodValue.equals("1000만원에서 3000만원")) {
                query += " AND com_acc_info.balance > 10000000 AND com_acc_info.balance <= 30000000";
            } else if (selectedPeriodValue.equals("3000만원 이상")) {
                query += " AND com_acc_info.balance > 30000000";
            }
        }
        return query;
    }
}
