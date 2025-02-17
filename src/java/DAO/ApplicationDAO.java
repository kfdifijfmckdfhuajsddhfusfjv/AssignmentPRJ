/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Model.Application;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Administrator
 */
public class ApplicationDAO extends DBContext {

    public void insert(Application app) {
        String sql = "INSERT INTO [dbo].[Application]\n"
                + "           ([jobId]\n"
                + "           ,[cvId]\n"
                + "           ,[submitDate]\n"
                + "           ,[status])\n"
                + "     VALUES\n"
                + "           (?,?,?,?)";

        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, app.getJob().getJobId());
            pre.setInt(2, app.getCv().getCvId());
            java.util.Date utilDate = app.getSubmitDate();
            java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime()); // Chuyển đổi sang java.sql.Date
            pre.setDate(3, sqlDate);
            pre.setString(4, app.getStatus());
            pre.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }

    }

    public ArrayList<Application> getBySeeker(int seekerId) {
        String sql = "select * from Application as a \n"
                + "join CV as c on a.cvId=c.cvId\n"
                + "where c.seekerId=?";
        ArrayList<Application> list = new ArrayList<>();
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, seekerId);
            ResultSet rs = pre.executeQuery();
            CVDAO cvDAO = new CVDAO();
            JobDAO jobDAO = new JobDAO();
            while (rs.next()) {
                Application app = new Application();
                app.setApplicationId(rs.getInt("applicationId"));
                app.setSubmitDate(rs.getDate("submitDate"));
                app.setStatus(rs.getString("status"));
                app.setCv(cvDAO.getByCvID(rs.getInt("cvId")));
                app.setJob(jobDAO.getById(rs.getInt("jobId")));
                list.add(app);
            }
            return list;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public void deleteByJob(int jobId) {
        String sql = "DELETE FROM [dbo].[Application]\n"
                + "      WHERE jobId=?";

        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, jobId);
            pre.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public ArrayList<Application> getByJob(int jobId) {
        String sql = "select * from Application where jobId=?";
        ArrayList<Application> list = new ArrayList<>();
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, jobId);
            ResultSet rs = pre.executeQuery();
            CVDAO cvDAO = new CVDAO();
            JobDAO jobDAO = new JobDAO();
            while (rs.next()) {
                Application app = new Application();
                app.setApplicationId(rs.getInt("applicationId"));
                app.setSubmitDate(rs.getDate("submitDate"));
                System.out.println(app.getSubmitDate());
                app.setStatus(rs.getString("status"));
                app.setCv(cvDAO.getByCvID(rs.getInt("cvId")));
                app.setJob(jobDAO.getById(rs.getInt("jobId")));
                list.add(app);
            }
            return list;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public void updateStatus(String decide, int applicationId) {
        String sql = "UPDATE [dbo].[Application]\n"
                + "   SET [status] = ?\n"
                + " WHERE applicationId=?";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            if (decide.equalsIgnoreCase("accept")) {
                pre.setString(1, "Accept");
                pre.setInt(2, applicationId);
            } else if (decide.equalsIgnoreCase("reject")) {
                pre.setString(1, "Reject");
                pre.setInt(2, applicationId);
            }
            pre.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void updateCV(int cvId, int applicationId) {
        String sql = "UPDATE [dbo].[Application]\n"
                + "   SET cvId =?\n"
                + " WHERE applicationId=?";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, cvId);
            pre.setInt(2, applicationId);
            pre.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public Application getById(int appId) {
        String sql = "select * from Application where applicationId=?";
        Application app = new Application();
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, appId);
            ResultSet rs = pre.executeQuery();
            CVDAO cvDAO = new CVDAO();
            JobDAO jobDAO = new JobDAO();
            if (rs.next()) {
                app.setApplicationId(rs.getInt("applicationId"));
                app.setSubmitDate(rs.getDate("submitDate"));
                System.out.println(app.getSubmitDate());
                app.setStatus(rs.getString("status"));
                app.setCv(cvDAO.getByCvID(rs.getInt("cvId")));
                app.setJob(jobDAO.getById(rs.getInt("jobId")));
            }
            return app;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return app;
    }

    public int countForChart(String status, int recruiterId) {
        String sql = "select count(*) from Application as a \n"
                + "join Job as j on a.jobId = j.jobId\n"
                + "join Recruiter as r on r.recruiterId=j.recruiterId\n"
                + "where a.status = ? and r.recruiterId =?";
        int cnt =0 ;
        try{
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setString(1, status);
            pre.setInt(2, recruiterId);
            ResultSet rs = pre.executeQuery();
            if (rs.next()) {
                cnt = rs.getInt(1);
            }
        }catch(SQLException e){
            System.out.println(e);
        }
        return cnt ;
    }
}
