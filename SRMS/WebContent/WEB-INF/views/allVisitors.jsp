<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Reservations</title>
<link rel="stylesheet" href="resources/css/bootstrap.css" />
<link rel="stylesheet" href="resources/css/bootstrap.min.css" />
<link rel="stylesheet" href="resources/css/fullcalendar.min.css" />
<link rel="stylesheet" href="resources/css/fontawesome.min.css" />
<link rel="stylesheet" href="resources/css/jquery.dataTables.css" />
<link rel="stylesheet" href="resources/css/all.css" />

<jsp:include page="navbar.jsp" />

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

.animate {
	-webkit-transition: all 0.3s ease-in-out;
	-moz-transition: all 0.3s ease-in-out;
	-o-transition: all 0.3s ease-in-out;
	-ms-transition: all 0.3s ease-in-out;
	transition: all 0.3s ease-in-out;
}

@media ( max-width : 992px) {
	#hamBurgerMenu, #dropdown {
		display: none;
	}
	#containIt {
		padding-top: 100px;
	}
	#mod-button {
		display: none;
	}
	#sort-op, #table-row-1 {
		display: block;
	}
}

@media ( max-width : 600px) {
	.welcome-tag {
		display: none
	}
}

#tablediv {
	margin-top: 10px;
	height: 500px;
}

#outbutton {
	background-color: red;
}
</style>
</head>

<body>


		<a type="button" href = landing class="btn btn-primary btn-lg btn-block">Visitor Services</a>
	<div>
	<div>
	
	<table border="3" cellspacing="3" cellpadding="4" 
	style="background-color: white;border:double;border-color: blue">
<tr>
	<th>ID</th>
	<th>Name</th>
	<th>Email</th>
	<th>Phone</th>
	<th>Badge ID</th>
	<th>Purpose</th>
	<th>Company</th>
	<th>In Time</th>
	<th>Out Time</th>

</tr>
<c:forEach var="vis" items="${allvis}" >
	<tr ng-app="myMod">
		<td>${vis.visId}</td>
		<td>${vis.visName}</td>
		<td>${vis.visEmail}</td>
		<td>${vis.visPhone}</td>
		<td>${vis.badgeId}</td>
		<td>${vis.visPurpose}</td>
		<td>${vis.visCompany}</td>
		<td>${vis.checkIn}</td>
		
		<td>
			<c:if test="${vis.checkOut == null}">
				<a href="CheckOutVis/${vis.visId}">Check Out</a>	
			</c:if>
			<c:if test="${vis.checkOut != null}">
				${vis.checkOut}	
			</c:if>
			
		</td>
	</tr>
</c:forEach>
</table>
</div>
	</div>
	<script src="resources/js/jquerylib.js"></script>
	<script src="resources/js/fontawesome.js"></script>
	<script src="resources/js/bootstrap.js"></script>
	<script src="resources/js/moment.js"></script>
	<script src="resources/js/bootstrap.min.js"></script>
	<script>
	
        $(document).ready(function() {
            $('.dropdown-toggle').dropdown();
            $('.leftmenutrigger').on('click', function(e) {
                $('.side-nav').toggleClass('open');
                    e.preventDefault();
                });
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
	<!-- <a href="CheckOutVis/${vis.visId}">Check Out</a> -->
</body>
</html>