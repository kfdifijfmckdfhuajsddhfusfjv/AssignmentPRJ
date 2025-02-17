/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Model.CV;
import Model.Company;
import Model.JobSeeker;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Administrator
 */
public class CVDAO extends DBContext {

    public ArrayList<CV> getBySeeker(int id) {
        String sql = "select * from CV where seekerId=?";
        JobSeekerDAO seekerDAO = new JobSeekerDAO();
        ArrayList<CV> cvList = new ArrayList<>();
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, id);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                CV cv = new CV();
                cv.setCvId(rs.getInt("cvId"));
                cv.setCvLink(rs.getString("cvLink"));
                cv.setJobseeker(seekerDAO.getSeekerById(rs.getInt("seekerId")));
                cvList.add(cv);
            }
        } catch (SQLException e) {
            System.out.println("ngu");
        }
        return cvList;
    }

    public CV getByCvID(int id) {
        String sql = "select * from CV where cvId=?";
        JobSeekerDAO seekerDAO = new JobSeekerDAO();
        ArrayList<CV> cvList = new ArrayList<>();
        CV cv = new CV();
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, id);
            ResultSet rs = pre.executeQuery();
            if (rs.next()) {
                cv.setCvId(rs.getInt("cvId"));
                cv.setCvLink(rs.getString("cvLink"));
                cv.setJobseeker(seekerDAO.getSeekerById(rs.getInt("seekerId")));
            }
        } catch (SQLException e) {
            System.out.println("ngu");
        }
        return cv;
    }

    public void insert(CV cv) {
        String sql = "INSERT INTO [dbo].[CV]\n"
                + "           ([seekerId]\n"
                + "           ,[cvLink])\n"
                + "     VALUES\n"
                + "           (?, ?)";

        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, cv.getJobseeker().getSeekerId());
            pre.setString(2, cv.getCvLink());
            pre.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void delete(int id) {
        String sql = "DELETE FROM [dbo].[CV]\n"
                + "      WHERE cvId=?";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, id);
            pre.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
}
