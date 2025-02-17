/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Model.Category;
import Model.Recruiter;
import Model.Users;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Administrator
 */
public class RecruiterDAO extends DBContext{
    public ArrayList<Recruiter> getAll() {
        ArrayList<Recruiter> list = new ArrayList<>();
        CompanyDAO comDAO = new CompanyDAO();
        UserDAO userDAO = new UserDAO();
        String sql = "select * from Recruiter";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                Recruiter recruiter = new Recruiter(rs.getInt("recruiterId"),userDAO.getUserbyId(rs.getInt("userId")), 
                        comDAO.getCompanybyId(rs.getInt("companyId")),rs.getString("position"));
                list.add(recruiter);
            }
        } catch (SQLException e) {
            System.out.println("ngu");
        }
        return list;
    }
    public Recruiter getRecruiterbyId(int id){
        ArrayList<Recruiter> list = getAll();
        for(Recruiter recruiter: list){
            if(recruiter.getRecruiterId()== id){
                return recruiter;
            }
        }
        return null ;
    }
    public Recruiter getbyUserId(int id){
        ArrayList<Recruiter> list = getAll();
        for(Recruiter recruiter: list){
            if(recruiter.getUser().getUserId()== id){
                return recruiter;
            }
        }
        return null ;
    }

   
   
}
