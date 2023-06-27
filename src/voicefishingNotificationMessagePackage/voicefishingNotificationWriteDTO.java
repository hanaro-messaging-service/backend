package voicefishingNotificationMessagePackage;

public class voicefishingNotificationWriteDTO {
    private String custNm;
    private String age;
    private String privacy;

    private String prodNm;
    private String mContents;

    public String getProdNm() {
        return prodNm;
    }

    public void setProdNm(String prodNm) {
        this.prodNm = prodNm;
    }

    public String getmContents() {
        return mContents;
    }

    public void setmContents(String mContents) {
        this.mContents = mContents;
    }


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
