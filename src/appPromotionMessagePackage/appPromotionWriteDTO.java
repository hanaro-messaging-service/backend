package appPromotionMessagePackage;

public class appPromotionWriteDTO {
    private String custNm;
    private String gender;
    private String age;
    private String job;
    private int custGrade;
    private String subTerm;
    private String asset;
    private String privacy;
    private String recLoginDate;



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

    public int getCustGrade() {
        return custGrade;

    }
    public void setCustGrade(int custGrade) {
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
}
