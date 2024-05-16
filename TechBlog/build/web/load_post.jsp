<%@page import="com.tech.blog.entities.UserTable"%>
<%@page import="com.tech.blog.dao.LikedDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.entities.Categorie"%>
<%@page import="java.util.List"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<script src="js/operation.js" type="text/javascript"></script>

<div class="row">

    <%
        UserTable  user = (UserTable)session.getAttribute("current_user");
        
        Thread.sleep(1000);
        PostDao pdao = new PostDao(ConnectionProvider.getConnection());
        List<Post> post = null;

        int cid = Integer.parseInt(request.getParameter("cid"));

        if (cid == 0) {
            post = pdao.getAllPost();
        } else {
            post = pdao.getPostCateid(cid);
        }

        if (post.size() == 0) {
            out.println("<h3 class='display-3 text-center'>No data related to category...</h3>");
        }

        for (Post p : post) {
    %>



    <div class="col-md-6 mt-4">

        <div class="card" style="max-width:23rem;">

            <img src="blog_pics/<%= p.getPpic()%>" class="card-img-top" alt="ppic">

            <div class="card-body">

                <b class="card-text">  <%= p.getPtitle()%></b>
                <br>
                <p class="card-text">    <%= p.getPcontent()%></p>

            </div>

            <div class="card-footer primary-background text-center">

                <%
                    LikedDao ldao = new LikedDao(ConnectionProvider.getConnection());
                   
                %>

                <a href="#" onclick="doLike(<%= p.getPid() %>,<%= user.getId() %>)" class="btn btn-outline-light btn-sm"><i class="fa fa-thumbs-o-up"></i> <span class="like-counter"><%= ldao.countLikeOnPost(p.getPid()) %></span></a>  

                <a href="show_post.jsp?post_id=<%= p.getPid()%>" class="btn btn-outline-light btn-sm">Read more</a>  

                <a href="#" class="btn btn-outline-light btn-sm"><i class="fa fa-commenting-o"></i><span> 20</span></a>  
            </div>
        </div>

    </div>

    <%
        }
    %>

</div>