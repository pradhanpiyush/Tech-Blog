/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tech.blog.dao;

import java.sql.*;

/**
 *
 * @author piyush
 */
public class LikedDao {

    private  Connection con;

    public LikedDao(Connection con) {
        this.con = con;
    }

    public boolean insertLike(int pid, int uid) {
        boolean f = false;

        try {

            String q = "insert into liked(pid,uid) values(?,?)";

            PreparedStatement pstmt = con.prepareStatement(q);

            pstmt.setInt(1, pid);
            pstmt.setInt(2, uid);

            pstmt.executeUpdate();

            f = true;

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return f;
    }

    public int countLikeOnPost(int pid) {
        int count = 0;

        try {
            String q = "select count(lid) from liked where pid = ?";

            PreparedStatement pstmt = con.prepareStatement(q);

            pstmt.setInt(1, pid);

            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                count = rs.getInt("count(lid)");
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return count;
    }

    public boolean isLikedByUser(int pid, int uid) {
        boolean f = false;
        try {

            PreparedStatement pstmt = con.prepareStatement("select * from liked where pid=? and uid=?");

            pstmt.setInt(1, pid);
            pstmt.setInt(2, uid);

            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                f = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;

    }

    public boolean dislikedByUser(int pid, int uid) {
        boolean f = false;

        try {
            PreparedStatement pstmt = con.prepareStatement("Delete from liked where pid=? and uid=?");

            pstmt.setInt(1, pid);
            pstmt.setInt(2, uid);

            pstmt.executeUpdate();

            f = true;

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return f;
    }

}
