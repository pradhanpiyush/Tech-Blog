/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tech.blog.dao;

import com.tech.blog.entities.UserTable;
import java.sql.*;

/**
 *
 * @author piyush
 */
public class UserDao {
    
    Connection con;
    
    public UserDao(Connection con) {
        this.con = con;
    }

//Insert data
    /**
     *
     * @param user
     * @return
     */
    public boolean saveUserData(UserTable user) {
        boolean f = false;
        try {
            
            String q = "insert into user(name,email,password,gender,about) values(?,?,?,?,?)";
            
            PreparedStatement pstmt = this.con.prepareStatement(q);
            
            pstmt.setString(1, user.getName());
            pstmt.setString(2, user.getEmail());
            pstmt.setString(3, user.getPassword());
            pstmt.setString(4, user.getGender());
            pstmt.setString(5, user.getAbout());
            
            pstmt.executeUpdate();
            f = true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return f;
    }

//Get user data
    /**
     *
     * @param email
     * @param password
     * @return
     */
    public UserTable getUserEmailAndPaswword(String email, String password) {
        
        UserTable user = null;
        try {
            String q = "select * from user where email=? and password=?";
            
            PreparedStatement pstmt = this.con.prepareStatement(q);
            
            pstmt.setString(1, email);
            pstmt.setString(2, password);
            
            ResultSet rs = pstmt.executeQuery();
            
            if (rs.next()) {
                user = new UserTable();
                
                user.setId(rs.getInt("id"));
                user.setName(rs.getString("name"));
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
                user.setGender(rs.getString("gender"));
                user.setAbout(rs.getString("about"));
                user.setDatetime(rs.getTimestamp("rdate"));
                user.setProfile(rs.getString("profile"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }
    
    public boolean updateUserData(UserTable user) {
        
        boolean f = false;
        
        try {
            String q = "update user set name=? , email=? , password=? , about=?, gender=?, profile=? where id = ?";
            
            PreparedStatement pstmt = con.prepareStatement(q);
            
            pstmt.setString(1, user.getName());
            pstmt.setString(2, user.getEmail());
            pstmt.setString(3, user.getPassword());
            pstmt.setString(4, user.getAbout());
            pstmt.setString(5, user.getGender());
            pstmt.setString(6, user.getProfile());
            pstmt.setInt(7, user.getId());
            
            pstmt.executeUpdate();
            
            f = true;
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return f;
    }
    
    public UserTable getUserByUserID(int user_id) {
        UserTable user = null;
        
        try {
            
            String q = "select * from user where id = ?";
            
            PreparedStatement pstmt = con.prepareStatement(q);
            
            pstmt.setInt(1,user_id);
            
            ResultSet rs = pstmt.executeQuery();
            
            if (rs.next()) {
                
                user = new UserTable();
                
                user.setId(rs.getInt("id"));
                user.setName(rs.getString("name"));
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
                user.setGender(rs.getString("gender"));
                user.setAbout(rs.getString("about"));
                user.setDatetime(rs.getTimestamp("rdate"));
                user.setProfile(rs.getString("profile"));
                
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return user;
    }
    
}
