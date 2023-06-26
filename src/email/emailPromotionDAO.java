package email;

import common.DBConnPool;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class emailPromotionDAO extends DBConnPool {
    public emailPromotionDAO() {
        super();
    }

    public int selectMessage() {
        int viewCount = 0;
        String query = "UPDATE chart_list SET views = views + 1 WHERE id = 'promotion'";
        try (PreparedStatement pstmt = con.prepareStatement(query)) {
            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }

        String selectQuery = "SELECT views FROM chart_list WHERE id = 'promotion'";
        try (PreparedStatement pstmt = con.prepareStatement(selectQuery)) {
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                viewCount = rs.getInt("views");
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close();
        }
        return viewCount;
    }
    public int showChart(){
        String selectQuery = "SELECT views FROM chart_list WHERE id = 'promotion'";
        int viewCount=0;
        try (PreparedStatement pstmt = con.prepareStatement(selectQuery)) {
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                viewCount = rs.getInt("views");
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close();
        }
        return viewCount;
    }

}
