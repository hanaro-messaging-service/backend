package DTO;

public class MemberDTO {
    private String id;
    private String pass;
    private String name;
    private String regidate;
    public static MemberDTO jdbc1;
    public static MemberDTO getJdbc1() {
        if (jdbc1 == null) {
            jdbc1 = new MemberDTO();
        }
        return jdbc1;
    }
    public String getId() {
        return id;
    }
    public void setId(String id) {
        this.id = id;
    }
    public String getPass() {
        return pass;
    }
    public void setPass(String pass) {
        this.pass = pass;
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public String getRegidate() {
        return regidate;
    }
    public void setRegidate(String regidate) {
        this.regidate = regidate;
    }
}
