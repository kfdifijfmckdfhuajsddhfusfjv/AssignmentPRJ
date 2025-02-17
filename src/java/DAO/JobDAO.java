/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Model.Category;
import Model.Company;
import Model.Job;
import Model.Recruiter;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Administrator
 */
public class JobDAO extends DBContext {

    public JobDAO() {
    }

    public ArrayList<Job> getAllBypage(int start) {
        ArrayList<Job> list = new ArrayList<>();
        String sql = "SELECT * FROM Job \n"
                + "ORDER BY jobId\n"
                + "OFFSET ? ROWS FETCH NEXT 5 ROWS ONLY;";
        CompanyDAO comDAO = new CompanyDAO();
        RecruiterDAO reDAO = new RecruiterDAO();
        CategoryDAO cateDAO = new CategoryDAO();
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, start);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                Job job = new Job();
                job.setJobId(rs.getInt("jobId"));
                job.setExperience(rs.getString("experience"));
                job.setJobTitle(rs.getString("jobTitle"));
                job.setJobDescription(rs.getString("jobDescription"));
                job.setRequirements(rs.getString("requirements"));
                job.setPosition(rs.getString("position"));
                job.setSkills(rs.getString("skills"));
                job.setNumberOfSeeker(rs.getInt("numberOfSeeker"));
                job.setSalary(rs.getFloat("salary"));
                job.setCompany(comDAO.getCompanybyId(rs.getInt("companyId")));
                job.setRecruiter(reDAO.getRecruiterbyId(rs.getInt("recruiterId")));
                job.setCategory(cateDAO.getCategorybyId(rs.getInt("categoryId")));
                list.add(job);
            }
        } catch (SQLException e) {
            System.out.println("ngu");
        }
        return list;
    }

    public ArrayList<Job> getAll() {
        ArrayList<Job> list = new ArrayList<>();
        String sql = "select * from Job";
        CompanyDAO comDAO = new CompanyDAO();
        RecruiterDAO reDAO = new RecruiterDAO();
        CategoryDAO cateDAO = new CategoryDAO();
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                Job job = new Job();
                job.setJobId(rs.getInt("jobId"));
                job.setExperience(rs.getString("experience"));
                job.setJobTitle(rs.getString("jobTitle"));
                job.setJobDescription(rs.getString("jobDescription"));
                job.setRequirements(rs.getString("requirements"));
                job.setPosition(rs.getString("position"));
                job.setSkills(rs.getString("skills"));
                job.setNumberOfSeeker(rs.getInt("numberOfSeeker"));
                job.setSalary(rs.getFloat("salary"));
                job.setCompany(comDAO.getCompanybyId(rs.getInt("companyId")));
                job.setRecruiter(reDAO.getRecruiterbyId(rs.getInt("recruiterId")));
                job.setCategory(cateDAO.getCategorybyId(rs.getInt("categoryId")));
                list.add(job);
            }
        } catch (SQLException e) {
            System.out.println("ngu");
        }
        return list;
    }

    public int countByCategoryId(int id) {
        String sql = "SELECT COUNT(*) \n"
                + "FROM Job j\n"
                + "JOIN Category c ON j.categoryId = c.categoryId\n"
                + "WHERE j.categoryId = ?";
        int cnt = 0;
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, id);
            ResultSet rs = pre.executeQuery();
            if (rs.next()) {
                cnt = rs.getInt(1);
            }
            return cnt;
        } catch (SQLException e) {
            System.out.println("ngu");
        }
        return cnt;
    }

    public int countChart(int recruiterId, int categoryid) {
        String sql = "select count(*) from job where recruiterId=? and categoryId=?";
        int cnt = 0;
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, recruiterId);
            pre.setInt(2, categoryid);
            ResultSet rs= pre.executeQuery();
            if (rs.next()) {
                cnt = rs.getInt(1);
            }
            return cnt ;
        }catch (SQLException e) {
            System.out.println(e);
        }
        return cnt ;
    }

    public ArrayList<Job> getByCategory(int id) {
        ArrayList<Job> list = new ArrayList<>();
        String sql = "select * from Job  where categoryId=?";
        CompanyDAO comDAO = new CompanyDAO();
        RecruiterDAO reDAO = new RecruiterDAO();
        CategoryDAO cateDAO = new CategoryDAO();
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, id);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                Job job = new Job();
                job.setJobId(rs.getInt("jobId"));
                job.setExperience(rs.getString("experience"));
                job.setJobTitle(rs.getString("jobTitle"));
                job.setJobDescription(rs.getString("jobDescription"));
                job.setRequirements(rs.getString("requirements"));
                job.setPosition(rs.getString("position"));
                job.setSkills(rs.getString("skills"));
                job.setNumberOfSeeker(rs.getInt("numberOfSeeker"));
                job.setSalary(rs.getFloat("salary"));
                job.setCompany(comDAO.getCompanybyId(rs.getInt("companyId")));
                job.setRecruiter(reDAO.getRecruiterbyId(rs.getInt("recruiterId")));
                job.setCategory(cateDAO.getCategorybyId(rs.getInt("categoryId")));
                list.add(job);
            }
        } catch (SQLException e) {
            System.out.println("ngu");
        }
        return list;
    }

    public Job getById(int id) {
        String sql = "select * from Job where jobId=?";
        CompanyDAO comDAO = new CompanyDAO();
        RecruiterDAO reDAO = new RecruiterDAO();
        CategoryDAO cateDAO = new CategoryDAO();
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, id);
            ResultSet rs = pre.executeQuery();
            Job job = new Job();
            if (rs.next()) {
                job.setJobId(rs.getInt("jobId"));
                job.setExperience(rs.getString("experience"));
                job.setJobTitle(rs.getString("jobTitle"));
                job.setJobDescription(rs.getString("jobDescription"));
                job.setRequirements(rs.getString("requirements"));
                job.setPosition(rs.getString("position"));
                job.setSkills(rs.getString("skills"));
                job.setNumberOfSeeker(rs.getInt("numberOfSeeker"));
                job.setSalary(rs.getFloat("salary"));
                job.setCompany(comDAO.getCompanybyId(rs.getInt("companyId")));
                job.setRecruiter(reDAO.getRecruiterbyId(rs.getInt("recruiterId")));
                job.setCategory(cateDAO.getCategorybyId(rs.getInt("categoryId")));
            }
            return job;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public ArrayList<Job> getByRecruiter(int recruiterId) {
        ArrayList<Job> list = new ArrayList<>();
        String sql = "select * from Job where recruiterId =? ";
        CompanyDAO comDAO = new CompanyDAO();
        RecruiterDAO reDAO = new RecruiterDAO();
        CategoryDAO cateDAO = new CategoryDAO();
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, recruiterId);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                Job job = new Job();
                job.setJobId(rs.getInt("jobId"));
                job.setExperience(rs.getString("experience"));
                job.setJobTitle(rs.getString("jobTitle"));
                job.setJobDescription(rs.getString("jobDescription"));
                job.setRequirements(rs.getString("requirements"));
                job.setPosition(rs.getString("position"));
                job.setSkills(rs.getString("skills"));
                job.setNumberOfSeeker(rs.getInt("numberOfSeeker"));
                job.setSalary(rs.getFloat("salary"));
                job.setCompany(comDAO.getCompanybyId(rs.getInt("companyId")));
                job.setRecruiter(reDAO.getRecruiterbyId(rs.getInt("recruiterId")));
                job.setCategory(cateDAO.getCategorybyId(rs.getInt("categoryId")));
                list.add(job);
            }
        } catch (SQLException e) {
            System.out.println("ngu");
        }
        return list;
    }

    public void delete(Job job) {
        String sql = "DELETE FROM [dbo].[Job]\n"
                + "      WHERE jobId=?";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, job.getJobId());
            pre.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    
    public ArrayList<Job> listRelate(int jobId, int categoryId){
        String sql ="select * from Job where categoryId =? and jobId != ?";
        ArrayList<Job> list= new ArrayList<>();
        CompanyDAO comDAO = new CompanyDAO();
        RecruiterDAO reDAO = new RecruiterDAO();
        CategoryDAO cateDAO = new CategoryDAO();
        try{
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(2, jobId);
            pre.setInt(1, categoryId);
            ResultSet rs= pre.executeQuery();
            while(rs.next()){
                Job job = new Job();
                job.setJobId(rs.getInt("jobId"));
                job.setExperience(rs.getString("experience"));
                job.setJobTitle(rs.getString("jobTitle"));
                job.setJobDescription(rs.getString("jobDescription"));
                job.setRequirements(rs.getString("requirements"));
                job.setPosition(rs.getString("position"));
                job.setSkills(rs.getString("skills"));
                job.setNumberOfSeeker(rs.getInt("numberOfSeeker"));
                job.setSalary(rs.getFloat("salary"));
                job.setCompany(comDAO.getCompanybyId(rs.getInt("companyId")));
                job.setRecruiter(reDAO.getRecruiterbyId(rs.getInt("recruiterId")));
                job.setCategory(cateDAO.getCategorybyId(rs.getInt("categoryId")));
                list.add(job);
            }
            return list ;
        }catch(SQLException e){
            System.out.println(e);
        }
        return list ;
    }
    
    public void update(Job job, int jobId) {
        String sql = "UPDATE [dbo].[Job]\n"
                + "   SET \n"
                + "       [jobTitle] = ?\n"
                + "      ,[jobDescription] = ?\n"
                + "      ,[requirements] = ?\n"
                + "      ,[position] =?\n"
                + "      ,[experience] = ?\n"
                + "      ,[skills] = ?\n"
                + "      ,[numberOfSeeker] =?\n"
                + "      ,[salary] = ?\n"
                + " WHERE jobId=?";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setString(1, job.getJobTitle());
            pre.setString(2, job.getJobDescription());
            pre.setString(3, job.getRequirements());
            pre.setString(4, job.getPosition());
            pre.setString(5, job.getExperience());
            pre.setString(6, job.getSkills());
            pre.setInt(7, job.getNumberOfSeeker());
            pre.setFloat(8, job.getSalary());
            pre.setInt(9, jobId);
            pre.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void insert(Job job) {
        String sql = "INSERT INTO [dbo].[Job]\n"
                + "           ([companyId]\n"
                + "           ,[recruiterId]\n"
                + "           ,[categoryId]\n"
                + "           ,[jobTitle]\n"
                + "           ,[jobDescription]\n"
                + "           ,[requirements]\n"
                + "           ,[position]\n"
                + "           ,[experience]\n"
                + "           ,[skills]\n"
                + "           ,[numberOfSeeker]\n"
                + "           ,[salary])\n"
                + "     VALUES\n"
                + "           (?,?,?,?,?,?,?,?,?,?,?)";

        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, job.getCompany().getCompanyId());
            pre.setInt(2, job.getRecruiter().getRecruiterId());
            pre.setInt(3, job.getCategory().getCategoryId());
            pre.setString(4, job.getJobTitle());
            pre.setString(5, job.getJobDescription());
            pre.setString(6, job.getRequirements());
            pre.setString(7, job.getPosition());
            pre.setString(8, job.getExperience());
            pre.setString(9, job.getSkills());
            pre.setInt(10, job.getNumberOfSeeker());
            pre.setFloat(11, job.getSalary());
            pre.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
//      public static void main(String[] args){
//        JobDAO f = new JobDAO();
//        ArrayList<Job> d = f.getAll();
//        for(Job c: d){
//            System.out.println(c.getExperience());
//        }
//    }
}
