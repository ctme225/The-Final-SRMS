<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*, org.springframework.web.context.WebApplicationContext,
org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en" dir="ltr">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<meta name="viewport" content="width=device-width, initial-scale=1">
        <title>
            Navbar
        </title>
        <link rel="stylesheet" href="resources\css\animate.css"/>
        <link rel="stylesheet" href="resources\css\bootstrap.css"/>
        <link rel="stylesheet" href="resources\css\all.css"/>
    </head>
    <body>
        <div id="wrapper" class="animate">
            <nav id= "navigation" class="navbar header-top fixed-top navbar-expand-lg  navbar-dark ">
                <span id="hamBurgerMenu" class="navbar-toggler-icon light leftmenutrigger" ></span>
                <a class="navbar-brand" style = "display: inline-block;" href="home"><img src="resources/images/book-logo.png" alt="logo" style="height:25%; width:25%; margin-bottom:0px; "/></a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarText" aria-controls="navbarText"
                    aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarText">
                    <ul class="navbar-nav animate side-nav" id="ulSideNav">
                        <li class="nav-item">
                            <a class="nav-link" href=util>Reports</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href=reserve>View Reservations</a>
                        </li>
						<li class="nav-item">
                            <a class="nav-link" href=usernotadmin>Add Location</a>
                        </li>
                    </ul>
                    <div class="navbar-nav ml-md-auto d-md-flex">
	                	<small id="myloco" class= "text-light mt-2">${myLocation}</small>
	                    <ul class="navbar-nav ml-md-auto d-md-flex ">
	                        <li class="nav-item" id="show-op">
	                            <a class="nav-link" href=user>User Options</a>
	                        </li>
	                        <li class="nav-item" id="show-op">
	                            <a class="nav-link" href=logout>Logout</a>
	                        </li>
	                        <li class="nav-item" id="dropdown">
	                            <div class="dropdown">
	                                <a class="nav-link dropdown-toggle" style="margin-left: 100px;" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" href="#"><i class = "fa fa-user-circle" style = "font-size: 24px;"></i></a>
	                                <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
	                                    <a class="dropdown-item" href=usernotadmin>User Options</a>
	                                    <a class="dropdown-item" href="logout">Logout</a>
	                                </div>
	                            </div>
	                        </li>
	                    </ul>
	                </div>
	                <div class = "text-light nav-item" style = "float: right" >${myUser}</div>
                </div>
            </nav>
        </div>
        
        <script src="resources/js/jquerylib.js"></script>
        <script src="resources/js/bootstrap.js"></script>
        <script src="resources/js/popper1.js"></script>

        </script>
    </body>
</html>