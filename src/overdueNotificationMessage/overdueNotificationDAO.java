package overdueNotificationMessage;

import common.DBConnPool;
import sqlCommonFunction.*;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class overdueNotificationDAO extends DBConnPool {
    public overdueNotificationDAO() {
        super();
    }
    private String getAgeFromResidentNo(String residentNo) {
        int birthYear = Integer.parseInt(residentNo.substring(0, 2));
        int birthMonth = Integer.parseInt(residentNo.substring(2, 4));
        int birthDay = Integer.parseInt(residentNo.substring(4, 6));

        // 생년월일로 LocalDate 객체 생성
        int currentYear = LocalDate.now().getYear();
        int currentMonth = LocalDate.now().getMonthValue();
        int currentDay = LocalDate.now().getDayOfMonth();

        int baseYear = (birthYear >= 0 && birthYear <= 21) ? 2000 : 1900;
        LocalDate birthDate = LocalDate.of(baseYear + birthYear, birthMonth, birthDay);
        LocalDate currentDate = LocalDate.of(currentYear, currentMonth, currentDay);

        // 현재 날짜와 생년월일로 나이 계산
        return String.valueOf(currentYear-(baseYear+birthYear) );
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
    public List<overdueNotificationDTO> selectMessage(Map<String, Object> map){
        List<overdueNotificationDTO> custInfos = new ArrayList<>();
        String query = "SELECT " +
                "cust_info.custNo, " +
                "cust_info.custNm, " +
                "cust_info.residentNo, " +
                "cust_info.gender, " +
                "loan_acc_info.overdue, " +
                "cust_info.creditRating, " +
                "cust_info.custGrade, " +
                "com_acc_info.balance, " +
                "cust_info.privacy, " +
                "cust_info.phoneNo, " +
                "cust_info.email " +
                "FROM " +
                "cust_info " +
                "JOIN com_acc_info ON cust_info.custNo = com_acc_info.custNo " +
                "JOIN loan_acc_info ON com_acc_info.accNo = loan_acc_info.accNo " +
                "WHERE " +
                "1=1";
        String custNo = (String) map.get("custNo");

        String custNm = (String) map.get("custNm");
        query = nameFilter.addNameFilterCondition(query,custNm);
        
        String man = (String) map.get("man");
        String woman = (String) map.get("woman");
        query = gender.addGenderCondition(query, man, woman);
        
        System.out.println(("age 삽입"));
        String age = (String) map.get("age");
        query = ageFilter.addAgeFilterCondition(query,age);
        System.out.println(("age 완료"));

//        String address =(String) map.get("address");
//        System.out.println("address"+address);
//        query = addressFilter.addAddressFilterCondition(query,address);

        String custGrade = (String) map.get("private");
        System.out.println(custGrade+"custGrade");
        query = privateRate.addPrivateRateCondition(query,custGrade);

        String subTerm = (String) map.get("period");
        query = periodFilter.addPeriodFilterCondition(query,subTerm);

        String asset = (String) map.get("asset");
        System.out.println(asset);
        query = assetFilter.addAssetFilterCondition(query,asset);

        String privacy = (String) map.get("privacy");
        query = privacyFilter.addPrivacyFilterCondition(query,privacy);

        System.out.println("신용등급 체크");
        String credit = (String) map.get("credit");
        query = creditFilter.addCreditRateCondition(query, credit);

        System.out.println("연체여부 체크");
        String overdueYes = (String) map.get("overdue"); // 연체여부 추가
        String overdueNo = (String) map.get("non_overdue");
        System.out.println(overdueYes + overdueNo);
        query = overdueFilter.addOverdueFilterCondition(query, overdueYes, overdueNo);

        System.out.println(query);
        try {
            PreparedStatement pstmt = con.prepareStatement(query);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                overdueNotificationDTO member = new overdueNotificationDTO();
                member.setCustNo(rs.getString("custNo")); // 고객코드 설정
                member.setCustNm(rs.getString("custNm")); // 이름
                String residentNo = rs.getString("residentNo");
                String custAge = getAgeFromResidentNo(residentNo);
                member.setAge(custAge); // 나이
                member.setGender(rs.getString("gender")); // 성별
                member.setCustGrade(rs.getInt("custGrade")); // 고객등급
                member.setAsset(rs.getString("balance"));
                member.setPrivacy(rs.getString("privacy"));
                member.setCredit(rs.getInt("creditRating"));  // 신용등급
                member.setOverdue(rs.getString("overdue")); // 연체여부
                member.setPhoneNum(rs.getString("phoneNo"));
                member.setEmail(rs.getString("email"));
                custInfos.add(member);
            }

        } catch (Exception e) {
            System.out.println("고객 정보 조회 중 예외 발생");
            e.printStackTrace();
        }
        finally{ close();}

        return custInfos;
    }

}
