package appPromotionMessagePackage;

public class appPromotionCustomizeDTO {
    private String custNm;
    private String gender;
    private String age;
    private String job;
    private String custGrade;
    private String subTerm;
    private String asset;
    private String privacy;
    private String recLoginDate;

    private String prodNm;
    private String mContents;
    private String id;

    public String getCustNm() {
        return custNm;
    }

    public void setCustNm(String custNm) {
        this.custNm = custNm;
    }


    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public void setAge(String age) {
        this.age = age;
    }

    public String getAge() {
        return age;
    }
    public String getJob() {
        return job;
    }

    public void setJob(String job) {
        this.job = job;
    }

    public String getCustGrade() {
        return custGrade;

    }
    public void setCustGrade(String custGrade) {
        this.custGrade = custGrade;
    }


    public String getSubTerm() {
        return subTerm;
    }

    public void setSubTerm(String subTerm) {
        this.subTerm = subTerm;
    }
    public String getAsset() {
        return asset;
    }

    public void setAsset(String asset) {
        this.asset = asset;
    }
    public String getPrivacy() {
        return privacy;
    }

    public void setPrivacy(String privacy) {
        this.privacy = privacy;
    }
    public String getRecLoginDate() {
        return recLoginDate;
    }

    public void setRecLoginDate(String recLoginDate) {
        this.recLoginDate = recLoginDate;
    }

    public String getProdNm() {return prodNm;}
    public void setProdNm(String prodNm) {
        this.prodNm = prodNm;
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
