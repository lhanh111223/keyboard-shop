<%-- 
    Document   : SettingProfile
    Created on : Jun 7, 2023, 1:57:02 AM
    Author     : Hoang Anh
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<head>
    <title>Bootstrap Example</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>

<body>
    <hr>
    <div class="container bootstrap snippet">
        <div class="row">
            <div class="col-sm-10"><h1>${acc.fullname}</h1></div>
            <div class="col-sm-2"><a href="index" class="pull-right"><img title="profile image" class="img-responsive" src="./img/logo1.png"></a></div>
        </div>
        <!--Form edit-->
        <div class="row">

            <div class="col-sm-3"><!--left col-->

                <div class="text-center">
                    <img src="${acc.avatar}" class="avatar img-circle img-thumbnail" alt="avatar">
                    <h6>Upload a different photo...</h6>
                    
                </div></hr><br>


                <div class="panel panel-default">
                    <div class="panel-heading text-success ">${requestScope.mess} <i class="fa fa-link fa-1x"></i></div>
                </div>


                <ul class="list-group">
                    <li class="list-group-item text-muted">Activity <i class="fa fa-dashboard fa-1x"></i></li>
                    <li class="list-group-item text-right"><span class="pull-left"><strong>Shares</strong></span> 125</li>
                    <li class="list-group-item text-right"><span class="pull-left"><strong>Likes</strong></span> 13</li>
                    <li class="list-group-item text-right"><span class="pull-left"><strong>Posts</strong></span> 37</li>
                    <li class="list-group-item text-right"><span class="pull-left"><strong>Followers</strong></span> 78</li>
                </ul> 



            </div><!--/col-3-->



            <div class="col-sm-9">
                <form action="editprofile" method="post" id="f">
                    
                    <ul class="nav nav-tabs">
                        <li class="active"><a data-toggle="tab" href="#home">Edit Profile</a></li>
                    </ul>


                    <div class="tab-content">
                        <div class="tab-pane active" id="home">
                            <hr>
                            
                            <div class="form-group">

                                <div class="col-xs-12">
                                    <label for="first_name"><h4>Avatar URL</h4></label>
                                    <input type="text" class="form-control" name="avatar" value="${acc.avatar}" placeholder="url">
                                </div>
                            </div>
                            
                            <div class="form-group">

                                <div class="col-xs-6">
                                    <label for="first_name"><h4>Full name</h4></label>
                                    <input type="text" class="form-control" name="fullname" value="${acc.fullname}" placeholder="full name">
                                </div>
                            </div>
                            <div class="form-group">

                                <div class="col-xs-6">
                                    <label for="email"><h4>Email</h4></label>
                                    <input type="email" class="form-control" name="email" value="${acc.email}" placeholder="you@email.com" >
                                </div>
                            </div>

                            <div class="form-group">

                                <div class="col-xs-6">
                                    <label for="phone"><h4>Phone</h4></label>
                                    <input type="text" class="form-control" name="phone" value="${acc.phone}" placeholder="enter phone" >
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="col-xs-6">
                                    <label for="mobile"><h4>Username</h4></label>
                                    <input type="text" class="form-control" name="username" id="mobile" value="${acc.username}" readonly >
                                </div>
                            </div>




                            <div class="form-group">
                                <div class="col-xs-12">
                                    <br>
                                    <button class="btn btn-lg btn-success" type="submit"><i class="glyphicon glyphicon-ok-sign"></i> Save</button>
                                    <button onclick="resetForm()" class="btn btn-lg" type="reset"><i class="glyphicon glyphicon-repeat"></i> Reset</button>
                                </div>
                            </div>

                            <hr>

                        </div><!--/tab-pane-->



                    </div><!--/tab-pane-->
                </form>
            </div><!--/tab-content-->

        </div><!--/col-9-->

    </div><!--/row-->

    <script type="text/javascript">
        function resetForm() {
            let f = document.getElementById("f");
            f.reset();
        }
    </script>

</body>

