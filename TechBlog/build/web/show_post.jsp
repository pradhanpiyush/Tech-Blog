<%-- 
    Document   : show_post
    Created on : 07-Oct-2023, 4:13:00 pm
    Author     : piyush
--%>

<%@page import="com.tech.blog.dao.LikedDao"%>
<%@page import="com.tech.blog.dao.UserDao"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.entities.Categorie"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.entities.UserTable"%>

<%
    UserTable user = (UserTable) session.getAttribute("current_user");
    if (user == null) {
        response.sendRedirect("login_page.jsp");
    }
%>

<%
    int pid = Integer.parseInt(request.getParameter("post_id"));

    PostDao pdao = new PostDao(ConnectionProvider.getConnection());

    Post p = pdao.getPostByPid(pid);

%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%= p.getPtitle()%> | Tech Blog</title>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

        <style>

            body{
                background: url(img/bg.jpg);
                background-attachment: fixed;
                background-size: cover;
            }

            .p-title{
                font-weight : 100;
                font-size : 30px;
            }

            .p-content{
                font-weight:100;
                font-size:25px;
            }

            .p-code{

                font-size: 20px;

            }
            .user-name{
                font-weight: 200;
                text-decoration: none;
                font-size:18px;
            }
            .p-date{
                font-size:18px;
                font-weight:200;
            }


        </style>
    
</head>
<body>
    
    <div id="fb-root"></div>
<script async defer crossorigin="anonymous" src="https://connect.facebook.net/en_GB/sdk.js#xfbml=1&version=v18.0" nonce="x3ufxX7c"></script>

    <!--nav-bar-->
    <nav class="navbar navbar-expand-lg navbar-dark primary-background">
        <div class="container-fluid">
            <a class="navbar-brand" href="profile_page.jsp"><span class="fa fa-thumbs-o-up"></span> Tech Blog</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="index.jsp"><span class="fa fa-home"></span> Home</a>
                    </li>

                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            <span class="fa fa-level-down"></span> Categories
                        </a>
                        <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <li><a class="dropdown-item" href="#">Programming Language</a></li>
                            <li><a class="dropdown-item" href="#">Projects</a></li>
                            <li><hr class="dropdown-divider"></li>
                            <li><a class="dropdown-item" href="#">Data Structure</a></li>
                        </ul>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#"><span class="fa fa-address-book"></span> Contact</a>
                    </li>  
                    <li class="nav-item">
                        <a class="nav-link" href="#" data-bs-toggle="modal" data-bs-target="#post-Modal"><span class="fa fa fa-pencil-square"></span> Post</a>
                    </li>  
                </ul>
                <ul class="navbar-nav me-right">
                    <li class="nav-item">
                        <a class="nav-link" href="#!" data-bs-toggle="modal" data-bs-target="#profile_modal"><span class="fa fa-user-circle"> </span><%= user.getName()%></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="LogoutServlet"><span class="fa fa-user"> </span>Logout</a>
                    </li>

                </ul>
            </div>
        </div>
    </nav>



    <!--read-more card main-->

    <div class="container mt-4">

        <div class="row">

            <div class="col-md-6 offset-md-3">

                <div class="card">

                    <div class="card-header primary-background text-white">

                        <h4 class="p-title"><%= p.getPtitle()%></h4>

                    </div>

                    <div class="card-body">

                        <img src="blog_pics/<%= p.getPpic()%>" class="card-img-top my-3" alt="ppic">

                        <div class="row">
                            <div class="col-md-8">

                                <%
                                    UserDao udao = new UserDao(ConnectionProvider.getConnection());
                                %>

                                <p> <a class="user-name" href="#"><%= udao.getUserByUserID(p.getUserid()).getName()%></a> has posted : </p> 


                            </div>

                            <div class="col-md-4">

                                <p class="p-date"><%= DateFormat.getDateTimeInstance().format(p.getPdate())%>

                            </div>

                        </div>

                        <span></span>

                        <p class="p-content"> <%= p.getPcontent()%></p>

                        <div class="p-code">
                            <pre><%= p.getPcode()%></pre>
                        </div>

                    </div>

                    <div class="card-footer primary-background text-center">

                        <%
                            LikedDao ldao = new LikedDao(ConnectionProvider.getConnection());
                        %>

                        <a href="#!" onclick="doLike(<%= p.getPid()%>,<%= user.getId()%>)"  class="btn btn-outline-light btn-sm"><i class="fa fa-thumbs-o-up"></i> <span class="like-counter"><%= ldao.countLikeOnPost(pid)%></span></a>  

                        <a href="#!" class="btn btn-outline-light btn-sm"><i class="fa fa-commenting-o"></i> <span>20</span></a>  
                    </div>

                    <div class="card-footer">

                        <div class="fb-comments" data-href="http://localhost:8080/TechBlog/show_post.jsp?post_id=3" data-width="" data-numposts="5"></div>

                    </div>

                </div>

            </div>

        </div>


    </div>


    <!-- Profile Modal -->


    <div class="modal fade" id="profile_modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header primary-background">
                    <div class="container text-white">
                        <h4 class="modal-title text-center" id="exampleModalLabel">TECH BLOG</h4>
                    </div>
                    <button type="button" class="btn-close btn-light" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body text-center">
                    <img  class="img-fluid"  src="pics/<%= user.getProfile()%>" alt="alt" style="width:200px;clip-path: circle(38.2% at 50% 50%);"/>
                    <h5 class="display-9 mt-3"><%= user.getName()%></h5>
                    <div class="container mt-3">
                        <table class="table" id="profile_detail">
                            <tbody>
                                <tr>
                                    <th scope="row">ID : </th>
                                    <td><%= user.getId()%></td>

                                </tr>
                                <tr>
                                    <th scope="row">Email :</th>
                                    <td><%= user.getEmail()%></td>
                                </tr>
                                <tr>
                                    <th scope="row">Gender :</th>
                                    <td><%= user.getGender().toUpperCase()%></td>
                                </tr>
                                <tr>
                                    <th scope="row">About :</th>
                                    <td><%= user.getAbout()%></td>
                                </tr>
                                <tr>
                                    <th scope="row">Register Date :</th>
                                    <td><%= user.getDatetime().toString()%></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div id="edit_profile"  style="display:none;">
                        <h5>Edit Profile</h5>
                        <hr>
                        <form action="UpdateServlet" method="POST" enctype="multipart/form-data">
                            <table class="table">
                                <tr>
                                    <td>ID :</td>
                                    <td><%= user.getId()%></td>
                                </tr>
                                <tr>
                                    <td>Name :</td>
                                    <td><input type="text" class="form-control" name="user_name" value="<%= user.getName()%>"></td>
                                </tr>
                                <tr>
                                    <td>Email :</td>
                                    <td><input type="email" class="form-control" name="user_email" value="<%= user.getEmail()%>"></td>
                                </tr>
                                <tr>
                                    <td>Password :</td>
                                    <td><input type="password" class="form-control" name="user_password" value="<%= user.getPassword()%>"></td>
                                </tr>
                                <tr>
                                    <td>Gender :</td>
                                    <td><%= user.getGender().toUpperCase()%></td>
                                </tr>
                                <tr>
                                    <td>About :</td>
                                    <td><textarea name="user_about" rows="4" class="form-control"><%= user.getAbout()%></textarea></td>
                                </tr>
                                <tr>
                                    <td>Upload Image:</td>
                                    <td><input type="file" class="form-control" name="user_profile" accept="image/jpeg,image/jpg,image/png"></td>
                                </tr>
                            </table>
                            <div class="container">
                                <button type="submit" class="btn btn-primary">Save</button>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="button" id="edit_button" class="btn primary-background text-white">EDIT</button>
                </div>
            </div>
        </div>
    </div>


    <!--Post modal-->

    <!-- Modal -->
    <div class="modal fade" id="post-Modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header primary-background">
                    <div class="container text-center text-white">
                        <h1 class="modal-title fs-5" id="exampleModalLabel">Post</h1>
                    </div>
                    <button type="button" class="btn-close btn-light" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form action="AddPostServlet" method="POST" id="add-post-form">
                        <div class="mb-3">
                            <select class="form-select" aria-label="Default select example" name="c-id">
                                <option selected disabled>--select option--</option>
                                <%
                                    ArrayList<Categorie> list = pdao.getCategory();
                                    for (Categorie c : list) {
                                %>
                                <option value="<%= c.getCid()%>"><%= c.getName()%></option>
                                <%
                                    }
                                %>
                            </select>
                        </div>
                        <div class="mb-3">
                            <input type="text" class="form-control"  name="p-title" placeholder="Title">
                        </div>
                        <div class="mb-3">
                            <textarea style="height:200px;" name="p-content"  class="form-control" placeholder="Content"></textarea> 
                        </div>
                        <div class="mb-3">
                            <textarea style="height:200px;" name="p-code" class="form-control" placeholder="Code"></textarea> 
                        </div>
                        <div class="mb-3">
                            <label>Select Pic : </label>
                            <input type="file" class="form-control" name="p-pic">
                        </div>

                        <div class="container text-center ">

                            <button type="submit" class="btn btn-primary">Post</button>

                        </div>

                    </form>
                </div>

            </div>
        </div>
    </div>



    <!--Java script-->

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

    <script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>



    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>

    <script src="js/operation.js" type="text/javascript"></script>

    <!--profile edit and back-->

    <script>

                            $(document).ready(function () {

                                let editstatus = false;
                                $('#edit_button').click(function () {

                                    if (editstatus === false)
                                    {

                                        $("#profile_detail").hide();
                                        $("#edit_profile").show();
                                        editstatus = true;
                                        $(this).text("Back");
                                    } else
                                    {

                                        $("#profile_detail").show();
                                        $("#edit_profile").hide();
                                        editstatus = false;
                                        $(this).text("Edit");
                                    }

                                });
                            });
    </script>


    <!--add post data java script-->


    <script>
        $(document).ready(function (e) {
            //            console.log("started..");
            $('#add-post-form').on('submit', function (event) {

                event.preventDefault();
                //                console.log("started..");
                let form = new FormData(this);

                $.ajax({
                    url: "AddPostServlet",
                    type: "POST",
                    data: form,
                    success: function (data, textstatus, jqXHR) {

                        console.log(data);
                        if (data.trim() === "done")
                        {
                            swal("Good job!", "Successfully Save", "success")
                                    .then((value) => {
                                        window.location = "profile_page.jsp";
                                    });
                        } else
                        {
                            swal("Something went wrong!");

                        }

                    },
                    error: function (jqXHR, textstatus, errorThrown) {

                        console.log(jqXHR);
                        swal("Something went wrong!");


                    },
                    processData: false,
                    contentType: false

                });
            });
        });
    </script>


</body>
</html>
