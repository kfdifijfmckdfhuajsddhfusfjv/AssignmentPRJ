/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Model.Category;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Administrator
 */
public class CategoryDAO extends DBContext {

    public ArrayList<Category> getAll() {
        ArrayList<Category> list = new ArrayList<>();
        String sql = "select * from Category";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                Category c = new Category(rs.getInt("categoryId"), rs.getString("categoryName"));
                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println("ngu");
        }
        return list;
    }
   public Category getCategorybyId(int id){
        ArrayList<Category> list = getAll();
        for(Category category : list){
            if(category.getCategoryId()== id){
                return category;
            }
        }
        return null ;
    }
   
   
}
