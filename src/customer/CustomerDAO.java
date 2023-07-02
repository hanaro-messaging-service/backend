package customer;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import common.DBConnPool;
import java.time.LocalDate;
import java.time.Period;


public class CustomerDAO extends DBConnPool {
    public CustomerDAO () {
        super();
    }
    public String getResidentNoFromAge(int age) {
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

    public String selectCustomerInfo(Map<String, Object> map) {

        String query = "SELECT * FROM cust_info WHERE 1=1";

        String man = (String) map.get("man");

        String woman = (String) map.get("woman");
        if (man!=null&&man.equals("M")&&woman!=null&&woman.equals("F")) {

        }
        else {
            if (man!=null&&man.equals("M")) {
                query+= " AND gender = 'M'";
            }

            if (woman!=null&&woman.equals("F")) {
                query+= " AND gender = 'F'";
            }
        }


        String age = (String) map.get("age");
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

            if(upperBound/10<1) {
                query += " AND (SUBSTRING(residentNo, 1, 2) >= '95' AND SUBSTRING(residentNo, 1, 2) <= '99') OR (SUBSTRING(residentNo, 1, 2) >= '00' AND SUBSTRING(residentNo, 1, 2) <= '04')" ;

            }
            else {
                query += " AND SUBSTRING(residentNo, 1, 2) >= '" + String.format("%02d", lowerBound) + "' AND SUBSTRING(residentNo, 1, 2) <= '" + String.format("%02d", upperBound) + "'";
            }

        }


        String agePart = (String) map.get("agePart");
        String privacyYes = (String) map.get("privacyYes");


        String privacyNo = (String) map.get("privacyNo");
        if(privacyYes!=null&&privacyYes.equals("O")&&privacyNo!=null&&privacyNo.equals("X")) {

        }
        else {
            if(privacyYes!=null&&privacyYes.equals("O")) {
                query += " AND privacy = 'O'";
            }
            if (privacyNo!=null&&privacyNo.equals("X")) {
                query += " AND privacy = 'X'";
            }
        }


        String job = (String) map.get("job");
        if (job != null && !job.isEmpty()) {
            switch (job) {
                case "학생":
                    query += " AND job = '학생'";
                    break;
                case "공무원":
                    query += " AND job = '공무원'";
                    break;
                case "전문직":
                    query += " AND job = '전문직'";
                    break;
                case "주부":
                    query += " AND job = '주부'";
                    break;
                case "무직":
                    query += " AND job = '무직'";
                    break;
                default:
                    break;
            }
        }

        String privateRate = (String) map.get("private");
        if (privateRate != null && !privateRate.isEmpty()) {
            switch (privateRate) {
                case "1":
                    query += " AND custGrade = 1";
                    break;
                case "2":
                    query += " AND custGrade = 2";
                    break;
                case "3":
                    query += " AND custGrade = 3";
                    break;
                case "4":
                    query += " AND custGrade = 4";
                    break;
                case "5":
                    query += " AND custGrade = 5";
                    break;
                default:
                    break;
            }
        }
        String name = (String) map.get("name");

        if (name != null && !name.isEmpty()) {
            query += " AND custNm LIKE '%"+map.get("name")+"%'";
        }




        return query;
    }
}
