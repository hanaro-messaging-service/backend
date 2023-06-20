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
        System.out.println(getResidentNoFromAge(20));
        String query = "SELECT * FROM cust_info WHERE 1=1";
        System.out.println(1);
        String man = (String) map.get("man");
        System.out.println("man"+man);
        System.out.println(2);
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

        System.out.println(3);
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

        System.out.println(4);
        String agePart = (String) map.get("agePart");
        String privacyYes = (String) map.get("privacyYes");
        System.out.println(5);

        System.out.println(6);
        String privacyNo = (String) map.get("privacyNo");
        if(privacyYes!=null&&privacyYes.equals("Y")&&privacyNo!=null&&privacyNo.equals("N")) {

        }
        else {
            if(privacyYes!=null&&privacyYes.equals("Y")) {
                query += " AND privacy = 'y'";
            }
            if (privacyNo!=null&&privacyNo.equals("N")) {
                query += " AND privacy = 'n'";
            }
        }

        System.out.println(7);
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
        System.out.println(8);
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
        System.out.println("name"+name);
        if (name != null && !name.isEmpty()) {
            query += " AND custNm LIKE '%"+map.get("name")+"%'";
        }
        System.out.println(9);
        System.out.println("man"+man);
        System.out.println("woman"+woman);
        System.out.println("age"+age);
        System.out.println("agePart"+agePart);
        System.out.println("privacyYes"+privacyYes);
        System.out.println("privacyNo"+privacyNo);
        System.out.println("job"+job);
        System.out.println("privateRate"+privateRate);


        return query;
    }
}
