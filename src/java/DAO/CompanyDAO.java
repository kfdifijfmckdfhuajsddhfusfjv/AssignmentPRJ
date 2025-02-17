/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Model.Category;
import Model.Company;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Administrator
 */
public class CompanyDAO extends DBContext {

    public CompanyDAO() {
    }

    public ArrayList<Company> getAll() {
        ArrayList<Company> list = new ArrayList<>();
        String sql = "select * from Company";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                Company company = new Company(rs.getInt("companyId"), rs.getString("companyName"), rs.getString("city"), rs.getString("district"), rs.getString("address"),
                        rs.getString("location"), rs.getString("phone"), rs.getString("email"), rs.getString("website"), rs.getString("logoCompany"));
                list.add(company);
            }
        } catch (SQLException e) {
            System.out.println("ngu");
        }
        return list;
    }

    public Company getCompanybyId(int id) {
        ArrayList<Company> list = getAll();
        for (Company company : list) {
            if (company.getCompanyId() == id) {
                return company;
            }
        }
        return null;
    }

    public ArrayList<String> getAllCity() {
        ArrayList<String> list = new ArrayList<>();
        String sql = "select distinct city from Company";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                list.add(rs.getString("city")); 
            }
        } catch (SQLException e) {
            System.out.println("ngu111");
        }
        return list;
    }

//    public static void main(String[] args) {
//        CompanyDAO f = new CompanyDAO();
//        ArrayList<String> d = f.getAllCity();
//        for (String c : d) {
//            System.out.println(c);
//        }
//    }
}
