package cn.clov614.dao;

import cn.clov614.bean.Book;
import cn.clov614.bean.HistoryBook;
import cn.clov614.utils.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;


public class HistoryDao {
    public List<HistoryBook> list(int readerid) {
        List<HistoryBook> list = new ArrayList<>();
        String sql = "select * from history_book where reader_id=?";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)){
            stmt.setInt(1,readerid);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                // private String name;
                // private float price;
                // private int num;
                // private String writer;
                // private int ISBN;
                int reader_id = rs.getInt(1);
                String name = rs.getString(2);
                float price = rs.getFloat(3);
                int num = rs.getInt(4);
                String writer = rs.getString(5);
                String time = rs.getString(6);
                int isbn = rs.getInt(7);
                HistoryBook hb = new HistoryBook(reader_id,name,price,num,writer,time,isbn);
                list.add(hb);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return list;
    }

    public void add(HistoryBook bean) {
        String sql = "insert into history_book values(?,?,?,?,?,?,?)";
        try(Connection conn = DBUtil.getConnection();
            PreparedStatement stmt = conn.prepareStatement(sql)) {
            // private String name;
            // private float price;
            // private int num;
            // private String writer;
            // private int ISBN;
            stmt.setInt(1,bean.getReader_id());
            stmt.setString(2,bean.getName());
            stmt.setFloat(3,bean.getPrice());
            stmt.setInt(4,bean.getNum());
            stmt.setString(5,bean.getWriter());
            stmt.setString(6,bean.getTime());
            stmt.setInt(7,bean.getIsbn());

            stmt.execute();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

}
