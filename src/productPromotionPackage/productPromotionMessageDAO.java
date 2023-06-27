package productPromotionPackage;

import common.DBConnPool;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import sqlCommonFunction.*;

public class productPromotionMessageDAO extends DBConnPool {
    public productPromotionMessageDAO() {
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
    public int selectMessage(Map<String, Object> map){
        String query = "SELECT " +
                "count(*) AS total_count " +
                "FROM " +
                "cust_info " +
                "JOIN com_acc_info ON cust_info.custNo = com_acc_info.custNo " +
                "JOIN app_info ON cust_info.custNo = app_info.custNo " +
                "WHERE " +
                "1=1";
        String custNm = (String) map.get("custNm");
        query = nameFilter.addNameFilterCondition(query,custNm);
        String man = (String) map.get("man");
        String woman = (String) map.get("woman");
        query = gender.addGenderCondition(query, man, woman);
        String age = (String) map.get("age");
        query = ageFilter.addAgeFilterCondition(query,age);
        String job = (String) map.get("job");
        query = jobFilter.addJobCondition(query,job);
        String address =(String) map.get("address");
        query = addressFilter.addAddressFilterCondition(query,address);
        String custGrade = (String) map.get("private");
        query = privateRate.addPrivateRateCondition(query,custGrade);
        String branch = (String) map.get("branch");
        query = branchFilter.addBranchFilterCondition(query,branch);
        String subTerm = (String) map.get("period");
        query = periodFilter.addPeriodFilterCondition(query,subTerm);
        String asset = (String) map.get("asset");
        query = assetFilter.addAssetFilterCondition(query,asset);
        String privacy = (String) map.get("privacy");
        query = privacyFilter.addPrivacyFilterCondition(query,privacy);
        String recLoginDate = (String) map.get("recLoginDate");
        query = recLogindateFilter.addDateRangeFilterCondition(query,recLoginDate);
        System.out.println(query);
        int totalCount = 0;
        try {
            PreparedStatement pstmt = con.prepareStatement(query);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                totalCount = rs.getInt("total_count");
            }
        } catch (Exception e) {
            System.out.println("고객 정보 조회 중 예외 발생");
            e.printStackTrace();
        }
        finally{

        }

        return totalCount;
    }
    public List<productPromotionMessageDTO> selectPaginatedMessage(Map<String, Object> map) {
        System.out.println("뭐임");
        List<productPromotionMessageDTO> paginatedData = new ArrayList<>();
        String query = "SELECT " +
                "cust_info.custNm, " +
                "cust_info.gender, " +
                "cust_info.privacy, " +
                "cust_info.job, " +
                "cust_info.custGrade, " +
                "cust_info.address, " +
                "cust_info.residentNo, " +
                "cust_info.email, " +
                "com_acc_info.balance, " +
                "com_acc_info.branchinfo, " +
                "com_acc_info.openingDate, " +
                "app_info.recLoginDate " +
                "FROM " +
                "cust_info " +
                "JOIN com_acc_info ON cust_info.custNo = com_acc_info.custNo " +
                "JOIN app_info ON cust_info.custNo = app_info.custNo " +
                "WHERE " +
                "1=1";
        String custNm = (String) map.get("custNm");
        System.out.println("custNm"+custNm);
        query = nameFilter.addNameFilterCondition(query, custNm);
        System.out.println("custNm"+custNm);
        String man = (String) map.get("man");
        String woman = (String) map.get("woman");
        query = gender.addGenderCondition(query, man, woman);
        String age = (String) map.get("age");
        query = ageFilter.addAgeFilterCondition(query, age);
        String job = (String) map.get("job");
        query = jobFilter.addJobCondition(query, job);
        String address = (String) map.get("address");
        System.out.println("address"+address);
        query = addressFilter.addAddressFilterCondition(query, address);
        String custGrade = (String) map.get("private");
        query = privateRate.addPrivateRateCondition(query, custGrade);
        String branch = (String) map.get("branch");
        query = branchFilter.addBranchFilterCondition(query, branch);
        String subTerm = (String) map.get("period");
        query = periodFilter.addPeriodFilterCondition(query, subTerm);
        String asset = (String) map.get("asset");
        System.out.println("address"+address);
        query = assetFilter.addAssetFilterCondition(query, asset);
        String privacy = (String) map.get("privacy");
        query = privacyFilter.addPrivacyFilterCondition(query, privacy);
        System.out.println("address"+address);
        String recLoginDate = (String) map.get("recLoginDate");
        query = recLogindateFilter.addDateRangeFilterCondition(query, recLoginDate);
        System.out.println(query);

        // 페이지네이션을 적용하여 데이터 조회
        query += " LIMIT ?, ?";
        int start = 0;
        int last = 0;
        try {
            start = Integer.parseInt(map.get("start").toString());
            last = Integer.parseInt(map.get("last").toString());
            System.out.println("STARTLLAST"+start+last);
        } catch (NumberFormatException e) {
            // 유효한 정수로 변환할 수 없는 경우 처리할 내용을 작성합니다.
            e.printStackTrace();
        }
        System.out.println("start"+start+"last"+last);
        try {
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setInt(1,start);
            pstmt.setInt(2,last);
            ResultSet rs = pstmt.executeQuery();
            System.out.println("뭐가문제니");
            while (rs.next()) {
                productPromotionMessageDTO member = new productPromotionMessageDTO();
                member.setCustNm(rs.getString("custNm"));
                member.setGender(rs.getString("gender"));
                member.setEmail(rs.getString("email"));
                String residentNo = rs.getString("residentNo");
                String custAge = getAgeFromResidentNo(residentNo);
                member.setAge(custAge);
                member.setJob(rs.getString("job"));
                member.setAddress(rs.getString("address"));
                member.setCustGrade(rs.getInt("custGrade"));
                member.setBranch(rs.getString("branchinfo"));
                member.setSubTerm(rs.getString("openingDate"));
                member.setAsset(rs.getString("balance"));
                member.setPrivacy(rs.getString("privacy"));
                member.setRecLoginDate(rs.getString("recLoginDate"));
                paginatedData.add(member);
                System.out.println("뭐가문제야3");
            }
        } catch (Exception e) {
            System.out.println("고객 정보 조회 중 예외 발생");
            e.printStackTrace();
        } finally {
            close();
        }

        return paginatedData;
    }

}
