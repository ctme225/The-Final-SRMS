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
            Landing 
        </title>
        <link rel="stylesheet" href="resources\css\animate.css"/>
        <link rel="stylesheet" href="resources\css\bootstrap.css"/>
        <link rel="stylesheet" href="resources\css\all.css"/>
		
		<jsp:include page="navbar.jsp" />
		
        <style>
            body{
                background: #F5F5F5;
                overflow-y: hidden;
            }
            #SRMS {
                font-size: 30px;
            }
            .navbar-expand-lg .navbar-nav.side-nav {
                flex-direction: column;
            }
            .navbar {
                background: #383838;
            }
            .header-top {
                box-shadow: 0 3px 5px rgba(0, 0, 0, 0.1);
            }
            .leftmenutrigger {
                display: none;
            }
            #wrapper {
                padding: 90px 15px 0px 15px;
            }
            .btn{
                padding: 30px;
                margin: 10px;
                border-radius: square; 
            }
            .containsIt{
                border-color: #383838;
            }
            
            @media (min-width: 992px) {
                .leftmenutrigger {
                    display: block;
                    display: block;
                    margin: 7px 20px 4px 0;
                    cursor: pointer;
                }
                #show-op{
                    display: none;
                }
                #wrapper {
                    padding:50px 15px 0px 15px;
                }
                .navbar-nav.side-nav.open {
                    left: 0;
                }
                .navbar-nav.side-nav {
                    background: #585f66;
                    box-shadow: 2px 1px 2px rgba(0, 0, 0, 0.1);
                    position: fixed;
                    top: 82px;
                    flex-direction: column !important;
                    left: -220px;
                    width: 200px;
                    overflow-y: auto;
                    bottom: 0;
                    overflow-x: hidden;
                    padding-bottom: 30px;
                }
            }

            .row{
                margin-right: -15px;
                margin-left: -15px;
            }
            .container {
                padding-right: 15px;
                padding-left: 15px;
                margin-right: auto;
                margin-left: auto;
            }
            .animate {
                -webkit-transition: all 0.3s ease-in-out;
                -moz-transition: all 0.3s ease-in-out;
                -o-transition: all 0.3s ease-in-out;
                -ms-transition: all 0.3s ease-in-out;
                transition: all 0.3s ease-in-out;
            }
            @media (max-width: 992px) {
                #hamBurgerMenu, #dropdown{
                display: none;
                }

                .removeCol{
                    display: none;
                }
                .btn{
                    margin: 5px;
                    padding: 10px;
                }
            }
            @media (max-width: 600px){ .welcome-tag{ display: none} }

            .masthead {
                position: relative;
                width: 100%;
                height: 80%;
                padding: 15rem 0;
                background: linear-gradient(to bottom, rgba(22, 22, 22, 0.1) 0%, rgba(22, 22, 22, 0.5) 75%, #161616 100%);
                background-position: center;
                background-repeat: no-repeat;
                background-attachment: scroll;
                -webkit-background-size: cover;
                -moz-background-size: cover;
                -o-background-size: cover;
                background-size: cover;
                }

            .masthead h1 {
                padding: 60px;
                font-family: 'Varela Round';
                font-size: 2.5rem;
                line-height: 2.5rem;
                letter-spacing: 0.8rem;
                background: -webkit-linear-gradient(rgba(255, 255, 255, 0.9), rgba(255, 255, 255, 0));
                -webkit-text-fill-color: transparent;
                -webkit-background-clip: text;
                }

            @media (min-width: 768px) {
                .masthead h1 {
                    font-size: 4rem;
                    line-height: 4rem;
                }
            }

            @media (min-width: 992px) {
                .masthead {
                    height: 100vh;
                    padding: 0;
                }
                .masthead h1 {
                    font-size: 6.5rem;
                    line-height: 6.5rem;
                    letter-spacing: 0.8rem;
                }
                .masthead h2 {
                    max-width: 30rem;
                    font-size: 1.25rem;
                }
            }
        </style>
    </head>
        <script src="resources/js/jquerylib.js"></script>
        <script src="resources/js/bootstrap.js"></script>

        <script type="text/javascript">
            $(document).ready(function() {
                $('.dropdown-toggle').dropdown();
                $('.leftmenutrigger').on('click', function(e) {
                    $('.side-nav').toggleClass('open');
                        e.preventDefault();
                    });
                // $(".btn").on("mouseenter", function () {
	            //     $( this ).css('background',$(this).css('border-color'));
                // }).on("mouseleave", function () {
                //     $( this ).css('background','none');
                // });
                $("#util").on('click',function(){
                     document.location.href = $(this).val();
                });
                $("#rsvtn").on('click',function(){
                     document.location.href = $(this).val();
                });
                $("#locat").on('click',function(){
                     document.location.href = $(this).val();
                });
                $("#vis").on('click',function(){
                     document.location.href = $(this).val();         
                });
                $("#userop").on('click',function(){
                     document.location.href = $(this).val();         
                });
            });
        </script>
        <h1>This is manage locations page</h1>
    </body>
</html>