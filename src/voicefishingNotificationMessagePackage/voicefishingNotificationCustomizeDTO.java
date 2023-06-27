package voicefishingNotificationMessagePackage;

public class voicefishingNotificationCustomizeDTO {
    private String custNm;
    private String age;
    private String privacy;
    private String mContents;
    private String id;

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
    public String getMContents () {return mContents;}
    public void setMContents(String mContents) {
        this.mContents = mContents;
    }

    public String getId () {
        return id;
    }
    public void setId(String id) {
        this.id = id;
    }
}
