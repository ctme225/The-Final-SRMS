<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*, org.springframework.web.context.WebApplicationContext,
org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>

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
            .modal{
            	top:130px;
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
                padding: 95px 15px 0px 15px;
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
                    padding:95px 15px 0px 15px;
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
                
            }
            @media (max-width: 600px){ .welcome-tag{ display: none} }

        </style>
    </head>
    <body>
        
        <div class= "container">
        	<table class="table">
			  <thead class="thead-dark text-center">
			    <tr>
			      <th scope="col" colspan="4">User Options</th>
			    </tr>
			  </thead>
			  <tbody>
			    <tr>
			      <th scope="row">Name: </th>
			      <td>${userInfo.name}</td>
			      <th>UserName: </th>
			      <td>${userInfo.userName}</td>
			    </tr>
			    <tr>
			      <th scope="row">Email: </th>
			      <td>${userInfo.userEmail}</td>
			      <th>Password: </th>
			      <td>${userInfo.userPassword}</td>
			    </tr>
			    <tr>
			      <th scope="row">Location: </th>
			      <td>${userLocation}</td>
			      <th>Phone Numer:</th>
			      <td>${userInfo.userPhone}</td>
			    </tr>
			    <tr>
			      <th scope="row"></th>
			      <td></td>
			      <th></th>
			      <td>
			      	<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
					  Edit Profile
					</button>
			      </td>
			    </tr>
			  </tbody>
			</table>
        
        </div>
        
		      <!-- Modal -->
		<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="exampleModalLabel">Edit Profile</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <form action="updateUserOptions" method="GET">
		      <div class="modal-body">
		        
				  <div class="form-row">
				    <div class="col">
				      <input type="text" class="form-control" placeholder="Name" value="${userInfo.name}" readonly="readonly">
				    </div>
				    <div class="col">
				      <input type="text" class="form-control" name="userName" placeholder="UserName" value="${userInfo.userName}">
				    </div>
				  </div>
				  <br>
				  <div class="form-row">
				    <div class="col">
				      <input type="text" class="form-control" name="userEmail" placeholder="Email" value="${userInfo.userEmail}">
				    </div>
				    <div class="col">
				      <input type="text" class="form-control" name="userPass" placeholder="Pasword" value="${userInfo.userPassword}">
				    </div>
				  </div>
				  <br>
				  
				  <div class="form-row">
				    <div class="col">
				      <div class="dropdown">
						  <button class="btn btn-primary dropdown-toggle locDropdown" style="width:220px; font-size: 13px;" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						    ${userLocation}
						  </button>
						  <input type="hidden" id="selectedLocation" name="selectedLocation" value="${userLocation}"/>
						  <div class="dropdown-menu" style="width:220px; font-size: 11px;" aria-labelledby="dropdownMenuButton">
						    <c:forEach var= "allloc" items="${allLocation}">
						    		<a class="dropdown-item chooseLocation" href="#">${allloc.locName}-${allloc.locCity},${allloc.locState}</a>
                            </c:forEach>
						  </div>
						</div>
				    </div>
				    <div class="col">
				      <input type="text" class="form-control" name="userPhone" placeholder="Phone Number" value="${userInfo.userPhone}">
				    </div>
				  </div>
				  
				
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
		        <button type="submit" class="btn btn-primary">Save changes</button>
		      </div>
		      </form>
		    </div>
		  </div>
		</div>
		        
        <script src="resources/js/popper.js"></script>
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
                $(".chooseLocation").click(function(){
                	$(".locDropdown").html($(this).html());
                	$("#selectedLocation").val($(this).html());
                });
            });
        </script>
        
    </body>
</html>