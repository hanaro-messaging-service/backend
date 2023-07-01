package allNoticePackage;

import common.DBConnPool;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import productPromotionPackage.productPromotionMessageDTO;
import sqlCommonFunction.*;

public class allNoticePackageDAO extends DBConnPool {
    public allNoticePackageDAO() {
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
        System.out.println("전체조회 DTO");
        List<allNoticePackageDTO> custInfos = new ArrayList<>();
        String query = "SELECT " +
                "count(*) AS total_count " +
                "FROM " +
                "cust_info " +
                "WHERE 1=1";
        String custNm = (String) map.get("custNm");
        query = nameFilter.addNameFilterCondition(query,custNm);
        String age = (String) map.get("age");
        query = ageFilter.addAgeFilterCondition(query,age);
        System.out.println("age들어가니2");
        String privacy = (String) map.get("privacy");
        query = privacyFilter.addPrivacyFilterCondition(query,privacy);
        String address =(String) map.get("address");
        query = addressFilter.addAddressFilterCondition(query,address);

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
            System.out.println("전체조회 DTO 완료");
            close();
        }
        System.out.println(totalCount);
        return totalCount;
    }

    public List<allNoticePackageDTO> selectPaginatedMessage(Map<String, Object> map) {
        System.out.println("전체조회 DTO");
        List<allNoticePackageDTO> paginatedData = new ArrayList<>();
        String query = "SELECT " +
                "cust_info.custNm, " +
                "cust_info.custNo, " +
                "cust_info.residentNo, " +
                "cust_info.address, " +
                "cust_info.privacy, " +
                "cust_info.phoneNo, " +
                "cust_info.email " +
                "FROM " +
                "cust_info " +
                "WHERE 1=1";
        String custNm = (String) map.get("custNm");
        query = nameFilter.addNameFilterCondition(query,custNm);
        String age = (String) map.get("age");
        query = ageFilter.addAgeFilterCondition(query,age);
        System.out.println("age들어가니2");
        String privacy = (String) map.get("privacy");
        query = privacyFilter.addPrivacyFilterCondition(query,privacy);
        String address =(String) map.get("address");
        query = addressFilter.addAddressFilterCondition(query,address);
        query += " LIMIT ?, ?";
        System.out.println(query);
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
        try {
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setInt(1,start);
            pstmt.setInt(2,last);
            ResultSet rs = pstmt.executeQuery();
            System.out.println("뭐가문제니");
            while (rs.next()) {
                allNoticePackageDTO member = new allNoticePackageDTO();
                member.setCustNo(rs.getString("custNo"));
                member.setCustNm(rs.getString("custNm"));
                String residentNo = rs.getString("residentNo");
                String custAge = getAgeFromResidentNo(residentNo);
                member.setAge(custAge);

                member.setAddress(rs.getString("address"));
                member.setPrivacy(rs.getString("privacy"));
                member.setPhoneNo(rs.getString("phoneNo"));
                member.setEmail(rs.getString("email"));
                paginatedData.add(member);
            }

        } catch (Exception e) {
            System.out.println("고객 정보 조회 중 예외 발생");
            e.printStackTrace();
        }
        finally{
            System.out.println("전체조회 DTO 완료");
            close();
        }

        return paginatedData;
    }

}

