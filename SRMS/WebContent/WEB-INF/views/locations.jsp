<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="store" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Edit Locations</title>
	<link rel="stylesheet" href="resources/css/bootstrap.css"/>
	<link rel="stylesheet" href="resources/css/bootstrap.min.css"/>
	<link rel="stylesheet" href="resources/css/all.css"/>
	
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
	    .btn-dark{
	        margin: 3px;
	        height: 60px;
	    }
	    table {
        width: 100%;
    }

		thead, tbody, tr, td, th { display: block; }
		
		tr:after {
		    content: ' ';
		    display: block;
		    visibility: hidden;
		    clear: both;
		}
		
		thead th {
		    height: 50px;
		    /*text-align: left;*/
		}
		
		tbody {
		    height: 430px;
		    overflow-y: auto;
		}
		
		thead {
		    /* fallback */
		}
		
		
		tbody td, thead th {
		    width: 14.20%;
		    float: left;
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
	            padding:90px 15px 0px 15px;
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
	</style>
    
</head>
<body>

    
<div class="container">
		<div class = "row">	
			<!-- Button trigger modal -->
			<button type="button" class="btn btn-primary" style="margin-left:13px" data-toggle="modal" data-target="#exampleModalCenter">
			  Add New Location
			</button>
			
			<!-- Modal -->
			<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
			  <div class="modal-dialog modal-dialog-centered" role="document">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h5 class="modal-title" id="exampleModalLongTitle">Add New Location</h5>
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			          <span aria-hidden="true">&times;</span>
			        </button>
			      </div>
			      <div class="modal-body">
			       	<store:form action = "saveLocation" method="post">
                      <div class="form-row">
                        <div class="form-group col-md-6">
                          <store:input path="locName" type="text" class="form-control" placeholder="Location Name" required="required"/>
                        </div>
                        <div class="form-group col-md-6">
                          <store:input type="text" path ="locCity" class="form-control" id="inputPassword4" placeholder="Location City" required="required"/>
                        </div>
                      </div>

                      <div class="form-row">
                        <div class="form-group col-md-6">
                          <store:input path="locState" type="text" class="form-control" id="inputCity" placeholder="Location State" required="required"/>
                        </div>
                        <div class="form-group col-md-6">
                            <store:input path="locAddress" type="text" class="form-control" id="inputCity" placeholder="Location Address" required="required"/>
                        </div>
                        </div>
                        <div class = "form-row">
                        <div class="form-group col-md-12">
                            <store:input path="description" type="text" class="form-control" id="inputCity" placeholder="Location Description" required="required"/>
                        </div>
                      </div>
                          <button type="submit" class="btn btn-warning">Submit</button>
                         <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    </store:form>
			      </div>
			    </div>
			  </div>
			</div>
		</div>
		<br>
		
		<table class="table">
		  <thead class="thead-dark">
		    <tr>
		      <th scope="col">Name</th>
		      <th scope="col">City</th>
		      <th scope="col">State</th>
		      <th scope="col">Address</th>
		      <th scope="col">Description</th>
		      <th scope="col">Edit</th>
		      <th scope="col">Delete</th>
		    </tr>
		  </thead>
		  <tbody>
			<c:forEach var= "loc" items="${allLoc}">
				<tr>
					<td class="filterable-cell">${loc.locName}</td>
					<td class="filterable-cell">${loc.locCity}</td>
					<td class="filterable-cell">${loc.locState}</td>
					<td class="filterable-cell">${loc.locAddress}</td>
					<td class="filterable-cell">${loc.description}</td>
					<td class="filterable-cell"><button type="submit" class="btn btn-warning edit-employee" data-toggle="modal" id="edit" data-target="#editModal${loc.locId}">Edit</button>
						<div class="modal fade" id="editModal${loc.locId}" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
						  <div class="modal-dialog modal-dialog-centered" role="document">
						    <div class="modal-content">
						      <div class="modal-header">
						        <h5 class="modal-title" id="exampleModalLongTitle">Edit Location</h5>
						        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
						          <span aria-hidden="true">&times;</span>
						        </button>
						      </div>
						      <div class="modal-body">
						        <store:form action = "editLocation" method="post">
								  <div class="form-row">
								  	<div class="form-group col-md-6">
								  		<store:input path="locId" type="hidden" id="startTimeStamp" name="startTimeStamp" value="${loc.locId}"/>
								      <store:input path="locName" type="text" value="${loc.locName}" class="form-control" placeholder="Location Name" required="required"/>
								    </div>
								    <div class="form-group col-md-6">
								      <store:input type="text" path ="locCity" value="${loc.locCity}" class="form-control" id="inputPassword4" placeholder="Location City" required="required"/>
								    </div>
								  </div>
								  
								  <div class="form-row">
								    <div class="form-group col-md-6">
								      <store:input path="locState" type="text" value="${loc.locState}" class="form-control" id="inputCity" placeholder="Location State" required="required"/>
								    </div>
								    <div class="form-group col-md-6">
								    	<store:input path="locAddress" type="text" value="${loc.locAddress}" class="form-control" id="inputCity" placeholder="Location Address" required="required"/>
								    </div>
								    </div>
								    <div class = "form-row">
								    <div class="form-group col-md-12">
								    	<store:input path="description" value="${loc.description}" type="text" class="form-control" id="inputCity" placeholder="Location Description" required="required"/>
								    </div>
								  </div>
								  	<button type="submit" class="btn btn-warning">Submit</button>
								 	<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
								</store:form>
						      </div>
						    
						    </div>
						  </div>
						</div>
					
					</td>
					<td class="filterable-cell"><button type="submit" class="btn btn-danger deleteButton" data-toggle="modal" data-target="#deleteModal${loc.locId}">Delete</button>
						<div class="modal fade" id="deleteModal${loc.locId}" tabindex="-1" role="dialog" aria-labelledby="deleteModal" aria-hidden="true">
						  <div class="modal-dialog" role="document">
						    <div class="modal-content">
						      <div class="modal-header">
						        <h5 class="modal-title" id="exampleModalLabel">Delete Location</h5>
						        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
						          <span aria-hidden="true">&times;</span>
						        </button>
						      </div>
						      <div class="modal-body">
						        <p>Are you sure you want to delete <b>${loc.locName}</b>, Location Id: <b>${loc.locId}</b> ?</p>
						      </div>
						      <div class="modal-footer">
						        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
						        <button type="button" class="btn btn-warning" onclick="document.location.href='deleteLocation/${loc.locId}'">Confirm</button>
						      </div>
						    </div>
						    </div>
						  </div>
					</td>
				
				</tr>
			</c:forEach>
			</tbody>
		</table>


	
		</div>
		
    
	<script src="resources/js/jquerylib.js"></script>	        
	<script src="resources/js/popper1.js"></script>
	<script src="resources/js/flip.min.js"></script>
	<script src="resources/js/bootstrap.js"></script>
	<script src="resources/js/bootstrap.min.js"></script>
	<script src="resources/js/moment.js"></script>
	<script src="resources/js/fullcalendar.js"></script>
	<script src="resources/js/daterangepicker.js"></script>
	
	<script>
	//took out id from table
	//move location button -- added style="margin-left:13px"
	//added required="required" in the req fields
	//added a column in the insert statement for active for inserting new location
	//
      $(document).ready(function() {
      	$('.dropdown-toggle').dropdown();
            $('.leftmenutrigger').on('click', function(e) {
                $('.side-nav').toggleClass('open');
                e.preventDefault();
            });
      });
      </script>
</body>
</html>