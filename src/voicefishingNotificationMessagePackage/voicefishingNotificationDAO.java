package voicefishingNotificationMessagePackage;

import common.DBConnPool;
import common.DBConnPool2;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.concurrent.CompletableFuture;

import sqlCommonFunction.*;

public class voicefishingNotificationDAO {
    private DBConnPool dbConnPool;
    private DBConnPool2 dbConnPool2;

    public voicefishingNotificationDAO() {
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
        CompletableFuture<Integer> future1 = CompletableFuture.supplyAsync(() -> {
            int totalCount = 0;
            try {
                String query = "SELECT count(*) AS total_count " +
                        "FROM cust_info " +
                        "JOIN com_acc_info ON cust_info.custNo = com_acc_info.custNo " +
                        "WHERE 1=1";

                String custNm = (String) map.get("custNm");
                query = nameFilter.addNameFilterCondition(query, custNm);
                String age = (String) map.get("age");
                query = ageFilter.addAgeFilterCondition(query, age);
                String privacy = (String) map.get("privacy");
                query = privacyFilter.addPrivacyFilterCondition(query, privacy);

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
                String query = "SELECT count(*) AS total_count " +
                        "FROM cust_info " +
                        "JOIN com_acc_info ON cust_info.custNo = com_acc_info.custNo " +
                        "WHERE 1=1";

                String custNm = (String) map.get("custNm");
                query = nameFilter.addNameFilterCondition(query, custNm);
                String age = (String) map.get("age");
                query = ageFilter.addAgeFilterCondition(query, age);
                String privacy = (String) map.get("privacy");
                query = privacyFilter.addPrivacyFilterCondition(query, privacy);

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

    public List<voicefishingNotificationDTO> selectPaginatedMessage(Map<String, Object> map) {
        CompletableFuture<List<voicefishingNotificationDTO>> future1 = CompletableFuture.supplyAsync(() -> {
            List<voicefishingNotificationDTO> paginatedData = new ArrayList<>();
            try {
                String query = "SELECT " +
                        "cust_info.custNm, " +
                        "cust_info.privacy, " +
                        "cust_info.address, " +
                        "cust_info.residentNo, " +
                        "cust_info.email, " +
                        "com_acc_info.balance " +
                        "FROM " +
                        "cust_info " +
                        "JOIN com_acc_info ON cust_info.custNo = com_acc_info.custNo " +
                        "WHERE 1=1";

                String custNm = (String) map.get("custNm");
                query = nameFilter.addNameFilterCondition(query, custNm);
                String age = (String) map.get("age");
                query = ageFilter.addAgeFilterCondition(query, age);
                String address = (String) map.get("address");
                query = addressFilter.addAddressFilterCondition(query, address);
                String asset = (String) map.get("asset");
                query = assetFilter.addAssetFilterCondition(query, asset);
                String privacy = (String) map.get("privacy");
                query = privacyFilter.addPrivacyFilterCondition(query, privacy);
                query += " LIMIT ?, ?";

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
                    voicefishingNotificationDTO member = new voicefishingNotificationDTO();
                    member.setCustNm(rs.getString("custNm"));
                    member.setEmail(rs.getString("email"));
                    String residentNo = rs.getString("residentNo");
                    String custAge = getAgeFromResidentNo(residentNo);
                    member.setAge(custAge);
                    member.setAddress(rs.getString("address"));
                    member.setAsset(rs.getString("balance"));
                    member.setPrivacy(rs.getString("privacy"));
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

        CompletableFuture<List<voicefishingNotificationDTO>> future2 = CompletableFuture.supplyAsync(() -> {
            List<voicefishingNotificationDTO> paginatedData = new ArrayList<>();
            try {
                String query = "SELECT " +
                        "cust_info.custNm, " +
                        "cust_info.privacy, " +
                        "cust_info.address, " +
                        "cust_info.residentNo, " +
                        "cust_info.email, " +
                        "com_acc_info.balance " +
                        "FROM " +
                        "cust_info " +
                        "JOIN com_acc_info ON cust_info.custNo = com_acc_info.custNo " +
                        "WHERE 1=1";

                String custNm = (String) map.get("custNm");
                query = nameFilter.addNameFilterCondition(query, custNm);
                String age = (String) map.get("age");
                query = ageFilter.addAgeFilterCondition(query, age);
                String address = (String) map.get("address");
                query = addressFilter.addAddressFilterCondition(query, address);
                String asset = (String) map.get("asset");
                query = assetFilter.addAssetFilterCondition(query, asset);
                String privacy = (String) map.get("privacy");
                query = privacyFilter.addPrivacyFilterCondition(query, privacy);
                query += " LIMIT ?, ?";

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
                    voicefishingNotificationDTO member = new voicefishingNotificationDTO();
                    member.setCustNm(rs.getString("custNm"));
                    member.setEmail(rs.getString("email"));
                    String residentNo = rs.getString("residentNo");
                    String custAge = getAgeFromResidentNo(residentNo);
                    member.setAge(custAge);
                    member.setAddress(rs.getString("address"));
                    member.setAsset(rs.getString("balance"));
                    member.setPrivacy(rs.getString("privacy"));
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

        List<voicefishingNotificationDTO> paginatedData = new ArrayList<>();
        paginatedData.addAll(future1.join());
        paginatedData.addAll(future2.join());

        return paginatedData;
    }
}
