/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Model.Notification;
import Model.SaveJob;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

/**
 *
 * @author Administrator
 */
public class NotificationDAO extends DBContext {

    public void insert(Notification n) {
        String sql = "INSERT INTO [dbo].[Notification]\n"
                + "           ([userId]\n"
                + "           ,[message]\n"
                + "           ,[messageDate])\n"
                + "     VALUES\n"
                + "           (?,?,?)";

        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, n.getUser().getUserId());
            pre.setString(2, n.getMessage());
            java.util.Date utilDate = n.getMessageDate();
            java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime()); // Chuyển đổi sang java.sql.Date
            pre.setDate(3, sqlDate);
            pre.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public ArrayList<Notification> listByUser(int userId) {
        String sql = "select * from Notification where userId=?";
        ArrayList<Notification> list = new ArrayList<>();
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, userId);
            ResultSet rs = pre.executeQuery();
            UserDAO uDAO = new UserDAO();
            while(rs.next()){
                Notification n= new Notification();
                n.setNotificationId(rs.getInt("notificationId"));
                n.setMessage(rs.getString("message"));
                n.setMessageDate(rs.getDate("messageDate"));
                n.setUser(uDAO.getUserbyId(rs.getInt("userId")));
                list.add(n);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list ;
    }
}
