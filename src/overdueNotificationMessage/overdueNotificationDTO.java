package overdueNotificationMessage;

public class overdueNotificationDTO {
    private String custNo;
    private String custNm;
    private String gender;
    private String age;
    private String job;
    private String privacy;
    private int credit;
    private String overdue;
    private int custGrade;
    private String asset;
    private String phoneNum;
    private String email;

    public void setCustNo(String custNo){ this.custNo = custNo;}
    public String getCustNo(){ return custNo;}

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

    public String getAge() {
        return age;
    }
    public void setAge(String age) {
        this.age = age;
    }

    public String getJob() {
        return job;
    }
    public void setJob(String job) {
        this.job = job;
    }

    public int getCustGrade() { return custGrade;}
    public void setCustGrade(int custGrade) {
        this.custGrade = custGrade;
    }

    public String getAsset() { return asset;}
    public void setAsset(String asset) {
        this.asset = asset;
    }

    public String getPrivacy() {
        return privacy;
    }
    public void setPrivacy(String privacy) {
        this.privacy = privacy;
    }

    public int getCredit(){return credit;}
    public void setCredit(int credit){ this.credit = credit;}

    public String getOverdue(){return overdue;}
    public void setOverdue(String overdue){ this.overdue = overdue;}

    public String getPhoneNum(){ return phoneNum;}
    public void setPhoneNum(String phone){ this.phoneNum = phone;}

    public String getEmail(){ return email;}
    public void setEmail(String email){ this.email = email;}
}