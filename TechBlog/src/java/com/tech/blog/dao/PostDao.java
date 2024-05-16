/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tech.blog.dao;

import com.tech.blog.entities.Categorie;
import com.tech.blog.entities.Post;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author piyush
 */
public class PostDao {

    private Connection con;

    public PostDao(Connection con) {
        this.con = con;
    }

    public ArrayList<Categorie> getCategory() {
        ArrayList<Categorie> list = new ArrayList<>();
        try {
            String q = "select * from categories";
            Statement stmt = this.con.createStatement();
            ResultSet rs = stmt.executeQuery(q);

            while (rs.next()) {
                int cid = rs.getInt("cid");
                String name = rs.getString("cname");
                String description = rs.getString("cdescription");
                Categorie c = new Categorie(cid, name, description);
                list.add(c);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public boolean saveDao(Post post) {
        boolean f = false;
        try {
            String q = "insert into posts(ptitle,pcontent,pcode,ppic,cateid,userid) values(?,?,?,?,?,?)";

            PreparedStatement pstmt = con.prepareStatement(q);

            pstmt.setString(1, post.getPtitle());
            pstmt.setString(2, post.getPcontent());
            pstmt.setString(3, post.getPcode());
            pstmt.setString(4, post.getPpic());
            pstmt.setInt(5, post.getCateid());
            pstmt.setInt(6, post.getUserid());

            pstmt.executeUpdate();

            f = true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return f;
    }

    public List<Post> getAllPost() {
        List<Post> list = new ArrayList<>();
        try {
            String q = "Select * from Posts order by pid";
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(q);

            while (rs.next()) {
                int id = rs.getInt("pid");
                String title = rs.getString("ptitle");
                String content = rs.getString("pcontent");
                String code = rs.getString("pcode");
                String pic = rs.getString("ppic");
                Timestamp date = rs.getTimestamp("pdate");
                int cateid = rs.getInt("cateid");
                int userid = rs.getInt("userid");

                Post post = new Post(id, title, content, code, pic, date, cateid, userid);
                list.add(post);

            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }

    public List<Post> getPostCateid(int cateid) {
        List<Post> list = new ArrayList<>();
        try {
            PreparedStatement pstmt = con.prepareStatement("select * from Posts where cateid = ? order by pid");
            pstmt.setInt(1, cateid);

            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("pid");
                String title = rs.getString("ptitle");
                String content = rs.getString("pcontent");
                String code = rs.getString("pcode");
                String pic = rs.getString("ppic");
                Timestamp date = rs.getTimestamp("pdate");
                int userid = rs.getInt("userid");

                Post post = new Post(id, title, content, code, pic, date, cateid, userid);
                list.add(post);

            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public Post getPostByPid(int post_id) {

        Post post = null;
        try {

            String q = "select * from posts where pid = ?";

            PreparedStatement pstmt = con.prepareStatement(q);

            pstmt.setInt(1, post_id);

            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("pid");
                String title = rs.getString("ptitle");
                String content = rs.getString("pcontent");
                String code = rs.getString("pcode");
                String pic = rs.getString("ppic");
                Timestamp date = rs.getTimestamp("pdate");
                int cateid = rs.getInt("cateid");
                int userid = rs.getInt("userid");

                post = new Post(id, title, content, code, pic, date, cateid, userid);

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return post;
    }

}
