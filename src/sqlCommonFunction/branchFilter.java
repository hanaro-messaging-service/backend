package sqlCommonFunction;

public class branchFilter {
    public static String addBranchFilterCondition(String query, String branch) {
        if (branch != null && !branch.isEmpty()) {
            query += " AND com_acc_info.branchinfo LIKE '%" + branch + "%'";
        }
        return query;
    }
}
