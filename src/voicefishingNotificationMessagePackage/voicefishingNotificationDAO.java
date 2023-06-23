package voicefishingNotificationMessagePackage;

        import common.DBConnPool;

        import java.sql.PreparedStatement;
        import java.sql.ResultSet;
        import java.time.LocalDate;
        import java.util.ArrayList;
        import java.util.List;
        import java.util.Map;

        import sqlCommonFunction.*;

public class voicefishingNotificationDAO extends DBConnPool {
    public voicefishingNotificationDAO() {
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

    public List<voicefishingNotificationDTO> selectMessage(Map<String, Object> map){
        List<voicefishingNotificationDTO> custInfos = new ArrayList<>();
        String query = "SELECT " +
                "cust_info.custNm, " +
                "cust_info.custNo, " +
                "cust_info.residentNo, " +
                "com_acc_info.balance, " +
                "cust_info.address, " +
                "cust_info.privacy, " +
                "cust_info.phoneNo, " +
                "cust_info.email " +
                "FROM " +
                "cust_info " +
                "JOIN com_acc_info ON cust_info.custNo = com_acc_info.custNo";
        String custNm = (String) map.get("custNm");
        query = nameFilter.addNameFilterCondition(query,custNm);
        String age = (String) map.get("age");
        query = ageFilter.addAgeFilterCondition(query,age);
        System.out.println(("age들어가니2"));
        String privacy = (String) map.get("privacy");
        query = privacyFilter.addPrivacyFilterCondition(query,privacy);

        System.out.println(query);
        try {
            PreparedStatement pstmt = con.prepareStatement(query);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                voicefishingNotificationDTO member = new voicefishingNotificationDTO();
                member.setCustNo(rs.getString("custNo"));
                member.setCustNm(rs.getString("custNm"));
                String residentNo = rs.getString("residentNo");
                String custAge = getAgeFromResidentNo(residentNo);
                member.setAge(custAge);
                member.setAsset(rs.getInt("balance"));
                member.setAddress(rs.getString("address"));
                member.setPrivacy(rs.getString("privacy"));
                member.setPhoneNo(rs.getString("phoneNo"));
                member.setEmail(rs.getString("email"));
                custInfos.add(member);
            }

        } catch (Exception e) {
            System.out.println("고객 정보 조회 중 예외 발생");
            e.printStackTrace();
        }
        finally{
            close();
        }

        return custInfos;
    }

}

