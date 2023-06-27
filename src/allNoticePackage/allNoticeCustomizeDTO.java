package allNoticePackage;

public class allNoticeCustomizeDTO {
    private String custNm;
    private String age;
    private String privacy;
    private String mContents;
    private String mTitle;
    private String location;
    private String id; // 메시지 연번

    public allNoticeCustomizeDTO(){

    }

    public String getPrivacy() {
        return privacy;
    }

    public void setPrivacy(String privacy) {
        this.privacy = privacy;
    }

    public String getAge() {
        return age;
    }

    public void setAge(String age) {
        this.age = age;
    }

    public String getCustNm() {
        return custNm;
    }

    public void setCustNm(String custNm) {
        this.custNm = custNm;
    }

    public String getMContents() {
        return mContents;
    }

    public void setMContents(String mContents) {
        this.mContents = mContents;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getMTitle() {
        return mTitle;
    }

    public void setMTitle(String mTitle) {
        this.mTitle = mTitle;
    }

    public String getLocation() { return location;}
    public void setLocation(String location){this.location = location;}
}
