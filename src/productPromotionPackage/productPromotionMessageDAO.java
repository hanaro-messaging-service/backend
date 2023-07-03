package productPromotionPackage;

import allNoticePackage.allNoticePackageDTO;
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

public class productPromotionMessageDAO {
    private DBConnPool dbConnPool;
    private DBConnPool2 dbConnPool2;

    public productPromotionMessageDAO() {
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
                String query = "SELECT " +
                        "count(*) AS total_count " +
                        "FROM " +
                        "cust_info " +
                        "JOIN com_acc_info ON cust_info.custNo = com_acc_info.custNo " +
                        "WHERE " +
                        "1=1";

                String custNm = (String) map.get("custNm");
                query = nameFilter.addNameFilterCondition(query, custNm);
                String man = (String) map.get("man");
                String woman = (String) map.get("woman");
                query = gender.addGenderCondition(query, man, woman);
                String age = (String) map.get("age");
                query = ageFilter.addAgeFilterCondition(query, age);
                String job = (String) map.get("job");
                query = jobFilter.addJobCondition(query, job);
                String address = (String) map.get("address");
                query = addressFilter.addAddressFilterCondition(query, address);
                String custGrade = (String) map.get("private");
                query = privateRate.addPrivateRateCondition(query, custGrade);
                String branch = (String) map.get("branch");
                query = branchFilter.addBranchFilterCondition(query, branch);
                String subTerm = (String) map.get("period");
                query = periodFilter.addPeriodFilterCondition(query, subTerm);
                String asset = (String) map.get("asset");
                query = assetFilter.addAssetFilterCondition(query, asset);
                String privacy = (String) map.get("privacy");
                query = privacyFilter.addPrivacyFilterCondition(query, privacy);
                String recLoginDate = (String) map.get("recLoginDate");
                query = recLogindateFilter.addDateRangeFilterCondition(query, recLoginDate);

                PreparedStatement pstmt = dbConnPool.con.prepareStatement(query);
                ResultSet rs = pstmt.executeQuery();
                while (rs.next()) {
                    totalCount = rs.getInt("total_count");
                }
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
                String query = "SELECT " +
                        "count(*) AS total_count " +
                        "FROM " +
                        "cust_info " +
                        "JOIN com_acc_info ON cust_info.custNo = com_acc_info.custNo " +
                        "WHERE " +
                        "1=1";

                String custNm = (String) map.get("custNm");
                query = nameFilter.addNameFilterCondition(query, custNm);
                String man = (String) map.get("man");
                String woman = (String) map.get("woman");
                query = gender.addGenderCondition(query, man, woman);
                String age = (String) map.get("age");
                query = ageFilter.addAgeFilterCondition(query, age);
                String job = (String) map.get("job");
                query = jobFilter.addJobCondition(query, job);
                String address = (String) map.get("address");
                query = addressFilter.addAddressFilterCondition(query, address);
                String custGrade = (String) map.get("private");
                query = privateRate.addPrivateRateCondition(query, custGrade);
                String branch = (String) map.get("branch");
                query = branchFilter.addBranchFilterCondition(query, branch);
                String subTerm = (String) map.get("period");
                query = periodFilter.addPeriodFilterCondition(query, subTerm);
                String asset = (String) map.get("asset");
                query = assetFilter.addAssetFilterCondition(query, asset);
                String privacy = (String) map.get("privacy");
                query = privacyFilter.addPrivacyFilterCondition(query, privacy);
                String recLoginDate = (String) map.get("recLoginDate");
                query = recLogindateFilter.addDateRangeFilterCondition(query, recLoginDate);

                PreparedStatement pstmt = dbConnPool2.con2.prepareStatement(query);
                ResultSet rs = pstmt.executeQuery();
                while (rs.next()) {
                    totalCount = rs.getInt("total_count");
                }
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                dbConnPool2.close();
            }
            return totalCount;
        });

        return future1.thenCombine(future2, Integer::sum).join();
    }

    public List<productPromotionMessageDTO> selectPaginatedMessage(Map<String, Object> map) {
        CompletableFuture<List<productPromotionMessageDTO>> future1 = CompletableFuture.supplyAsync(() -> {
            List<productPromotionMessageDTO> paginatedData = new ArrayList<>();
            try {
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
                        "cust_info.recLoginDate " +
                        "FROM " +
                        "cust_info " +
                        "JOIN com_acc_info ON cust_info.custNo = com_acc_info.custNo " +
                        "WHERE " +
                        "1=1";

                String custNm = (String) map.get("custNm");
                query = nameFilter.addNameFilterCondition(query, custNm);
                String man = (String) map.get("man");
                String woman = (String) map.get("woman");
                query = gender.addGenderCondition(query, man, woman);
                String age = (String) map.get("age");
                query = ageFilter.addAgeFilterCondition(query, age);
                String job = (String) map.get("job");
                query = jobFilter.addJobCondition(query, job);
                String address = (String) map.get("address");
                query = addressFilter.addAddressFilterCondition(query, address);
                String custGrade = (String) map.get("private");
                query = privateRate.addPrivateRateCondition(query, custGrade);
                String branch = (String) map.get("branch");
                query = branchFilter.addBranchFilterCondition(query, branch);
                String subTerm = (String) map.get("period");
                query = periodFilter.addPeriodFilterCondition(query, subTerm);
                String asset = (String) map.get("asset");
                query = assetFilter.addAssetFilterCondition(query, asset);
                String privacy = (String) map.get("privacy");
                query = privacyFilter.addPrivacyFilterCondition(query, privacy);
                String recLoginDate = (String) map.get("recLoginDate");
                query = recLogindateFilter.addDateRangeFilterCondition(query, recLoginDate);

                query += " LIMIT ?, ?";
                int start = Integer.parseInt(map.get("start").toString());
                int last = Integer.parseInt(map.get("last").toString());

                PreparedStatement pstmt = dbConnPool.con.prepareStatement(query);
                pstmt.setInt(1, start);
                pstmt.setInt(2, last);
                ResultSet rs = pstmt.executeQuery();

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
                }
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                dbConnPool.close();
            }
            return paginatedData;
        });

        CompletableFuture<List<productPromotionMessageDTO>> future2 = CompletableFuture.supplyAsync(() -> {
            List<productPromotionMessageDTO> paginatedData = new ArrayList<>();
            try {
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
                        "cust_info.recLoginDate " +
                        "FROM " +
                        "cust_info " +
                        "JOIN com_acc_info ON cust_info.custNo = com_acc_info.custNo " +
                        "WHERE " +
                        "1=1";

                String custNm = (String) map.get("custNm");
                query = nameFilter.addNameFilterCondition(query, custNm);
                String man = (String) map.get("man");
                String woman = (String) map.get("woman");
                query = gender.addGenderCondition(query, man, woman);
                String age = (String) map.get("age");
                query = ageFilter.addAgeFilterCondition(query, age);
                String job = (String) map.get("job");
                query = jobFilter.addJobCondition(query, job);
                String address = (String) map.get("address");
                query = addressFilter.addAddressFilterCondition(query, address);
                String custGrade = (String) map.get("private");
                query = privateRate.addPrivateRateCondition(query, custGrade);
                String branch = (String) map.get("branch");
                query = branchFilter.addBranchFilterCondition(query, branch);
                String subTerm = (String) map.get("period");
                query = periodFilter.addPeriodFilterCondition(query, subTerm);
                String asset = (String) map.get("asset");
                query = assetFilter.addAssetFilterCondition(query, asset);
                String privacy = (String) map.get("privacy");
                query = privacyFilter.addPrivacyFilterCondition(query, privacy);
                String recLoginDate = (String) map.get("recLoginDate");
                query = recLogindateFilter.addDateRangeFilterCondition(query, recLoginDate);

                query += " LIMIT ?, ?";
                int start = Integer.parseInt(map.get("start").toString());
                int last = Integer.parseInt(map.get("last").toString());

                PreparedStatement pstmt = dbConnPool2.con2.prepareStatement(query);
                pstmt.setInt(1, start);
                pstmt.setInt(2, last);
                ResultSet rs = pstmt.executeQuery();

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
                }
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                dbConnPool2.close();
            }
            return paginatedData;
        });


        List<productPromotionMessageDTO> paginatedData = new ArrayList<>();
        paginatedData.addAll(future1.join());
        paginatedData.addAll(future2.join());

        return paginatedData;

    }
}
