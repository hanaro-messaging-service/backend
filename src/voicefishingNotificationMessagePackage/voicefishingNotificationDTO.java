package voicefishingNotificationMessagePackage;

public class voicefishingNotificationDTO {

    private String custNm;
    private String custNo;
    private String age;
    private String privacy;
    private int asset;
    private String address;
    private String phoneNo;
    private String email;


    public String getCustNo() { return custNo; }
    public void setCustNo(String custNo) { this.custNo = custNo; }

    public int getAsset() { return asset; }

    public void setAsset(int asset) { this.asset = asset; }

    public String getAddress() { return address; }

    public void setAddress(String address) { this.address = address; }
    public String getPhoneNo() { return phoneNo; }
    public void setPhoneNo(String phoneNo) { this.phoneNo = phoneNo; }
    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getCustNm() {
        return custNm;
    }

    public void setCustNm(String custNm) {
        this.custNm = custNm;
    }

    public void setAge(String age) {
        this.age = age;
    }

    public String getAge() {
        return age;
    }

    public String getPrivacy() {
        return privacy;
    }

    public void setPrivacy(String privacy) {
        this.privacy = privacy;
    }

}

