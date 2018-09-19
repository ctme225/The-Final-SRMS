<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
    
    
    
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>
      Resource Page
    </title>

    <link rel="stylesheet" href="../resources/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="../resources/css/bootstrap.css"/>
    <link rel="stylesheet" href="../resources/css/animate.css"/>
    <link rel="stylesheet" href="../resources/css/all.css"/>
    <style>
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

.openButton {
	border-style: none;
	background: #585f66;
	cursor: pointer;
}

#table-row-1 {
	display: none;
}

@media ( min-width : 992px) {
	.leftmenutrigger {
		display: block;
		display: block;
		margin: 7px 20px 4px 0;
		cursor: pointer;
	}
	#show-op {
		display: none;
	}
	#wrapper {
		padding: 90px 15px 0px 15px;
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
		padding-bottom: 40px;
	}
}

.modal-form{
	padding-bottom: 0;
}
.form-control{
	width: 160px;
}

.front{
  background-color: #6B6E70;
}
.back{
  border: 1px solid #6B6E70;
  background-color: #222629;
}

.btn-class{
  width: 200px;
  margin: 2px;
  height: 120px;
}
#plus-button{
  height: 60px;
  width: 60px;
  border-radius: 100%;
  position: relative;
  left: -40px;
}
/* For Firefox */
input[type='number'] {
    -moz-appearance:textfield;
}

/* Webkit browsers like Safari and Chrome */
input[type=number]::-webkit-inner-spin-button,
input[type=number]::-webkit-outer-spin-button {
    -webkit-appearance: none;
    margin: 0;
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
    padding: 95px 15px 15px 15px;
  }
  .navbar-nav.side-nav.open {
    left: 0;
  }
  .card-title{
  	height: 62px;
  	margin-bottom: 0px;
  }
  img{
  	filter: invert(100%);
  }
  

  .form-submit-btn{
  	border-bottom-right-radius: 0px;
  	border-top-left-radius: 0px;
  	border-top-right-radius: 0px;
  	width: 100%
  }
  .badge{
  background-color: red;
  }
  .form-cancel-btn{
  	border-bottom-left-radius: 0px;
  	border-top-left-radius: 0px;
  	border-top-right-radius: 0px;
  	width: 100%
  }
  
  	.modal-header{ 	
	background-color: rgb(0, 123, 255);
	padding-top: 0px;
	padding-bottom: 0px;
	height: 80px;
	}
	.modal-body{
	background-color: #222629;
	}
	
	.checkbox{
	padding-right: 10px;
	color: white;
	}
	textarea {
 	 resize: none;
	}
  	h3{
    color: white;
    }
    .padding-right{
    	padding-right: 15px;
    	padding-left: 0px;
    }
    .padding-left{
    	padding-left: 15px;
    	padding-right: 0px;
    }
    
    
    .room-group > .row {
	  overflow-x: auto;
	  white-space: nowrap;
	}
	.room-group > .row > .col {
	  display: inline-block;
	  float: none;
	}
    
    
}
.animate {
  -webkit-transition: all 0.3s ease-in-out;
  -moz-transition: all 0.3s ease-in-out;
  -o-transition: all 0.3s ease-in-out;
  -ms-transition: all 0.3s ease-in-out;
  transition: all 0.3s ease-in-out;
}
.list-group-item{
  display: inline-block;
  width: 100%;
  background-color: #222629;
  color: white;
  border-radius: 0;
}
.icon-item{
	padding-right: 0;
	padding-left: 0;

}

.quant-item{
	padding-right: 0;
	padding-left: 0;
	
}
.card-list{
  padding-left: 0;
  padding-right: 0;
}
.exampleModal{
  width: 100%;
}
.modal-dialog{
  width: 100%;
}
.bordered{
  border: 1px solid rgba(0, 0, 0, 0.125);
}
h5{
  color: white;
  font-size: 16px;
}
.entry:not(:first-of-type)
{
    margin-top: 10px;
}

.fea-scroll{
	overflow-y: scroll;
}

.glyphicon
{
    font-size: 12px;
}
.addCard{
  width: 100%;
  height: 200px;
}
a:link{
  text-decoration: none;
}

li{
height: 60px;
}
  body{
  }
  .jackInTheBox{
  	background-color: #6B6E70;
  }
  
  
@media (max-width: 992px) {
  #hamBurgerMenu, .dropdown {
    display: none;
  }
  #containIt{
    padding-top: 100px;
  }

  
  
}
    
    
    
    </style>
  </head>
  <body>
 	<div id="wrapper" class="animate">
            <nav id= "navigation" class="navbar header-top fixed-top navbar-expand-lg  navbar-dark ">
                <span id="hamBurgerMenu" class="navbar-toggler-icon light leftmenutrigger" ></span>
                <a class="navbar-brand" style = "display: inline-block;" href=../home><img src="../resources/images/book-logo.png" alt="logo"  style="filter: invert(0%); height:25%; width:25%; margin-bottom:0px; "/></a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarText" aria-controls="navbarText"
                    aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarText">
                    <ul class="navbar-nav animate side-nav" id="ulSideNav">
                        <li class="nav-item">
                            <a class="nav-link" href=../util>Reports</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href=../reserve>View Reservations</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href=../res/${mylocationmodel.locId}>Manage Resources</a>
                        </li>
						<li class="nav-item">
                            <a class="nav-link" href=../addloc>Add Location</a>
                        </li>
                        <li class="nav-item">
                                <a class="nav-link" href=../visitor>Visitor Log</a>
                            </li>
                    </ul>
                    <div class="navbar-nav ml-md-auto d-md-flex">
	                	<small id="myloco" class= "text-light mt-4">${myLocation}</small>
	                    <ul class="navbar-nav ml-md-auto mt-3 d-md-flex ">
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
                                    <a class="dropdown-item" href=../user>User Options</a>
                                    <a class="dropdown-item" href="../logout">Logout</a>
                                </div>
                            </div>
                        </li>
                    </ul>
                    </div>
                </div>
                <div class = "text-light nav-item" style = "float: right" >${myUser}</div>
            </nav>
        </div>
    <div class="container text-center">
    
    

      <div class="row">
        <div class="col-sm">
            <button type="button" data-toggle="modal" data-target="#NewResModal" class="btn btn-primary btn-lg">Add New Resource</button>
        </div>
        <div class="col-sm"></div>
        <div class="col-sm"></div>

        <div class="col-sm">
            
            <div class="dropdown">
                <button class="btn btn-primary btn-lg dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                  Location
                </button>
                <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                <a class="dropdown-item" href="">${location.locName}</a>
                <c:forEach var="location" items="${allLoc}">
                  <a class="dropdown-item" href="../res/${location.locId}">${location.locName}, ${location.locCity}, ${location.locState}</a>
				</c:forEach>
                </div>
              </div>
              
        </div>

      </div>
      <br>
      
      <div class="container room-store">
        <div class="row room-store">
        <c:forEach var="resourceType" items="${resourceTypes}">
          <div class="col-xs">
              <button type="button" class="btn btn-class btn-dark btn-lg btn-block animated jackInTheBox" data-toggle="modal" data-target="#Modal${resourceType.name}">
              	<img src="../resources/images/${resourceType.iconName}" style="width: 5rem; height: 5rem;"/>
              	${resourceType.name} 
              </button>
          </div>
          
          
           <div class="modal fade" id="Modal${resourceType.name}" role="dialog">
                    <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
			    		<div class="modal-content">
			      		<div class="modal-header">
						<div class="container-fluid">
						<div class="row">
						<h3>
							<br>
							Here are ${resourceType.name} rooms
							<br>
							<br>
						</h3>
						</div>
						</div>	
						</div>
						
						<div class="modal-body">
			              <div class="container-fluid">
			              <div class="row room-group" >

			       		  <c:set var="resTypeNameVar" value="res${resourceType.name}" scope="request"/>
			              <c:forEach var="resource" items="${requestScope[resTypeNameVar]}">
			              <c:set var="resNameVar" value="resfea${resource.resId}" scope="request"/>
			              <c:choose>
			              <c:when test="${resource.isActive == 1}">
			                <div class="col-sm-4" style="padding-bottom: 10px;">
			                <div class="flip text-center"> 
			                    <div class="front card">
			                        <div class="card-body quant-item">
			                        <div class="containter-fluid">
			                        <div class="row">
			                        <div class="col">
			                        <c:choose>
			                        <c:when test="${resource.acceptedRole == 0}">
			                          <h5 class="card-title">${resource.resName}<br> ID: ${resource.resId}</h5>
			                          </c:when>
			                          <c:otherwise>
			                          <h5 class="card-title">${resource.resName} <span class="badge">!</span><br> ID: ${resource.resId}</h5>
			                          <!--<img src="../resources/admin.png" style="width: 30px; height: 30px;"/>-->
			                          </c:otherwise>
			                        </c:choose>
			                          </div>
			                          </div>
			                          <div class="row">
			                           <div class="col">
			                          <img src="../resources/images/${resourceType.iconName}" style="width: 5rem; height: 5rem;"/>
			                          </div>
			                          </div>
			                          <div class="row" style="height:20%;">
										<div class="col padding-left">
											  
				                              <button type="button" class="btn btn-primary btn-room-edit form-submit-btn"  data-dismiss="modal" data-toggle="modal" data-target="#resEditModal${resource.resId}">
				                                  <span class="glyphicon glyphicon-wrench"></span> Edit
				                                </button>
				                                
				                               </div>
				                           <div class="col padding-right">
				                           		
				                                <form action="../deleteResource/${resource.resId}/${thisLoc.locId}" 
														onsubmit="return confirm('will be permanently be removed from the system, continue?');">
														    <input class="btn btn-danger form-cancel-btn" type="submit" value="Delete" />
												</form>
												
												</div>
				                        </div>
				                        </div>
			                        </div>
			                      </div>
			                      <div class="back card">
			                        <div class="container">
			                        <div class="row  fea-scroll" style="height:150px">
			                          
			                          <div class="col-sm-4 card-list">
			                          <div class="container-fluid">
			                          	<c:forEach var="resFeature" items="${requestScope[resNameVar]}">
			                          	<c:set var="feaid" value="${resFeature.feaId}" scope="request"/>
			                          	<c:set var="feature" value="${feaMap[feaid]}" scope="request"/>
			                          	<div class="row">
			                              <div class="list-group-item icon-item" style="height: 60px; border-top-right-radius: 0; border-bottom-right-radius: 0;">
			                                  <img src="../resources/images/${feature.iconPath}" style="width: 30px; height: 30px;"/>
			                              </div>
			                             </div>									
			                           </c:forEach>
			                           </div>
			                           </div>
			                          <div class="col-sm-8 card-list">
			                          <div class="container-fluid">
			                          <c:forEach var="resFeature" items="${requestScope[resNameVar]}">
			                          	<div class="row">
			                          	<div class="col-sm-9 quant-item">		                          	
			                              <input id="t${resFeature.resFeaId}" class="list-group-item quant-item form-control" type="number" value="${resFeature.quantity}" 
			                              		style="border-radius: 0; height: 60px; pointer-events: none; 
			                              		border-bottom-style: solid; border-bottom-width: 0.833333px; 
			                              		border-bottom-color: rgba(0, 0, 0, 0.125);">
			                              
                                          </div>
                                          <div class="col-sm-3 quant-item">
                                          
                                          <form action="../deleteFeature/${resFeature.resFeaId}/${thisLoc.locId}" method="POST" 
														onsubmit="return confirm('Are you sure?');">
														    <input class="btn btn-danger" type="submit" value="-"  style="border-bottom-left-radius: 0; border-top-left-radius: 0; width: 100%; height: 60px"/>
										</form>
                                          
                                          </div>
                                          
                                          </div>
                                                                                
			                          </c:forEach>
			                          </div>
			                          </div>
			                        </div>
			                        <div class="row" style="height:20%;">
			                           <div class="col icon-item">
			                           
			                                			<button class="btn btn-primary" type="button" style="width:100%; height: 50px; position: relative;" data-dismiss="modal" data-toggle="modal" data-target="#feaAddModal${resource.resId}">Add Feature</button>
											</div>
											
			                        </div>
			                        </div>
			                      </div>
			                  </div>
			                </div>
			                </c:when>
			                
			                <c:otherwise>
			                </c:otherwise>
			                
			                </c:choose>
			                </c:forEach>

						
                      	</div>
                     </div>
                     </div>
                     </div>
                     </div>
                     
                     
          </div>                     
        </c:forEach>        
       </div>
	</div>
	</div>
	
	<c:forEach var="resourceType" items="${resourceTypes}">
	<c:set var="resTypeNameVar" value="res${resourceType.name}" scope="request"/>
		<c:forEach var="resource" items="${requestScope[resTypeNameVar]}">
		<c:set var="resNameVar" value="resfea${resource.resId}" scope="request"/>
		
		 <div class="modal fade" id="resEditModal${resource.resId}" role="dialog">
                    <div class="modal-dialog modal-dialog-centered" role="document">
			    		<div class="modal-content">
			      		<div class="modal-header">
						<div class="container-fluid">
						<div class="row">
						<h3>
							<br>
							Edit ${resource.resName}
							<br>
							<br>
						</h3>
						</div>
						</div>	
						</div>
						
						<div class="modal-body modal-form">
						<div class="container-fluid quant-item">
						<div class="row"></div>
						<form method="POST" action="../editResource/${resource.resId}/${thisLoc.locId}" class="form" >
				        		<div class="container-fluid">
				        		<div class="row">
				        		<div class="col-sm-5">
					        		<div class="input-group mb-3">
					                  <div class="input-group-prepend">
					                    <label class="input-group-text" for="editnameinput">Name</label>
					                    <input required id="addnameinput" name="editnameinput" type="text" class="form-control" value="${resource.resName}" aria-label="Username" aria-describedby="basic-addon1">
					                 	<input required class="form-control" id="editroomnumselect" width="20" value="${resource.roomNumber}" name="editroomnumselect" type="number" min="1" placeholder="" />
					                  </div>
					                  </div>
					                  </div>
					                  
					                </div>
				            		
				                
									<div class="row">
									<div class="col">
					                <div class="input-group mb-3">
					                    <div class="input-group-prepend">
					                      <label class="input-group-text" for="editrestypeselect">Resource</label>
					                    </div>
					                    <select required class="custom-select" name="editrestypeselect" id="editrestypeselect">
					                    
					                      <c:forEach var="allResourceType" items="${allResTypes}">
					                      <c:choose>
					                      <c:when test="${resource.resType == allResourceType.ID}">
					                        <option value="${allResourceType.ID}" selected>${allResourceType.name}</option>
					                       </c:when>
					                       <c:otherwise>
					                       <option value="${allResourceType.ID}">${allResourceType.name}</option>
					                       </c:otherwise>
					                       </c:choose>
					                      </c:forEach>
					                    </select>
					                  </div>
					                  </div>
					                  </div>
					                  
					                  <div class="row">
										<div class="col">
				                      	<div class="input-group mb-3">
				                      	<div class="input-group-prepend">
					                    <label class="input-group-text" for="editdescinput">description</label>
				                      	<textarea required id="editdescinput" rows="3" name="editdescinput" class="form-control input-lg">${resource.description}</textarea>
				                      	</div>
				                      	</div>
				                      	
				                      	</div>
				                      	<c:choose>
				                      	<c:when test="${resource.acceptedRole == 1}">
				                      	<div class="checkbox">
										  <label><input id="editissuper" name="editissuper" type="checkbox" value="" checked>-Super room?</label>
										</div>
										</c:when>
										<c:otherwise>
										<div class="checkbox">
										  <label><input id="editissuper" name="editissuper" type="checkbox" value="">-Super room?</label>
										</div>
										</c:otherwise>
										</c:choose>
				                      </div>
				                      
				                      
				                      
				                      
					              
					              </div>
				                  <div class="container-fluid quant-item">
				                  				                    				                      
				                      				                      
				                      <div class="row">
				                      <br>
				                      <div class="col quant-item">
				                      	<input class="btn btn-primary form-submit-btn" type="submit" value="Submit">
				                      </div>
				                      <div class="col quant-item">
				                    	<button class="btn btn-danger form-cancel-btn" type="button" data-dismiss="modal" data-target="">Cancel</button>
				                      </div>
				                      <br>
				                    	</div>
				                    </div>
				                    
				                    
				             </form> 
						
						
						</div>
						</div>
						
					</div>
				</div>
			</div>
			
			
			
			<div class="modal fade" id="feaAddModal${resource.resId}" role="dialog">
                    <div class="modal-dialog modal-dialog-centered" role="document">
			    		<div class="modal-content">
			      		<div class="modal-header">
						<div class="container-fluid">
						<div class="row">
						<h3>
							<br>
							Add What Feature to ${resource.resName}?
							<br>
							<br>
						</h3>
						</div>
						</div>	
						</div>
						
						<div class="modal-body modal-form">
						<div class="container-fluid quant-item">
						<div class="row"></div>
						<br>
						 <form method="POST" action="../addFeature/${resource.resId}/${thisLoc.locId}" class="form" >
						 <div class="entry input-group col-xs-3">
                                            <div class="input-group-prepend">
                                                <label class="input-group-text" for="addfeaselect">Feature</label>
                                              </div>
                                              <select required class="custom-select" name="addfeaselect" id="addfeaselect">
						                      <option disabled="disabled" selected>Choose Feature</option>
						                      <c:forEach var="featureType" items="${allFea}">
						                        <option value="${featureType.feaId}">${featureType.feaType}</option>
						                      </c:forEach>
						                    </select>
                                            <input required class="form-control" id="addquantselect" name="addquantselect" type="number" min="1" value="1" />
                                          	
                                        </div>
                                        <br>
                                        <div class="row">
                                        <div class="col quant-item">
					                      	<input class="btn btn-primary form-submit-btn" type="submit" value="Submit">
					                      </div>
					                      <div class="col quant-item">
					                    	<button class="btn btn-danger form-cancel-btn" type="button" data-dismiss="modal" data-target="">Cancel</button>
					                      
					                      </div>
					                      <br>
					                      </div>
						 
						 </form>
						
						
						</div>
						</div>
						
					</div>
				</div>
			</div>
		
			<c:forEach var="resFeature" items="${requestScope[resNameVar]}">
			<c:set var="feaid" value="${resFeature.feaId}" scope="request"/>
			<c:set var="feature" value="${feaMap[feaid]}" scope="request"/>
			
			 <div class="modal fade" id="resFeaEditModal${resFeature.resFeaId}" role="dialog">
	                    <div class="modal-dialog" role="document">
				    		<div class="modal-content">
				      		<div class="modal-header">
							<div class="container-fluid">
							<div class="row">
							<h3>
								<br>
								Edit ${resFeature.resFeaId} feature
								<br>
								<br>
							</h3>
							</div>
							</div>	
							</div>
							
							<div class="modal-body">
							<div class="container-fluid">
							
							<div class="row"></div>
							
							
							
							</div>
							</div>
							
						</div>
					</div>
				</div>
		
			
			</c:forEach>
		</c:forEach>	
	</c:forEach>
	
	
	
	  <div class="modal fade" id="NewResModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document"> 
    <div class="modal-content">
    <div class="modal-header">
						<div class="container-fluid">
						<div class="row">
						<h3>
							<br>
							Add new resource
							<br>
							<br>
						</h3>
						</div>
						</div>	
						</div>
    
    
    <div class="modal-body modal-form"> 
    <div class="container-fluid quant-item">
        
        <div class="row">
        		<br>
        		<br>
        		<form method="POST" action="../addResource" class="form" >
        		<div class="container-fluid">
        		<div class="row">
        		<div class="col-sm-5">
	        		<div class="input-group mb-3">
	                  <div class="input-group-prepend">
	                    <label class="input-group-text" for="nameinput">Name</label>
	                    <input required id="nameinput" name="nameinput" type="text" class="form-control" placeholder="Resource Name" aria-label="Username" aria-describedby="basic-addon1">
	                 	<input required class="form-control" id="roomnumselect" width="20" placeholder="Room #" name="roomnumselect" type="number" min="1" placeholder="" />
	                  </div>
	                  </div>
	                  </div>
	                  
	                </div>
            		<div class="row">
            		<div class="col">
	              	<div class="input-group mb-3">
	                  <div class="input-group-prepend">
	                    <label class="input-group-text" for="loacationselect">Location</label>
	                  </div>
	                  <select required class="custom-select" name="locationselect" id="locationselect" >
	                    <c:forEach var="location" items="${allLoc}">
	                    <c:choose>
	          			<c:when test="${location.locId == thisLoc.locId}">
	                    <option value="${location.locId}" selected>${location.locName}</option>
	                    </c:when>
	                    <c:otherwise>
	                    <option value="${location.locId}">${location.locName}</option>
	                    </c:otherwise>
	                    </c:choose>
	                    </c:forEach>
	                  </select>
	                </div>
                </div>
                </div>
                
					<div class="row">
					<div class="col">
	                <div class="input-group mb-3">
	                    <div class="input-group-prepend">
	                      <label class="input-group-text" for="restypeselect">Resource</label>
	                    </div>
	                    <select required class="custom-select" name="restypeselect" id="restypeselect">
	                      <option disabled="disabled" selected>Choose Resource Type</option>
	                      <c:forEach var="resourceType" items="${allResTypes}">
	                        <option value="${resourceType.ID}">${resourceType.name}</option>
	                      </c:forEach>
	                    </select>
	                  </div>
	                  </div>
	                  </div>
	                  
	                  <div class="row">
						<div class="col">
                      	<div class="input-group mb-3">
                      	<div class="input-group-prepend">
	                    <label class="input-group-text" for="descinput">description</label>
                      	<textarea required id="descinput" rows="3" name="descinput" class="form-control input-lg" placeholder="Describe this room..."></textarea>
                      	</div>
                      	</div>
                      	
                      	</div>
                      	<div class="checkbox">
						  <label><input id="issuper" name="issuper" type="checkbox" value="">-Super room?</label>
						</div>
                      </div>
                      
                       <div class="row">
                      <div class="col-sm-12">
                            <div class="control-group" id="fields">
                                <label class="control-label" for="field1">Room features</label>
                                <div class="controls"> 
                                        <div class="entry input-group col-xs-3">
                                            <div class="input-group-prepend">
                                                <label class="input-group-text" for="feaselect">Feature</label>
                                              </div>
                                              <select required class="custom-select" name="feaselect" id="feaselect">
						                      <option disabled="disabled" selected>Choose Feature</option>
						                      <c:forEach var="featureType" items="${allFea}">
						                        <option value="${featureType.feaId}">${featureType.feaType}</option>
						                      </c:forEach>
						                    </select>
                                            <input required class="form-control" id="quantselect" name="quantselect" type="number" min="1" placeholder="" />
                                          	<!--<span class="input-group-btn" hidden="hidden">
                                                <button class="btn btn-primary btn-add" type="button">
                                                    <span class="glyphicon glyphicon-plus">+</span>
                                                </button>
                                            </span>-->
                                        </div>
                                

                                </div>
                                <br>
                            </div>
                           </div>
                      </div>
                      
                      
	              
	              </div>
                  <div class="container-fluid">
                      
                      
                      
                      <div class="row">
                      <br>
                      <div class="col quant-item">
                      	<input class="btn btn-primary  form-submit-btn" type="submit" value="Submit">
                      </div>
                      <div class="col quant-item">
                    	<button class="btn btn-danger quant-item form-cancel-btn" type="button" data-dismiss="modal" data-target="">Cancel</button>
                      </div>
                      <br>
                    	</div>
                    </div>
                    
                    
             </form> 
        </div>
        </div>
        </div>
      </div>
    </div>
    </div>







<script src="../resources/js/popper.js"></script>  
<script src="../resources/js/jquerylib.js"></script>
  <script src="../resources/js/bootstrap.min.js"></script>
  <script src="../resources/js/bootstrap.js"></script>
  <script src="../resources/js/flip.min.js"></script>
 
<script type="text/javascript">

function setCharAt(str,index,chr) {
    if(index > str.length-1) return str;
    return str.substr(0,index) + chr + str.substr(index+1);
}

$(document).ready(function()
{	
	
	$( "button[id*='+']").click(function(){
        var str = this.id;
   str = setCharAt(str,0,'t');
       var v = '#'+str;
       var currentval = parseInt($(v).val())+1;
       $(v).val(currentval);
   });   	
  $('.dropdown-toggle').dropdown();
  $('.leftmenutrigger').on('click', function(e) {
    $('.side-nav').toggleClass('open');
    e.preventDefault();
  });
  $( "button[id*='-']").click(function(){
      var str = this.id;
 str = setCharAt(str,0,'t');
     var v = '#'+str;
     var currentval = parseInt($(v).val())-1;
     $(v).val(currentval);
 });   	
$('.dropdown-toggle').dropdown();
$('.leftmenutrigger').on('click', function(e) {
  $('.side-nav').toggleClass('open');
  e.preventDefault();
});
  
  
  /*$(function()
{
  	$(document).on('click', '.btn-add', function(e)
    {
        e.preventDefault();
        var controlForm = $('.controls'),
            currentEntry = $(this).parents('.entry:first'),
            newEntry = $(currentEntry.clone()).appendTo(controlForm);
        newEntry.find('input').val('');
        controlForm.find('.entry:not(:last) .btn-add')
            .removeClass('btn-add').addClass('btn-remove')
            .removeClass('btn-primary').addClass('btn-danger')
            .html('<span class="glyphicon glyphicon-minus">-</span>');
    }).on('click', '.btn-remove', function(e)
    {
		$(this).parents('.entry:first').remove();
		e.preventDefault();
		return false;
	});
});*/
  $(function(){
    $(".flip").flip({
      trigger: 'click'
      });
    });

});

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


</body>
</html>