<%-- 
    Document   : error_page
    Created on : 30-Sept-2023, 6:51:27 pm
    Author     : piyush
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isErrorPage="true"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Error Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <body>

        <div class="container text-center">
            <img src="img/warning.png" alt="error"/>
            <h2 class="display-3">Sorry ! Something went wrong...</h2>
            <p><%= exception %></p>
            <a href="index.jsp" class="btn btn-outline-danger">Home</a>    
        </div>


    </body>
</html>
