<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
     <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Reservations</title>
	<link rel="stylesheet" href="resources/css/bootstrap.css"/>
	<link rel="stylesheet" href="resources/css/bootstrap.min.css"/>
	<link rel="stylesheet" href="resources/css/fullcalendar.min.css"/>
	<link rel="stylesheet" href="resources/css/all.css"/>
	<link rel="stylesheet" href="resources/css/daterangepicker.css"></link>
	<jsp:include page="navbar.jsp" />
	<style>
	    body{
	        background: #F5F5F5;
	        overflow-y: hidden;
	    }
	    .modal{
	    	top: 50px;
	    }
	    #external-events {
			float: left;
			width: 150px;
			padding: 0 10px;
			border: 1px solid #ccc;
			background: #eee;
			text-align: left;
		}
			
		#external-events h4 {
			font-size: 16px;
			margin-top: 0;
			padding-top: 1em;
		}
			
		#external-events .fc-event {
			margin: 10px 0;
			cursor: pointer;
		}
			
		#external-events p {
			margin: 1.5em 0;
			font-size: 11px;
			color: #666;
		}
			
		#external-events p input {
			margin: 0;
			vertical-align: middle;
		}
	    .select{
	   		background-color:green;
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
	    .locdditems{ font-size: 15px}
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
         <div class="container-fluid" style="height: 100%; width: 100%">
            <div class="row" >
                <div class="col-2 text-center">
                	<div class="row center">
                		<div class="dropdown">
                    		<button class="btn btn-danger btn-sm dropdown-toggle loc-drop" style="width:240px;" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            	${loc}-${loccity}, ${locstate} 
                        	</button>
                        	<div class="dropdown-menu locdditems" aria-labelledby="dropdownMenuButton">
                        		<c:forEach var= "allloc" items="${alllocations}">
                            		<a class="dropdown-item" href="changeLocation/${allloc.locId}">${allloc.locName}-${allloc.locCity},${allloc.locState}</a>
                            	</c:forEach>
                        	</div>
                        </div>
                    </div>
                    <div class="row" style="height:29px;"></div>
                    <div class=row>
                    	<div id='external-events' style="width:200px; margin-left:20px">
							<div class="dropdown fc-event">
	                        	<button class="btn btn-danger btn-sm dropdown-toggle" style="width:100%;" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	                            	${defaultResType}
	                        	</button>
	                        	<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
	                            	<c:forEach var="i" items="${Rtypes}">
	                     	       		<a class="dropdown-item locdditems" href="changeResourceType/${i.ID}">${i.name}</a>
	                            	</c:forEach>
	                        	</div>
	                    	</div>
	                    	<c:forEach items="${resources}" var="i">
	                            <div data-room='{"name":"${i.resource.resName}","img":"proj.png","num":${i.resource.roomNumber},"feats":[<c:forEach var="j" items="${i.features}" varStatus="jstatus">{"count":${j.count},"type":"${j.name}","image":"${j.img}"}<c:if test="${not jstatus.last}">,</c:if></c:forEach>]}'
	                             class="fc-event resNameButton">
	                             <img class="theImageToShow" src="" alt="Name: " style="height: 40px; width: 40px; background: white">
	                             ${i.resource.resName}
	                            </div>
	                            <input type="hidden" value="${i.resource.resId}"/>
	                        </c:forEach>
							
							<!--  <p>
								<input type='checkbox' id='drop-remove' />
								<label for='drop-remove'>remove after drop</label>
								
							</p>-->
						</div>
                    
                    </div>
                    
                    
                </div>
                <div class="col-10">
                    <div class="container" id="calendar"></div>
                </div>
            </div>
                   	
                    		
                        
        </div>
        
        <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header bg-dark">
		        <h5 class="modal-title bg-dark text-light" id="exampleModalLabel">Room Booking</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <form action = "saveReservation" id="resv" method="post">
		      <!-- action = "saveReservation" id="resv" method="post" -->
		      <div class="modal-body">
		      
		      	<div class="row">
		      		<div class="col">
		      			<input class="form-control" id="dateRange" type="text" value="01/15/2018" />
		      		</div>
		      	</div>
		     
		      	<div class="row">
		      		<div class="col">
		      			Start: <input class="form-control timeStart" id="startTime" type="time" name="start_time"/>
		      		</div>
		      		<div class="col">
		      			End: <input class="form-control timeEnd" type="time" id="endTime" name="end_time"/>
		      		</div>
		      	</div>
		      	<br/>
		      	<div class="row">
		      		<div class="col">
		      			<div class="dropdown show" style="width:50px;">
						  <a class="btn btn-secondary dropdown-toggle" href="#" role="button" id="occurDD" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						    Single Day
						  </a>
						
						  <div class="dropdown-menu" aria-labelledby="occurDD">
						    <a class="dropdown-item Sd-Occur" href="#">Single Day</a>
						    <a class="dropdown-item Da-Occur" href="#">Daily</a>
						    <a class="dropdown-item We-Occur" href="#">Weekly</a>
						    <a class="dropdown-item Mo-Occur" href="#">More Options</a>
						  </div>
						</div>
		      		
		      		</div>
		      		
		      		<div class="col">
		      			<p id="untilDate" style="display:none">Until: <input class="form-control" id="untilDate1" type="text" value="" placeHolder="Until Date" /></p>
		      		</div>
		      	  	
		       	 </div>
		       	 <div class= "row weekDays" style="margin-left:15px;">
		       	 	<!-- Default inline 1-->
					<div class="col custom-control custom-checkbox custom-control-inline" style="display:none">
					  <input type="checkbox" class="custom-control-input" id="defaultInline1">
					  <label class="custom-control-label" for="defaultInline1">Mon</label>
					</div>
					
					<!-- Default inline 2-->
					<div class="col custom-control custom-checkbox custom-control-inline" style="display:none">
					  <input type="checkbox" class="custom-control-input" id="defaultInline2">
					  <label class="custom-control-label" for="defaultInline2">Tue</label>
					</div>
					
					<!-- Default inline 3-->
					<div class="col custom-control custom-checkbox custom-control-inline" style="display:none">
					  <input type="checkbox" class="custom-control-input" id="defaultInline3">
					  <label class="custom-control-label" for="defaultInline3">Wed</label>
					</div>
					<!-- Default inline 3-->
					<div class="col custom-control custom-checkbox custom-control-inline" style="display:none">
					  <input type="checkbox" class="custom-control-input" id="defaultInline4">
					  <label class="custom-control-label" for="defaultInline4">Thu</label>
					</div>
					<!-- Default inline 3-->
					<div class="col custom-control custom-checkbox custom-control-inline" style="display:none">
					  <input type="checkbox" class="custom-control-input" id="defaultInline5">
					  <label class="custom-control-label" for="defaultInline5">Fri</label>
					</div>
		       	 
		       	 </div>
		       	 <div class="col-12">
                      Comments: <textarea class="form-control" name= "description" id="exampleFormControlTextarea1" rows="2"></textarea>

                  </div><br>
                  
                  <input type="hidden" id="occur-type" name="occur-type" value="Single Day"/>
                  <input type="hidden" id="startTimeStamp" name="startTimeStamp" value="3487"/>
                  <input type="hidden" id="endTimeStamp" name="endTimeStamp" value="3487"/>
                  <input type="hidden" id="useridForService" name="useridForService" value="${userid}"/>
                  <input type="hidden" id="locidForService" name="location" value="${userLocViewId}"/>
                  <div id="resContainer">
                          <div id="card" >
                              <div class="front">
                                  <div class="card-title text-center">
                                      Front Content
                                  </div>
                                  <div class="card-body">
                                      Body Content
                                  </div>
                                  <div class="card-footer">
                                      Footer Content
                                  </div>
                              </div>
                              <div class="back">
                                  Back content
                              </div>
                          </div>
                  </div>
		       	</div>
		       	<div class="modal-footer">
		        	<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
		        	<button type="submit" class="btn btn-danger text-white">Book Now</button>
		        </div>
		      </form>
		    </div>
		  </div>
		</div>
        
        <div class="modal fade alert-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
		  <div class="modal-dialog modal-sm">
		    <div class="modal-content">
		      Invalid Date!! Cannot create bookings for a passed date.
		    </div>
		  </div>
		</div>
		
		<div class="modal fade valid-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
		  <div class="modal-dialog modal-sm">
		    <div class="modal-content">
		     	Please select a room that you would like to book from the list of available resources. 
		    </div>
		  </div>
		</div>
		
		<div class="modal fade edit-modal" tabindex="-1" role="dialog">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title">Edit a Booking</h5>
		        <button type="button" class="close" aria-label="Close">
		          <button type="button" class="btn btn-danger deleteButton">Delete this Booking</button>
		          	<div id="deleteBooking" style="display: none">
					  <div class="list-of-emails">
					  	<p>Are you sure you want to delete this booking??</p>
					  	<div class="row">
					  		<div class="col">
						  		<button type="button" class="btn btn-danger confirmDeleteButton">Confirm</button>
						  	</div>
						</div>
					  </div>
					</div>
		        </button>
		      </div>
		      <form action = "editBooking" id="resv" method="post">
		      	<div class="modal-body">
		          <div class="row">
				    <div class="col">
				      <input type="text" class="form-control edit-date" placeholder="Date"/>
				    </div>
				  </div>
				  <br>
				  <div class="row">
				    <div class="col">
				      Start: <input type="time" class="form-control edit-start-time" placeholder="Start Time"/>
				    </div>
				    <div class="col">
				      End: <input type="time" class="form-control edit-end-time" placeholder="End Time"/>
				    </div>
				  </div>
				  <br>
				  <div class = "row">
				  	<div class = "col">
				  	 	<input type="text" class="form-control edit-description" placeholder="Description" name="description-for-edit"/>
				  	 </div>
				  </div>
				  <br>
				  <div class="row">
				  	<div class="col">
				      	<button type="button" class="btn btn-primary showEmailStuff">Invite People</button>
				    </div>
				  </div>
				  <div class="emailStuff" style="display: none">
					  <hr>
					  <div class=row>
					  	<div class="col">
					  	   <input type="email" class="form-control" id="emailforinvites" placeholder="name@example.com"/>
					  	 </div>
					  	 <div class="col">
					  	   <button type="button" class="btn btn-primary add-new-email">Add</button>
					  	 </div>
					  </div>
					  <br>
					  <div class=row>
					  	<div class="col">
					  	   <button type="button" class="btn btn-primary email-popover" data-container="body" data-toggle="popover" data-placement="left">
						  		View Email List
							</button>
							<div id="popover_content_wrapper" style="display: none">
							  <div class="list-of-emails" style="height:200px; overflow-y:auto">
							  	
							  </div>
							</div>
					  	   <input type="hidden" id="input-field-for-list" name="inputEmails" value=""/>
					  	 </div>
					  	 <div class="col">
					  	   <button type="button" class="btn btn-primary send-emails-button">Send Emails</button>
					  	 </div>
					  </div>
					  <hr>
					</div>
					<input type="hidden" id="editStartTime" name="editStartTime" value="3487"/>
		       	  	<input type="hidden" id="editEndTime" name="editEndTime" value="3487"/>
			      	<input type="hidden" id="locidforedit" name="locidforedit" value="${userLocViewId}"/> 
			      	<input type="hidden" id="bookingidforedit" name="bookingidforedit" value="0000"/>  
				
		        
			      </div>
			      <div class="modal-footer">
			      	<button type="submit" class="btn btn-primary">Save changes</button>
			        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
			      </div>
		      </form>
		    </div>
		  </div>
		</div>


	<script src="resources/js/jquerylib.js"></script>	        
	<script src="resources/js/popper.js"></script>
	<script src="resources/js/flip.min.js"></script>
	<script src="resources/js/bootstrap.js"></script>
	<script src="resources/js/bootstrap.min.js"></script>
	<script src="resources/js/moment.js"></script>
	<script src="resources/js/fullcalendar.js"></script>
	<script src="resources/js/daterangepicker.js"></script>
    <script>
	$(document).ready(function() {
		function FeatCard(name,number,feats)
        {
            var html = "" +
                "<div class=\"card\">\n"+
                "   <div class=\"text-center bg-dark text-light\" style=\"height:25px\">\n"+
                "       <h5>"+name+"'s Resources</h5>\n"+
                "   </div>\n"+
                "   <div class=\"card-body cardRes border \" style=\"height:100px\">\n";
            var middle = "";
            $.each(feats, function(index,value) {
                if(index % 4 == 0)
                    middle = middle + ("<div class=\"row align-items-center\">");
                middle = middle + "<div class=\"col-1 border rounded\"><img height=\"32\" class=\"mr-1\" src=\"resources/images/"+value.image+"\"/></div>" +
                    "<div class=\"col-2\"><h6><strong>"+value.count+"</strong></h6></div>";
                if((index+1) % 4 == 0 || (index+1) == feats.length)
                    middle = middle+ "</div>\n";
            });
            var end = "" +
                "   </div>" +
                "   <div class=\"bg-dark text-light text-center\" style=\"height:25px\">" +
                "        Count: " + feats.length +
                "   </div>"+
                "</div>";
            return (html+middle+end);
        }
        function ResCard(name,number)
        {
            var html = "" +
                "<div class=\"card\">\n"+
                "   <div class=\"text-center bg-dark text-light\" style=\"height:25px\">\n"+
                "       <h5>"+name+"</h5>\n"+
                "   </div>\n"+
                "   <div class=\"card-body cardRes border \" style=\"height:100px\">\n";
            var middle = "<center><img height=45 src='resources/images/${ResT}'></center>";
            console.log(middle);
            var end = "" +
                "   </div>" +
                "   <div class=\"bg-dark text-light text-center\" style=\"height:25px\">" +
                "        Room Number: " + number +
                "   </div>"+
                "</div>";
            return (html+middle+end);
        }
        
        if('${defaultResType}' == "Scrum"){
            console.log($(".resNameButton"));
            for(var i =0; i < $(".resNameButton").length; i++){
                $(".resNameButton")[i].childNodes[1].src = "resources/images/scrum.png";
            }
        }
        if('${defaultResType}' == "Class"){
            console.log($(".resNameButton"));
            for(var i =0; i < $(".resNameButton").length; i++){
                $(".resNameButton")[i].childNodes[1].src = "resources/images/class.png";
            }
        }
        if('${defaultResType}' == "Board"){
            console.log($(".resNameButton"));
            for(var i =0; i < $(".resNameButton").length; i++){
                $(".resNameButton")[i].childNodes[1].src = "resources/images/board.png";
            }
        }
        if('${defaultResType}' == "Rec"){
            console.log($(".resNameButton"));
            for(var i =0; i < $(".resNameButton").length; i++){
                $(".resNameButton")[i].childNodes[1].src = "resources/images/rec.png";
            }
        }
        if('${defaultResType}' == "break"){
            console.log($(".resNameButton"));
            for(var i =0; i < $(".resNameButton").length; i++){
                $(".resNameButton")[i].childNodes[1].src = "resources/images/break.png";
            }
        }
        if('${defaultResType}' == "Lounge"){
            console.log($(".resNameButton"));
            for(var i =0; i < $(".resNameButton").length; i++){
                $(".resNameButton")[i].childNodes[1].src = "resources/images/rec3.png";
            }
        }

        $(document).on("click", ".delete-email", function() {
               console.log($(this).parent());
               $(this).parent().remove();
        });
			console.log('${loc}');
			$(".Da-Occur, .We-Occur").click(function(){
				$("#occurDD").html($(this).html());
				$("#untilDate").css('display','inline');
				$(".custom-control-inline").css('display','none');
				$("#occur-type").val($(this).html()).trigger('change');;
			});
			$(".Sd-Occur").click(function(){
				$("#occurDD").html($(this).html());
				$("#untilDate").css('display','none');
				$(".custom-control-inline").css('display','none');
				$("#occur-type").val($(this).html()).trigger('change');;
			});
			$(".Mo-Occur").click(function(){
				$("#occurDD").html($(this).html());
				$("#untilDate").css('display','inline-block');
				$(".custom-control-inline").css('display','inline');
				$("#occur-type").val($(this).html()).trigger('change');;
			});
			$("#untilDate1").val(moment(moment().add(2,'M')).format("MM/DD/YYYY"));
			$('.email-popover').popover({
			    container: 'body',
			    html: true,
			    content: function() {
			        return $('#popover_content_wrapper').html();
			    }
			  });
			$('.deleteButton').popover({
			    container: 'body',
			    html: true,
			    content: function() {
			        return $('#deleteBooking').html();
			    }
			  });
			 $(".showEmailStuff").click(function(){
				 if($(".emailStuff").css("display") == 'none'){
				 	$(".emailStuff").css("display", "block");
				 }else{
					 $(".emailStuff").css("display", "none"); 
				 }
			 });
			$(".add-new-email").click(function(){
				if($("#emailforinvites").val().length > 0){
					$(".list-of-emails").append('<p>'+$("#emailforinvites").val()+'  <button type="button" class="close delete-email"><span>&times;</span></button></p>');
					$("#input-field-for-list").val($("#input-field-for-list").val() +"~"+$("#emailforinvites").val());
				}
				$("#emailforinvites").val("");
			});
			 $(".send-emails-button").click(function(){
				 ///invites?emails="+$("#input-field-for-list").val()
				var emails = $("#input-field-for-list").val();
				 emails = emails + "~EOL.com";
				 console.log(emails);
				 window.location.href = "sendInviteEmails/"+emails;
			 })
			$(".resNameButton").click(function(){
				$(".select").removeClass("select");
				$(this).addClass("select");
				var da = $(this).data("room");
                console.log(da);
                var cardHtml = FeatCard(da.name,da.num,da.feats);
                $("div#resContainer  div.back").html(cardHtml);
			});
			 $("#card").flip(
	                   {trigger: 'manual'}
	               );
	               $("#card").click(function(){
	                   //var old =$("div#resContainer  div.back").html();
	                   //console.log(old);
	                   //$("div#resContainer  div.back").html("");
	                   $("#card").flip("toggle");
	                   //$("#card").on('flip:done',function () {
	                       //$("div#resContainer  div.back").html(old);

	                       //$("div#resContainer  div.back").redraw();
	                   //});

	               });
			var events_array = [
				<c:forEach varStatus="status" var= "bkg" items="${bookings}">
					{
						title: '${bkg.roomName} - ${bkg.resName}',
						start: '${bkg.startTime}',
						end: '${bkg.endTime}',
						color: '${bkg.color}',
						description: '${bkg.description}',
						id:'${bkg.bookingId}',
						resName: '${bkg.resName}'
						
					}<c:if test="${not status.last}">,</c:if>
			
				</c:forEach>
			];
			
	       	
	       	
	           $('.dropdown-toggle').dropdown();
	           $('.leftmenutrigger').on('click', function(e) {
	               $('.side-nav').toggleClass('open');
	               e.preventDefault();
	           });
	           var $calendar = $('#calendar').fullCalendar(
	               {
	                   weekends: false,
	                   allDaySlot: false,
	                   defaultView: 'agendaWeek',
	                   nowIndicator: true,
	                   minTime: "07:00:00",
	                   maxTime: "21:00:00",    
	                   header:{
	                       left: 'prev,next',
	                       center: 'title',
	                       right: 'today,month,agendaDay,agendaWeek'
	                   },
	                  events: events_array,
	                   selectable: true,
	                   //this is where selection happens
	                   select: function(start,end,jsEvent,view){
	                	   var resC = $(".select").data("room");
                           console.log(resC);
	                	   if(start.isBefore(moment().subtract(1,"days")) || start.isAfter(moment(moment().add(61,'days'), 'YYYY-MM-DD[T]HH:mm[Z]'))) {
	                	        $(".alert-modal-sm").modal('toggle');
	                	    }else{
	                	    	if(moment().diff(start, "minutes") < 0){
		                	    	$("#dateRange").val(moment(start).format("MM/DD/YYYY")); 
		                	    	$("#startTime").val(moment(start).format("HH:mm"));
		                	    	$("#endTime").val(moment(end).format("HH:mm"));
		                	    	console.log($(".select"));
		                	    	if($(".select").length != 0){
		                                $(".front").html(ResCard(resC.name,resC.num));
		                	    		//$(".card-title").html($(".select")[0].textContent);
		                	    		$("#startTimeStamp").val(moment(start).format("MM/DD/YYYY")+ " " + moment(start).format("HH:mm"));
			           					$("#endTimeStamp").val(moment(start).format("MM/DD/YYYY")+ " " + moment(end).format("HH:mm"));
			    	                   	$('#exampleModal').modal('toggle');
			    	                   	$('.select').siblings('input').attr('name','resourceid');
			    	                   	$('#resv').append($('.select').siblings('input'));
			    	                   
			    	                   
			    	                   	$("#occur-type, #untilDate1, #dateRange, #startTime, #endTime").on('change',function(){
			    	                   		var startTime = moment($("#startTime").val(),"HH:mm");
			    	                   		var endTime = moment($("#endTime").val(),"HH:mm");
			                    	    	var date = moment($("#dateRange").val(),"MM/DD/YYYY");
			                    	    	var list = [];
			                    	    	events_array.forEach((element,index)=> {
			                    	    		var diff = end.diff(start,"minutes");
			                    	    		if(element.resName == $(".select").data("room").name){
			                    	    			console.log();
			                    	    			console.log();
			                    	    			if(moment(element.start).format('MM/DD/YYYY') == moment($("#startTimeStamp").val()).format('MM/DD/YYYY')){
			                    	    				if(moment(element.start).isBetween(moment($("#startTimeStamp").val()),moment($("#endTimeStamp").val()))){
				                    	    				console.log("hello event clashing: " );
				                    	    				console.log(element);
				                    	    				alert("This room is booked for the event: " + element.title + " for date " + moment(element.start).format('MM/DD/YYYY') + ". Please choose another time or room");
				                    	    				$("#startTime").val(moment(start).format("hh:mm"));
				        		                	    	$("#endTime").val(moment(end).format("hh:mm"));
				                    	    				}
			                    	    			}
			                    	    			
			                    	    		}
			                    	    	});
		    	                   			
		    	                   			if(date > moment($("#untilDate1").val(),"MM/DD/YYYY")){
		    	                   				alert("Date cannot be after the second date");
		    	                   				$("#dateRange").val(moment(start).format("MM/DD/YYYY"));
		    	                   				$("#untilDate1").val(moment(moment().add(2,'M')).format("MM/DD/YYYY"));
		    	                   			}
		    	                   			if(endTime.diff(startTime, "minutes") < 0 ){
		    	                   				alert("Start Time caanot be after end time");
		    	                   				$("#startTime").val(moment(start).format("hh:mm"));
		    	                   				$("#endTime").val(moment(end).format("hh:mm"));
		    	                   			}
		    	                   			if(date < moment()){
		    	                   				alert("Date cannot be an older date");
		    	                   				$("#dateRange").val(moment(start).format("MM/DD/YYYY"));
		    	                   			}
			    	                   		if($("#occur-type").val() == "Single Day"){
			    	                   			$("#startTimeStamp").val(moment(date).format("MM/DD/YYYY")+ " " + moment(startTime).format("HH:mm"));
				    	                   		$("#endTimeStamp").val(moment(date).format("MM/DD/YYYY")+ " " + moment(endTime).format("HH:mm"));
				    	                   		//console.log($("#endTimeStamp").val());
			    	                   			//console.log($("#startTimeStamp").val());
			    	                   		}else if($("#occur-type").val() == "Daily"){
			    	                   			$("#startTimeStamp").val("");
			    	                   			$("#endTimeStamp").val("");
			    	                   			while(date < moment($("#untilDate1").val(),"MM/DD/YYYY")){
			    	                   				if($("#endTimeStamp").val() == ""){
			    	                   					$("#startTimeStamp").val(moment(date).format("MM/DD/YYYY")+ " " + moment(startTime).format("HH:mm"));
						    	                   		$("#endTimeStamp").val(moment(date).format("MM/DD/YYYY")+ " " + moment(endTime).format("HH:mm"));
			    	                   				}else{
			    	                   					$("#startTimeStamp").val($("#startTimeStamp").val() + "," + moment(date).format("MM/DD/YYYY")+ " " + moment(startTime).format("HH:mm"));
			    	                   					$("#endTimeStamp").val($("#endTimeStamp").val() + "," + moment(date).format("MM/DD/YYYY")+ " " + moment(endTime).format("HH:mm"));
			    	                   				}
			    	                   				date.add(1, 'days');
			    	                   			}
			    	                   			//console.log($("#endTimeStamp").val());
			    	                   			//console.log($("#startTimeStamp").val());
			    	                   		}else if($("#occur-type").val() == "Weekly"){
			    	                   			$("#startTimeStamp").val("");
			    	                   			$("#endTimeStamp").val("");
			    	                   			while(date < moment($("#untilDate1").val(),"MM/DD/YYYY")){
			    	                   				if($("#endTimeStamp").val() == ""){
			    	                   					$("#startTimeStamp").val(moment(date).format("MM/DD/YYYY")+ " " + moment(startTime).format("HH:mm"));
						    	                   		$("#endTimeStamp").val(moment(date).format("MM/DD/YYYY")+ " " + moment(endTime).format("HH:mm"));
			    	                   				}else{
			    	                   					$("#startTimeStamp").val($("#startTimeStamp").val() + "," + moment(date).format("MM/DD/YYYY")+ " " + moment(startTime).format("HH:mm"));
			    	                   					$("#endTimeStamp").val($("#endTimeStamp").val() + "," + moment(date).format("MM/DD/YYYY")+ " " + moment(endTime).format("HH:mm"));
			    	                   				}
			    	                   				date.add(7, 'days');
			    	                   			}
			    	                   			//console.log($("#endTimeStamp").val());
			    	                   			//console.log($("#startTimeStamp").val());
			    	                   		}else if($("#occur-type").val() == "More Options"){
			    	                   			console.log("More Options");
			    	                   		}
			    	                   		//start = moment($("#startTimeStamp").val());
			    	                   	});
			    	                   
			    	                   			    	                       /*if(title != null){
		    	                           var event = {
		    	                               title: title.trim() != "" ? title: "New event",
		    	                               start: start,
		    	                               end: end
		    	                           };
		    	                           $calendar.fullCalendar("renderEvent", event, true);
		    	                       }*/
		                	    	}else{
		                	    		$(".valid-modal-sm").modal('toggle');
		                	    	}
		                	    	
	    	                       $calendar.fullCalendar("unselect");
	                	    	}else{
	                	    		$(".alert-modal-sm").modal('toggle');
	                	    	}
    	                    }
	                   },
	                   editable: true,
	                   eventClick: function(event,jsEvent, view){
	                   	$('.edit-modal').modal('toggle');
	                   	//console.log(event);
	                   	$("#input-field-for-list").val(event.id + "~" + event.resName);
	                   	$(".edit-date").val(moment(event.start).format("MM/DD/YYYY"));
	                   	$(".edit-start-time").val(moment(event.start).format("HH:mm"));
            	    	$(".edit-end-time").val(moment(event.end).format("HH:mm"));
            	    	$(".edit-description").val(event.description);
            	    	$("#bookingidforedit").val(event.id);
            	    	$(".edit-date").change(function(){
            	    		var start = moment($(".edit-start-time").val(),"HH:mm");
                	    	var end = moment($(".edit-end-time").val(),"HH:mm");
                	    	var date = moment($(".edit-date").val(),"MM/DD/YYYY");
                	    	//console.log(date);
                	    	$("#editStartTime").val(moment(date).format("MM/DD/YYYY")+ " " + moment(start).format("HH:mm"));
           					$("#editEndTime").val(moment(date).format("MM/DD/YYYY")+ " " + moment(end).format("HH:mm"));
            	    	});
			           $(".edit-start-time").change(function(){
			   	    		var start = moment($(".edit-start-time").val(),"HH:mm");
			       	    	var end = moment($(".edit-end-time").val(),"HH:mm");
			       	    	var date = moment($(".edit-date").val(),"MM/DD/YYYY");
			       	    	//console.log(date);
			       	    	$("#editStartTime").val(moment(date).format("MM/DD/YYYY")+ " " + moment(start).format("HH:mm"));
			  					$("#editEndTime").val(moment(date).format("MM/DD/YYYY")+ " " + moment(end).format("HH:mm"));
			   	    	});
						$(".edit-end-time").change(function(){
							var start = moment($(".edit-start-time").val(),"HH:mm");
					    	var end = moment($(".edit-end-time").val(),"HH:mm");
					    	var date = moment($(".edit-date").val(),"MM/DD/YYYY");
					    	//console.log(date);
					    	$("#editStartTime").val(moment(date).format("MM/DD/YYYY")+ " " + moment(start).format("HH:mm"));
								$("#editEndTime").val(moment(date).format("MM/DD/YYYY")+ " " + moment(end).format("HH:mm"));
						});
            	    	
	                   },
	                   eventRender: function(event, element) {
	                	   //console.log(event);
	                	   //console.log(element)
	                   }
	                   
	               }
	           )
	           $('#calendar').fullCalendar('option', 'height', 540);
	           
	           $("#startTime").change(function(){
	        	   $("#startTimeStamp").val($("#dateRange").val()+ " " + $("#startTime").val());
	           });
	           $("#endTime").change(function(){
	        	   $("#endTimeStamp").val($("#dateRange").val()+ " " + $("#endTime").val());
	           });
	           $("#dateRange").change(function(){
	        	   $("#startTimeStamp").val($("#dateRange").val()+ " " + $("#startTime").val());
	        	   $("#endTimeStamp").val($("#dateRange").val()+ " " + $("#endTime").val());
	           });
	
	           $("#card").flip();
	           $('input[name="daterange"]').daterangepicker({
	               opens: 'left'
	             }, function(start, end, label) {
	               console.log("A new date selection was made: " + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD'));
	           });
	           $("input:checkbox").on('click', function() {
	           	  // in the handler, 'this' refers to the box clicked on
	           	  var $box = $(this);
	           	  if ($box.is(":checked")) {
	           	    // the name of the box is retrieved using the .attr() method
	           	    // as it is assumed and expected to be immutable
	           	    var group = "input:checkbox[name='" + $box.attr("name") + "']";
	           	    // the checked state of the group/box on the other hand will change
	           	    // and the current value is retrieved using .prop() method
	           	    $(group).prop("checked", false);
	           	    $box.prop("checked", true);
	           	  } else {
	           	    $box.prop("checked", false);
	           	  }
	           	});
	           var currentDate = $('#calendar').fullCalendar('getDate');
	           $(document).on("click", ".confirmDeleteButton", function() {
	        	   window.location.href = "deleteBooking/"+$("#bookingidforedit").val(); 
	        	   console.log($("#bookingidforedit").val());
	        	});
	           
	           var beginOfWeek = currentDate.startOf('week');
	           var endOfWeek = currentDate.endOf('week');
	           var start = $('#calendar').fullCalendar('getView').start;
	           var end = $('#calendar').fullCalendar('getView').end;
	           var url = "getBookings?start=" + start + "&end=" + end;
	           //window.location.href=url;
	           $('.fc-prev-button').click(function() {
	        	   	var date = $(".fc-center")[0].childNodes[0].textContent;
	           		var dateArray = date.split(" ");
	           		var startDate = dateArray[1] + "-"+dateArray[0]+"-"+dateArray[4];
	           		var endDate = dateArray[3].split(",")[0] + "-"+dateArray[0]+"-"+dateArray[4];
	           		//window.location.href = "getBookings?start="+startDate+"&end="+endDate;
	        	 });
	           $('.fc-next-button').click(function() {
	        	   	var date = $(".fc-center")[0].childNodes[0].textContent;
	           		var dateArray = date.split(" ");
	           		var startDate = dateArray[1] + "-"+dateArray[0]+"-"+dateArray[4];
	           		var endDate = dateArray[3].split(",")[0] + "-"+dateArray[0]+"-"+dateArray[4];
	        	});
	       	
	           function clashingCheck(List,event){
	        	   
	           }
	      
    		});
    </script>
</body>
</html>