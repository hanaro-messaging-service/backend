package customer;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import common.DBConnPool;
import java.time.LocalDate;
import java.time.Period;
public class MemberDAO extends DBConnPool {
    public MemberDAO() {
        super();
    }

    public List<MemberDTO> selectCustomer(Map<String, Object> map) {
        List<MemberDTO> custInfos = new ArrayList<>();
        CustomerDAO customerDAO = new CustomerDAO();
        AppDAO appDAO = new AppDAO();
        AccountDAO accountDAO = new AccountDAO();
        LoanAccountDAO loanAccountDAO = new LoanAccountDAO();
        String customerQuery = customerDAO.selectCustomerInfo(map);
        String appQuery = appDAO.selectAppInfo(map);
        String accountQuery = accountDAO.selectAccountInfo(map);
        String loanAccountQuery = loanAccountDAO.selectLoanInfo(map);
        String query = customerQuery+ " INTERSECT " + appQuery + " INTERSECT " + accountQuery + " INTERSECT " + loanAccountQuery;

        try {
            PreparedStatement pstmt = con.prepareStatement(query);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                MemberDTO member = new MemberDTO();
                member.setCustNo(rs.getString("custNo"));
                member.setCustNm(rs.getString("custNm"));
                String residentNo = rs.getString("residentNo");
                String age = getAgeFromResidentNo(residentNo);
                member.setResidentNo(age);
                member.setGender(rs.getString("gender"));
                member.setAddress(rs.getString("address"));
                member.setPhoneNo(rs.getString("phoneNo"));
                member.setPrivacy(rs.getString("privacy"));
                member.setJob(rs.getString("job"));
                member.setCustGrade(rs.getInt("custGrade"));
                custInfos.add(member);
            }
            rs.close();
            pstmt.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        finally{

        }


        return custInfos;
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
}
