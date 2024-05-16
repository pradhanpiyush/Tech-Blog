<%--
    Document   : index
    Created on : 28-Sept-2023, 7:10:59 pm
    Author     : piyush
--%>

<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <body>
        <%@include file="navbar.jsp" %>

        <div class="p-5 mb-4 primary-background banner-background">
            <div class="container-fluid">
                <div class="container text-white">
                    <h1 class="display-5">Welcome To My Tech World</h1>
                    <p class="col-md-8 fs-8">Technology is the application of knowledge for achieving practical goals in a reproducible way.The word technology can also mean the products resulting from such efforts.</p>
                    <p class="col-md-8 fs-8">including both tangible tools such as utensils or machines, and intangible ones such as software Technology plays a critical role in science, engineering, and everyday life.</p>
                    <a href="register_page.jsp" class="btn btn-outline-light"><span class="fa fa-sign-in"></span> Start ! Its Free</a>
                    <a href="login_page.jsp" class="btn btn-outline-light"><span class="fa fa-user-circle fa-spin"></span> Login</a>
                </div>
            </div>
        </div>

        <div class="container">
            <div class="row mb-3">
                <div class="col-md-4">
                    <div class="card w-80">
                        <div class="card-body">
                            <h5 class="card-title">Python Programming</h5>
                            <p class="card-text">Before getting started, you may want to find out which IDEs and text editors are tailored to make Python editing easy.</p>
                            <a href="#" class="btn btn-outline-primary">Button</a>
                        </div>
                    </div>
                </div>
                  <div class="col-md-4">
                    <div class="card w-80">
                        <div class="card-body">
                            <h5 class="card-title">Python Programming</h5>
                            <p class="card-text">Before getting started, you may want to find out which IDEs and text editors are tailored to make Python editing easy.</p>
                            <a href="#" class="btn btn-outline-primary">Button</a>
                        </div>
                    </div>
                </div>
                  <div class="col-md-4">
                    <div class="card w-80">
                        <div class="card-body">
                            <h5 class="card-title">Python Programming</h5>
                            <p class="card-text">Before getting started, you may want to find out which IDEs and text editors are tailored to make Python editing easy.</p>
                            <a href="#" class="btn btn-outline-primary">Button</a>
                        </div>
                    </div>
                </div>
            </div>
              <div class="row mb-3">
                <div class="col-md-4">
                    <div class="card w-80">
                        <div class="card-body">
                            <h5 class="card-title">Python Programming</h5>
                            <p class="card-text">Before getting started, you may want to find out which IDEs and text editors are tailored to make Python editing easy.</p>
                            <a href="#" class="btn btn-outline-primary">Button</a>
                        </div>
                    </div>
                </div>
                  <div class="col-md-4">
                    <div class="card w-80">
                        <div class="card-body">
                            <h5 class="card-title">Python Programming</h5>
                            <p class="card-text">Before getting started, you may want to find out which IDEs and text editors are tailored to make Python editing easy.</p>
                            <a href="#" class="btn btn-outline-primary">Button</a>
                        </div>
                    </div>
                </div>
                  <div class="col-md-4">
                    <div class="card w-80">
                        <div class="card-body">
                            <h5 class="card-title">Python Programming</h5>
                            <p class="card-text">Before getting started, you may want to find out which IDEs and text editors are tailored to make Python editing easy.</p>
                            <a href="#" class="btn btn-outline-primary">Button</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!--Javascript-->

       <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
       
        <script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
        <script src="js/operation.js" type="text/javascript"></script>
    </body>
</html>
