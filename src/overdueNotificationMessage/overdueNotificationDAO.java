package overdueNotificationMessage;

import allNoticePackage.allNoticePackageDTO;
import common.DBConnPool;
import common.DBConnPool2;

import sqlCommonFunction.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.concurrent.CompletableFuture;

public class overdueNotificationDAO extends DBConnPool {
    private DBConnPool dbConnPool;
    private DBConnPool2 dbConnPool2;
    public overdueNotificationDAO() {

        dbConnPool = new DBConnPool();
        dbConnPool2 = new DBConnPool2();
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
        CompletableFuture<Integer> future1 = CompletableFuture.supplyAsync(() -> {;
            String query = "SELECT " +
                    "count(*) AS total_count " +
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
            String age = (String) map.get("age");
            query = ageFilter.addAgeFilterCondition(query,age);
            String custGrade = (String) map.get("custGrade");
            query = privateRate.addPrivateRateCondition(query,custGrade);
            String subTerm = (String) map.get("period");
            query = periodFilter.addPeriodFilterCondition(query,subTerm);
            String asset = (String) map.get("asset");
            query = assetFilter.addAssetFilterCondition(query,asset);
            String privacy = (String) map.get("privacyYes");
            query = privacyFilter.addPrivacyFilterCondition(query,privacy);
            String credit = (String) map.get("creditRating");
            query = creditFilter.addCreditRateCondition(query, credit);
            String overdueYes = (String) map.get("overdueYes"); // 연체여부 추가
            String overdueNo = (String) map.get("overdueNo");
            query = overdueFilter.addOverdueFilterCondition(query, overdueYes, overdueNo);
            int totalCount = 0;
            try {
                PreparedStatement pstmt = dbConnPool.con.prepareStatement(query);
                ResultSet rs = pstmt.executeQuery();
                while (rs.next()) {
                    totalCount = rs.getInt("total_count");
                }
            } catch (Exception e) {

                e.printStackTrace();
            }
            finally{
                dbConnPool.close();
            }

            return totalCount;
        });

        CompletableFuture<Integer> future2 = CompletableFuture.supplyAsync(() -> {
            String query = "SELECT " +
                    "count(*) AS total_count " +
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
            String age = (String) map.get("age");
            query = ageFilter.addAgeFilterCondition(query,age);
            String custGrade = (String) map.get("custGrade");
            query = privateRate.addPrivateRateCondition(query,custGrade);
            String subTerm = (String) map.get("period");
            query = periodFilter.addPeriodFilterCondition(query,subTerm);
            String asset = (String) map.get("asset");
            query = assetFilter.addAssetFilterCondition(query,asset);
            String privacy = (String) map.get("privacyYes");
            query = privacyFilter.addPrivacyFilterCondition(query,privacy);
            String credit = (String) map.get("creditRating");
            query = creditFilter.addCreditRateCondition(query, credit);
            String overdueYes = (String) map.get("overdueYes"); // 연체여부 추가
            String overdueNo = (String) map.get("overdueNo");
            query = overdueFilter.addOverdueFilterCondition(query, overdueYes, overdueNo);
            int totalCount = 0;
            try {
                PreparedStatement pstmt = dbConnPool2.con2.prepareStatement(query);
                ResultSet rs = pstmt.executeQuery();
                while (rs.next()) {
                    totalCount = rs.getInt("total_count");
                }
            } catch (Exception e) {

                e.printStackTrace();
            }
            finally{
                dbConnPool2.close();
            }

            return totalCount;
        });

        int totalCount = future1.join() + future2.join();

        return totalCount;

    }

    public List<overdueNotificationDTO> selectPaginatedMessage(Map<String, Object> map){
        CompletableFuture<List<overdueNotificationDTO>> future1 = CompletableFuture.supplyAsync(() -> {
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
            String custNm = (String) map.get("custNm");
            query = nameFilter.addNameFilterCondition(query,custNm);
            String man = (String) map.get("man");
            String woman = (String) map.get("woman");
            query = gender.addGenderCondition(query, man, woman);
            String age = (String) map.get("age");
            query = ageFilter.addAgeFilterCondition(query,age);
            String custGrade = (String) map.get("custGrade");
            query = privateRate.addPrivateRateCondition(query,custGrade);
            String subTerm = (String) map.get("period");
            query = periodFilter.addPeriodFilterCondition(query,subTerm);
            String asset = (String) map.get("asset");
            query = assetFilter.addAssetFilterCondition(query,asset);
            String privacy = (String) map.get("privacyYes");
            query = privacyFilter.addPrivacyFilterCondition(query,privacy);
            String credit = (String) map.get("creditRating");
            query = creditFilter.addCreditRateCondition(query, credit);
            String overdueYes = (String) map.get("overdueYes"); // 연체여부 추가
            String overdueNo = (String) map.get("overdueNo");
            query = overdueFilter.addOverdueFilterCondition(query, overdueYes, overdueNo);
            query += " LIMIT ?, ?";
            int start = 0;
            int last = 0;
            try {
                start = Integer.parseInt(map.get("start").toString());
                last = Integer.parseInt(map.get("last").toString());

            } catch (NumberFormatException e) {
                // 유효한 정수로 변환할 수 없는 경우 처리할 내용을 작성합니다.
                e.printStackTrace();
            }

            try {
                PreparedStatement pstmt = dbConnPool.con.prepareStatement(query);
                pstmt.setInt(1,start);
                pstmt.setInt(2,last);
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
                    member.setCreditRating(rs.getInt("creditRating"));  // 신용등급
                    member.setOverdue(rs.getString("overdue")); // 연체여부
                    member.setPhoneNum(rs.getString("phoneNo"));
                    member.setEmail(rs.getString("email"));

                    custInfos.add(member);
                }

            } catch (Exception e) {

                e.printStackTrace();
            }
            finally{ dbConnPool.close();}

            return custInfos;
        });

        CompletableFuture<List<overdueNotificationDTO>> future2 = CompletableFuture.supplyAsync(() -> {
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
            String custNm = (String) map.get("custNm");
            query = nameFilter.addNameFilterCondition(query,custNm);
            String man = (String) map.get("man");
            String woman = (String) map.get("woman");
            query = gender.addGenderCondition(query, man, woman);
            String age = (String) map.get("age");
            query = ageFilter.addAgeFilterCondition(query,age);
            String custGrade = (String) map.get("custGrade");
            query = privateRate.addPrivateRateCondition(query,custGrade);
            String subTerm = (String) map.get("period");
            query = periodFilter.addPeriodFilterCondition(query,subTerm);
            String asset = (String) map.get("asset");
            query = assetFilter.addAssetFilterCondition(query,asset);
            String privacy = (String) map.get("privacyYes");
            query = privacyFilter.addPrivacyFilterCondition(query,privacy);
            String credit = (String) map.get("creditRating");
            query = creditFilter.addCreditRateCondition(query, credit);
            String overdueYes = (String) map.get("overdueYes"); // 연체여부 추가
            String overdueNo = (String) map.get("overdueNo");
            query = overdueFilter.addOverdueFilterCondition(query, overdueYes, overdueNo);
            query += " LIMIT ?, ?";
            int start = 0;
            int last = 0;
            try {
                start = Integer.parseInt(map.get("start").toString());
                last = Integer.parseInt(map.get("last").toString());

            } catch (NumberFormatException e) {
                // 유효한 정수로 변환할 수 없는 경우 처리할 내용을 작성합니다.
                e.printStackTrace();
            }

            try {
                PreparedStatement pstmt = dbConnPool2.con2.prepareStatement(query);
                pstmt.setInt(1,start);
                pstmt.setInt(2,last);
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
                    member.setCreditRating(rs.getInt("creditRating"));  // 신용등급
                    member.setOverdue(rs.getString("overdue")); // 연체여부
                    member.setPhoneNum(rs.getString("phoneNo"));
                    member.setEmail(rs.getString("email"));

                    custInfos.add(member);
                }

            } catch (Exception e) {

                e.printStackTrace();
            }
            finally{ dbConnPool2.close();}

            return custInfos;
        });

        List<overdueNotificationDTO> paginatedData = new ArrayList<>();
        paginatedData.addAll(future1.join());
        paginatedData.addAll(future2.join());

        return paginatedData;

    }
}
