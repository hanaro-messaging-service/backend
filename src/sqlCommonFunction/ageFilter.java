package sqlCommonFunction;

import java.time.LocalDate;

public class ageFilter {
    public static String addAgeFilterCondition(String query, String age) {
        if (age != null && !age.isEmpty()) {
            int lowerBound;
            int upperBound;
            switch (age) {
                case "20대":
                    lowerBound = Integer.parseInt(getResidentNoFromAge(29).substring(0, 2));
                    upperBound = Integer.parseInt(getResidentNoFromAge(20).substring(0, 2));
                    break;
                case "30대":
                    lowerBound = Integer.parseInt(getResidentNoFromAge(39).substring(0, 2));
                    upperBound = Integer.parseInt(getResidentNoFromAge(30).substring(0, 2));
                    break;
                case "40대":
                    lowerBound = Integer.parseInt(getResidentNoFromAge(49).substring(0, 2));
                    upperBound = Integer.parseInt(getResidentNoFromAge(40).substring(0, 2));
                    break;
                case "50대":
                    lowerBound = Integer.parseInt(getResidentNoFromAge(59).substring(0, 2));
                    upperBound = Integer.parseInt(getResidentNoFromAge(50).substring(0, 2));
                    break;
                case "60대":
                    lowerBound = Integer.parseInt(getResidentNoFromAge(69).substring(0, 2));
                    upperBound = Integer.parseInt(getResidentNoFromAge(60).substring(0, 2));
                    break;
                case "70대 이상":
                    lowerBound = Integer.parseInt(getResidentNoFromAge(Integer.MAX_VALUE).substring(0, 2));
                    upperBound = 70;
                    break;
                default:
                    lowerBound = 0;
                    upperBound = 0;
                    break;
            }

            if (upperBound / 10 < 1) {
                query += " AND (SUBSTRING(cust_info.residentNo, 1, 2) >= '95' AND SUBSTRING(cust_info.residentNo, 1, 2) <= '99' OR (SUBSTRING(cust_info.residentNo, 1, 2) >= '00' AND SUBSTRING(cust_info.residentNo, 1, 2) <= '04'))";
            } else {
                query += " AND SUBSTRING(cust_info.residentNo, 1, 2) >= '" + String.format("%02d", lowerBound) + "' AND SUBSTRING(cust_info.residentNo, 1, 2) <= '" + String.format("%02d", upperBound) + "'";
            }
        }
        return query;
    }

    public static String getResidentNoFromAge(int age) {
        int currentYear = LocalDate.now().getYear();
        int currentMonth = LocalDate.now().getMonthValue();
        int currentDay = LocalDate.now().getDayOfMonth();

        int baseYear = (currentYear >= 2000) ? 2000 : 1900;
        int birthYear = currentYear - age;
        int birthMonth = currentMonth;
        int birthDay = currentDay;

        // 생년월일로 주민등록번호 앞자리 생성
        String residentNo = String.format("%02d%02d%02d", birthYear % 100, birthMonth, birthDay);

        return residentNo;
    }
}
