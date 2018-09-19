<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*, org.springframework.web.context.WebApplicationContext,
org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
    

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
    	
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<link rel="stylesheet" href = "resources/css/bootstrap.css"/>
	<link rel="stylesheet" href = "resources/css/bootstrap.min.css"/>
	<link rel="stylesheet" href = "resources/css/animate.css"/>
	<link rel="stylesheet" href = "resources/css/all.css"/>
	<link rel="stylesheet" href = "resources/css/login.css"/>
	<link rel="stylesheet" href = "resources/css/mycss.css"/>
	<link rel="stylesheet" href = "resources/js/bootstrap.js"/>
	<link rel="stylesheet" href = "resources/js/bootstrap.min.js"/>
	<link rel="stylesheet" href = "resources/js/jquerylib.js"/>
	
	


<title>Login</title>


</head>

<body>
	
	<div class="login-page">
	  <div class="form" style="opacity=2.5">
	    <img src="resources/images/book-logo.png" alt="logo" style="height:100%; width:100%; padding-bottom:60px; ">
	      
	 <form action="loginOnUserName" method="post">
		<span style="color:red;">Please enter a valid username/password!</span>
	 <div class = "container">
	  <div class="input-group mb-3">
	  	<div class = "input-group-prepend">
	    	<span class="input-group-text"><i class="fa fa-user fa-fw"></i></span>
	    	<input id="email" type="text" class="form-control" name="userName" placeholder="Username" value='${user.getUserName()}'>
	    </div>    	  
	  </div>
	  <div class = "input-group mb-3">
	  <div class="input-group-prepend">
	    <span class="input-group-text"><i class="fa fa-key fa-fw"></i></span>
	    <input id="password" type="password" class="form-control" name="password" placeholder="Password" value='${user.getPassword()}'>
	  </div>
	</div>
	</div>
	      <br>
	   
	   
	    <input class="btn btn-success" type="submit" value="Login" style="width:100px"/>
	 </form>
	 </div>
	      
	      <br>
	       <!-- <img src="resources/images/syntrans.png" alt="logo" style="height:50%; width:50%; padding-bottom:60px; "> -->
	    
	  </div>
</body>
</html>