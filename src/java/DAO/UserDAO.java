/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Model.Category;
import Model.Company;
import Model.Users;
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
public class UserDAO extends DBContext {

    public UserDAO() {
    }

    public ArrayList<Users> getAll() {
        ArrayList<Users> list = new ArrayList<>();
        String sql = "select * from Users";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                Users user = new Users(rs.getInt("userId"), rs.getInt("roleId"), rs.getString("username"), rs.getString("password"), rs.getString("firstname"), rs.getString("lastname"),
                        rs.getString("email"), rs.getString("dateOfBirth"), rs.getString("gender"), rs.getString("phone"), rs.getString("address"), rs.getString("avatar"));
                list.add(user);
            }
        } catch (SQLException e) {
            System.out.println("ngu");
        }
        return list;
    }

    public Users getUserbyId(int id) {
        ArrayList<Users> list = getAll();
        for (Users user : list) {
            if (user.getUserId() == id) {
                return user;
            }
        }
        return null;
    }

    public void update(Users user) {
        String sql = "UPDATE [dbo].[Users]\n"
                + "   SET \n"
                + "      [username] = ?\n"
                + "      ,[firstname] = ?\n"
                + "      ,[lastname] = ?\n"
                + "      ,[email] = ?\n"
                + "      ,[dateOfBirth] = ?\n"
                + "      ,[gender] = ?\n"
                + "      ,[phone] = ?\n"
                + "      ,[address] = ?\n"
                + " WHERE userId=?";

        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setString(1, user.getUserName());
            pre.setString(2, user.getFirstName());
            pre.setString(3, user.getLastName());
            pre.setString(4, user.getEmail());
            SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");
            Date date = formatter.parse(user.getDateOfBirth());
            java.util.Date utilDate = date;
            java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
            pre.setDate(5, sqlDate);
            pre.setString(6, user.getGender());
            pre.setString(7, user.getPhone());
            pre.setString(8, user.getAddress());
            pre.setInt(9, user.getUserId());
            pre.executeUpdate();
        } catch (SQLException | ParseException e) {
            System.out.println(e);
        }
    }

    public void changePassword(String password, int userId) {
        String sql = "update Users set password =? where userId=?";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setString(1, password);
            pre.setInt(2, userId);
            pre.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void insert(Users user) {
        String sql = "INSERT INTO [dbo].[Users]\n"
                + "           ([roleId]\n"
                + "           ,[username]\n"
                + "           ,[password]\n"
                + "           ,[firstname]\n"
                + "           ,[lastname]\n"
                + "           ,[email]\n"
                + "           ,[dateOfBirth]\n"
                + "           ,[gender]\n"
                + "           ,[phone]\n"
                + "           ,[address]\n"
                + "           ,[avatar])\n"
                + "     VALUES\n"
                + "           (?,?,?,?,?,?,?,?,?,?,?)";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, user.getRoleId());
            pre.setString(2, user.getUserName());
            pre.setString(3, user.getPassword());
            pre.setString(4, user.getFirstName());
            pre.setString(5, user.getLastName());
            pre.setString(6, user.getEmail());
            SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");
            Date date = formatter.parse(user.getDateOfBirth());
            java.util.Date utilDate = date;
            java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
            pre.setDate(7, sqlDate);
            pre.setString(8, user.getGender());
            pre.setString(9, user.getPhone());
            pre.setString(10, user.getAddress());
            pre.setString(11, user.getAvatar());
            pre.executeUpdate();
        } catch (SQLException | ParseException e) {
            System.out.println(e);
        }
    }

//              public static void main(String[] args){
//        UserDAO f= new UserDAO();
//        ArrayList<Users> d = f.getAll();
//        for(Users c: d){
//            System.out.println(c.getRoleId());
//        }
//    }
}
