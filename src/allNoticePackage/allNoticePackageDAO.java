package allNoticePackage;

import common.DBConnPool;
import common.DBConnPool2;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.concurrent.CompletableFuture;

import productPromotionPackage.productPromotionMessageDTO;
import sqlCommonFunction.*;

public class allNoticePackageDAO {
    private DBConnPool dbConnPool;
    private DBConnPool2 dbConnPool2;

    public allNoticePackageDAO() {
        dbConnPool = new DBConnPool();
        dbConnPool2 = new DBConnPool2();
    }

    private String getAgeFromResidentNo(String residentNo) {
        int birthYear = Integer.parseInt(residentNo.substring(0, 2));
        int birthMonth = Integer.parseInt(residentNo.substring(2, 4));
        int birthDay = Integer.parseInt(residentNo.substring(4, 6));

        int currentYear = LocalDate.now().getYear();
        int currentMonth = LocalDate.now().getMonthValue();
        int currentDay = LocalDate.now().getDayOfMonth();

        int baseYear = (birthYear >= 0 && birthYear <= 21) ? 2000 : 1900;
        LocalDate birthDate = LocalDate.of(baseYear + birthYear, birthMonth, birthDay);
        LocalDate currentDate = LocalDate.of(currentYear, currentMonth, currentDay);

        return String.valueOf(currentYear - (baseYear + birthYear));
    }

    public String getResidentNoFromAge(int age) {
        int currentYear = LocalDate.now().getYear();
        int currentMonth = LocalDate.now().getMonthValue();
        int currentDay = LocalDate.now().getDayOfMonth();

        int baseYear = (currentYear >= 2000) ? 2000 : 1900;
        int birthYear = currentYear - age;
        int birthMonth = currentMonth;
        int birthDay = currentDay;

        String residentNo = String.format("%02d%02d%02d", birthYear % 100, birthMonth, birthDay);

        return residentNo;
    }

    public int selectMessage(Map<String, Object> map) {
        CompletableFuture<Integer> future1 = CompletableFuture.supplyAsync(() -> {;
            int totalCount = 0;
            try {
                String query = "SELECT count(*) AS total_count FROM cust_info WHERE 1=1";
                String custNm = (String) map.get("custNm");
                query = nameFilter.addNameFilterCondition(query, custNm);
                String age = (String) map.get("age");
                query = ageFilter.addAgeFilterCondition(query, age);
                String privacy = (String) map.get("privacy");
                query = privacyFilter.addPrivacyFilterCondition(query, privacy);
                String address = (String) map.get("address");
                query = addressFilter.addAddressFilterCondition(query, address);

                PreparedStatement pstmt = dbConnPool.con.prepareStatement(query);
                ResultSet rs = pstmt.executeQuery();
                while (rs.next()) {
                    totalCount = rs.getInt("total_count");
                }

                rs.close();
                pstmt.close();
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                dbConnPool.close();
            }
            return totalCount;
        });

        CompletableFuture<Integer> future2 = CompletableFuture.supplyAsync(() -> {
            int totalCount = 0;
            try {
                String query = "SELECT count(*) AS total_count FROM cust_info WHERE 1=1";
                String custNm = (String) map.get("custNm");
                query = nameFilter.addNameFilterCondition(query, custNm);
                String age = (String) map.get("age");
                query = ageFilter.addAgeFilterCondition(query, age);
                String privacy = (String) map.get("privacy");
                query = privacyFilter.addPrivacyFilterCondition(query, privacy);
                String address = (String) map.get("address");
                query = addressFilter.addAddressFilterCondition(query, address);

                PreparedStatement pstmt = dbConnPool2.con2.prepareStatement(query);
                ResultSet rs = pstmt.executeQuery();
                while (rs.next()) {
                    totalCount = rs.getInt("total_count");
                }

                rs.close();
                pstmt.close();
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                dbConnPool2.close();
            }
            return totalCount;
        });

        int totalCount = future1.join() + future2.join();

        return totalCount;
    }

    public List<allNoticePackageDTO> selectPaginatedMessage(Map<String, Object> map) {
        CompletableFuture<List<allNoticePackageDTO>> future1 = CompletableFuture.supplyAsync(() -> {

            List<allNoticePackageDTO> paginatedData = new ArrayList<>();
            try {
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
                query = nameFilter.addNameFilterCondition(query, custNm);
                String age = (String) map.get("age");
                query = ageFilter.addAgeFilterCondition(query, age);
                String privacy = (String) map.get("privacy");
                query = privacyFilter.addPrivacyFilterCondition(query, privacy);
                String address = (String) map.get("address");
                query = addressFilter.addAddressFilterCondition(query, address);
                query += " LIMIT ?, ?";
                System.out.println("query2"+query);
                int start = 0;
                int last = 0;
                try {
                    start = Integer.parseInt(map.get("start").toString());
                    last = Integer.parseInt(map.get("last").toString());
                } catch (NumberFormatException e) {
                    e.printStackTrace();
                }

                PreparedStatement pstmt = dbConnPool.con.prepareStatement(query);
                pstmt.setInt(1, start);
                pstmt.setInt(2, last);
                ResultSet rs = pstmt.executeQuery();

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

                rs.close();
                pstmt.close();
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                dbConnPool.close();
            }

            return paginatedData;
        });

        CompletableFuture<List<allNoticePackageDTO>> future2 = CompletableFuture.supplyAsync(() -> {
            List<allNoticePackageDTO> paginatedData = new ArrayList<>();
            try {
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
                query = nameFilter.addNameFilterCondition(query, custNm);
                String age = (String) map.get("age");
                query = ageFilter.addAgeFilterCondition(query, age);
                String privacy = (String) map.get("privacy");
                query = privacyFilter.addPrivacyFilterCondition(query, privacy);
                String address = (String) map.get("address");
                query = addressFilter.addAddressFilterCondition(query, address);
                query += " LIMIT ?, ?";
                System.out.println("query2"+query);
                int start = 0;
                int last = 0;
                try {
                    start = Integer.parseInt(map.get("start").toString());
                    last = Integer.parseInt(map.get("last").toString());
                } catch (NumberFormatException e) {
                    e.printStackTrace();
                }

                PreparedStatement pstmt = dbConnPool2.con2.prepareStatement(query);
                pstmt.setInt(1, start);
                pstmt.setInt(2, last);
                ResultSet rs = pstmt.executeQuery();

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

                rs.close();
                pstmt.close();
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                dbConnPool2.close();
            }

            return paginatedData;
        });

        List<allNoticePackageDTO> paginatedData = new ArrayList<>();
        paginatedData.addAll(future1.join());
        paginatedData.addAll(future2.join());

        return paginatedData;
    }
}
