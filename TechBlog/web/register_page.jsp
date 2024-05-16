<%-- 
    Document   : register_page
    Created on : 29-Sept-2023, 3:41:13 pm
    Author     : piyush
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Page</title>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css">
    </head>
    <body>

        <%@include file="navbar.jsp"%>
        <div class="p-5 mb-4 primary-background banner-background">
            <div class="conatiner"  style="padding-bottom: 50px;">
                 <div class="row">
                <div class="col-md-4 offset-md-4">
                    <div class="card">
                        <div class="card-header text-center primary-background text-white">
                            <span class="fa fa-user-plus fa-3x"></span>
                            <br>
                            Register here
                        </div>
                        <div class="card-body">
                            <form action="RegisterServlet" method="POST" id="regform">
                                <div class="mb-3">
                                    <label for="exampleInputUser" class="form-label">User Name</label>
                                    <input required type="text" name="user_name" class="form-control" id="exampleInputUser" aria-describedby="emailHelp">
                                </div>
                                <div class="mb-3">
                                    <label for="exampleInputEmail1" class="form-label">Email address</label>
                                    <input required type="email" name="user_email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
                                    <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
                                </div>
                                <div class="mb-3">
                                    <label for="exampleInputPassword1" class="form-label">Password</label>
                                    <input required type="password" name="user_password" class="form-control" id="exampleInputPassword1">
                                </div>
                                <div class="mb-3">
                                    <label for="exampleInputGender" class="form-label">Gender</label>
                                    <br>
                                    Male <input required type="radio" value="Male" name="gender" id="exampleInputGender">
                                    Female <input required type="radio" value="Female" name="gender" id="exampleInputGender">
                                </div>
                                <div class="mb-3">
                                    <label for="exampleInputAbout" class="form-label"></label>
                                    <textarea name="about" class="form-control" id="exampleInputAbout" rows="5" placeholder="Tell me about yourself..."></textarea>
                                </div>
                                <div class="mb-3 form-check">
                                    <input name="check" type="checkbox" class="form-check-input" id="exampleCheck1">
                                    <label class="form-check-label" for="exampleCheck1">Accept Terms and Condition</label>
                                </div>
                                <div class="container text-center" style="display:none;" id="loader">
                                    <div class="spinner-border text-success" role="status"></div>
                                    <br>
                                    <span>Loading...</span>
                                </div>
                                <div class="container text-center">
                                    <button id="submit-btn" type="submit" class="btn btn-primary">Submit</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <!--Javascript-->

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

    <script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
    <script src="js/operation.js" type="text/javascript"></script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>



    <script>
        $(document).ready(function () {
//            console.log("started..");
            $('#regform').on('submit', function (event) {

                event.preventDefault();
                let form = new FormData(this);
                $('#loader').show();
                $('#submit-btn').hide();
                $.ajax({
                    url: "RegisterServlet",
                    type: "POST",
                    data: form,
                    success: function (data, textstatus, jqXHR) {
                        console.log(data);
                        $('#loader').hide();
                        $('#submit-btn').show();

                        if (data.trim() === "done")
                        {

                            Swal.fire({
                                text: 'Register Successfully...',
                                showClass: {
                                    popup: 'animate__animated animate__fadeInDown'
                                },
                                hideClass: {
                                    popup: 'animate__animated animate__fadeOutUp'
                                }
                            }).then((value) => {
                                window.location = "login_page.jsp";
                            });

                        } else
                        {
                            Swal.fire({
                                icon: 'error',
                                title: 'Something went wrong!',
                                text: data
                            });

                        }

                    },
                    error: function (jqXHR, textstatus, errorThrown) {

                        console.log(jqXHR);
                        $('#loader').hide();
                        $('#submit-btn').show();
                        Swal.fire({
                            icon: 'error',
                            title: 'Something went wrong!',
                            text: data
                        });
                    },
                    processData: false,
                    contentType: false

                });
            });
        });
    </script>
</body>
</html>
