package sqlCommonFunction;

public class addressFilter {
    public static String addAddressFilterCondition(String query, String address) {
        if (address != null && !address.isEmpty()) {
            switch (address) {
                case "서울특별시":
                    query += " AND cust_info.address = '서울특별시'";
                    break;
                case "경기도":
                    query += " AND cust_info.address = '경기도'";
                    break;
                case "충청도":
                    query += " AND cust_info.address = '충청도'";
                    break;
                case "전라도":
                    query += " AND cust_info.address = '전라도'";
                    break;
                case "강원도":
                    query += " AND cust_info.address = '강원도'";
                    break;
                default:
                    break;
            }
        }
        return query;
    }
}
