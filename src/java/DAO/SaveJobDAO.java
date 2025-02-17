/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

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
public class SaveJobDAO extends DBContext {

    public SaveJobDAO() {
    }

    public ArrayList<SaveJob> listOfSaveJobtBySeeker(int id) {
        String sql = " select * from SaveJob where seekerId=?";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, id);
            ResultSet rs = pre.executeQuery();
            JobSeekerDAO seekerDAO = new JobSeekerDAO();
            JobDAO jobDAO = new JobDAO();
            ArrayList<SaveJob> list = new ArrayList<>();
            while (rs.next()) {
                SaveJob savejob = new SaveJob(rs.getInt("saveJobId"), seekerDAO.getSeekerById(rs.getInt("seekerId")),
                        jobDAO.getById(rs.getInt("jobId")), rs.getString("saveDate"));
                list.add(savejob);
            }
            return list;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public void insert(SaveJob sj)  {
        String sql = "INSERT INTO [dbo].[SaveJob]\n"
                + "           ([seekerId]\n"
                + "           ,[jobId]\n"
                + "           ,[saveDate])\n"
                + "     VALUES\n"
                + "           (?,?,?)\n";

        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, sj.getJobseeker().getSeekerId());
            pre.setInt(2, sj.getJob().getJobId());
            SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");
            Date date = formatter.parse(sj.getSaveDate());
            java.util.Date utilDate = date;
            java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime()); // Chuyển đổi sang java.sql.Date
            pre.setDate(3, sqlDate);
            pre.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }catch(ParseException e){
            
        }
    }
    public void deleteByJob(int jobId) {
        String sql = "DELETE FROM [dbo].[SaveJob]\n"
                + "      WHERE jobId=?";
        
        try{
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, jobId);
            pre.executeUpdate();
        }catch(SQLException e){
            System.out.println(e);
        }
    }
    
    public void delete(int savejobId) {
        String sql = "DELETE FROM [dbo].[SaveJob]\n"
                + "      WHERE saveJobId=?";
        
        try{
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, savejobId);
            pre.executeUpdate();
        }catch(SQLException e){
            System.out.println(e);
        }
    }
// public static void main(String[] args) {
//        // Tạo đối tượng DAO để gọi hàm
//        SaveJobDAO saveJobDAO = new SaveJobDAO();
//
//        // Thực hiện kiểm tra với seekerId là 1 (hoặc bất kỳ id nào có trong cơ sở dữ liệu)
//        int seekerId = 1;  // Bạn có thể thay đổi seekerId để kiểm tra với giá trị khác
//
//        // Gọi hàm listOfSaveJobtBySeeker và in ra kết quả
//        ArrayList<SaveJob> saveJobs = saveJobDAO.listOfSaveJobtBySeeker(seekerId);
//        
//        if (saveJobs != null && !saveJobs.isEmpty()) {
//            for (SaveJob saveJob : saveJobs) {
//                System.out.println("SaveJob ID: " + saveJob.getSaveJobId());
////                System.out.println("Seeker Name: " + saveJob.getSeeker().getName());
//                System.out.println("Job Title: " + saveJob.getJob().getJobTitle());
//                System.out.println("Save Date: " + saveJob.getSaveDate());
//                System.out.println("----------");
//            }
//        } else {
//            System.out.println("No saved jobs found for seeker with ID: " + seekerId);
//        }
//    }
//          public static void main(String[] args){
//        SaveJobDAO f= new SaveJobDAO();
//        ArrayList<SaveJob> d = f.listOfSaveJobtBySeeker(1);
//        for(SaveJob c: d){
//            System.out.println(c.getSaveDate());
//        }
}
