package common;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DBConnPool2 {
    public Connection con2;
    public Statement stmt2;
    public PreparedStatement psmt2;
    public ResultSet rs2;

    // 기본 생성자
    public DBConnPool2() {
        try {
            // 커넥션 풀(DataSource) 얻기
            Context initCtx = new InitialContext();
            Context ctx = (Context)initCtx.lookup("java:comp/env");
            DataSource source = (DataSource)ctx.lookup("dbcp_mysql3");

            // 커넥션 풀을 통해 연결 얻기
            con2 = source.getConnection();


        }
        catch (Exception e) {

            e.printStackTrace();
        }
    }

    // 연결 해제(자원 반납)
    public void close() {
        try {
            if(rs2!=null)rs2.close();
            if(stmt2!=null)stmt2.close();
            if(psmt2!=null)psmt2.close();
            if(con2!=null) con2.close();  // 자동으로 커넥션 풀로 반납됨


        }
        catch (Exception e) {
            e.printStackTrace();
        }
    }
}