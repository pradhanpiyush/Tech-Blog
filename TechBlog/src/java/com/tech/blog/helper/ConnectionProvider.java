/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tech.blog.helper;

import java.sql.*;


/**
 *
 * @author piyush
 */
public class ConnectionProvider {
    
    private static Connection con;
    
    public static Connection getConnection(){
        
        try{
            // Driver class load
           
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            // establish connection
            
            String url="jdbc:mysql://localhost:3306/tech_blog";
            String user = "root";
            String password = "Name@622";
            con = DriverManager.getConnection(url,user,password);
            
        }
        catch(ClassNotFoundException | SQLException e)
        {
           System.out.println(e.getMessage());
        }
        return con;
    }
}
