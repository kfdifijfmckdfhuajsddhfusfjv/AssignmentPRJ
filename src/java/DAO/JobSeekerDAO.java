/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Model.JobSeeker;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Administrator
 */
public class JobSeekerDAO extends DBContext {

    public JobSeeker getByUserId(int id) {

        String sql = "  select * from JobSeeker as j join Users as u on j.userId =u.userId where u.userId=?";
        UserDAO uDAO = new UserDAO();
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, id);
            ResultSet rs = pre.executeQuery();
            JobSeeker jobseeker = new JobSeeker();
            if (rs.next()) {
                jobseeker.setSeekerId(rs.getInt("seekerId"));
                jobseeker.setExperience(rs.getString("experience"));
                jobseeker.setLocation(rs.getString("location"));
                jobseeker.setPosition(rs.getString("position"));
                jobseeker.setSalary(rs.getFloat("salary"));
                jobseeker.setSkills(rs.getString("skills"));
                jobseeker.setUser(uDAO.getUserbyId(rs.getInt("userId")));
            }
            return jobseeker;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public JobSeeker getSeekerById(int id) {
        String sql = "select * from JobSeeker as j where j.seekerId=?";
        UserDAO uDAO = new UserDAO();
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, id);
            ResultSet rs = pre.executeQuery();
            JobSeeker jobseeker = new JobSeeker();
            if (rs.next()) {
                jobseeker.setSeekerId(rs.getInt("seekerId"));
                jobseeker.setExperience(rs.getString("experience"));
                jobseeker.setLocation(rs.getString("location"));
                jobseeker.setPosition(rs.getString("position"));
                jobseeker.setSalary(rs.getFloat("salary"));
                jobseeker.setSkills(rs.getString("skills"));
                jobseeker.setUser(uDAO.getUserbyId(rs.getInt("userId")));
            }
            return jobseeker;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

//    public static void main(String[] args) {
//        JobSeekerDAO f = new JobSeekerDAO();
//        JobSeeker d = f.getByUserId(1);
//        System.out.println(d.getPosition());
//
//    }
}
