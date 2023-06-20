package sqlCommonFunction;

import java.time.LocalDate;

public class periodFilter {
    public static String addPeriodFilterCondition(String query, String selectedOpeningDate) {
        if (selectedOpeningDate != null) {
            LocalDate currentDate = LocalDate.now();
            LocalDate startDate;
            LocalDate endDate;

            if (selectedOpeningDate.equals("1년 미만")) {
                endDate = currentDate;
                startDate = endDate.minusYears(1);
            } else if (selectedOpeningDate.equals("1년-3년")) {
                endDate = currentDate.minusYears(1);
                startDate = endDate.minusYears(2);
            } else if (selectedOpeningDate.equals("3년-5년")) {
                endDate = currentDate.minusYears(3);
                startDate = endDate.minusYears(2);
            } else if (selectedOpeningDate.equals("5년-10년")) {
                endDate = currentDate.minusYears(5);
                startDate = endDate.minusYears(5);
            } else if (selectedOpeningDate.equals("10년 이상")) {
                startDate = currentDate.minusYears(10);
                endDate = startDate.minusYears(100);
                query += " AND com_acc_info.openingDate >= '" + endDate + "' AND com_acc_info.openingDate <= '" + startDate + "'";
                return query;
            } else {
                return query;
            }

            query += " AND com_acc_info.openingDate >= '" + startDate + "' AND com_acc_info.openingDate <= '" + endDate + "'";
        }
        return query;
    }
}
