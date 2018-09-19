//var events_array = $("#bookingData");
//    	events_array.booking =
//	    	[
//	    		<c:forEach varStatus="status" var= "bkg" items="${bookings}">
//	    			{
//	    				start: '${bkg.startTime}',
//	    				end: '${bkg.endTime}',
//	    				description: '${bkg.description}'
//	    			}<c:if test="${not status.last}">,</c:if>
//	    		
//	    		</c:forEach>
//	    	];
//    		testIt();



$(document).ready(function() {
			console.log('${loc}');
			function a(things)
			{
				return things;
			}
			a;
        	var id = $(".user_id")[0].textContent;
        	var url = "getUserLocation/";
        	url = url.concat(id);
        	var events_array = [
                {
                    title: "Scrum Meeting",
                    start: moment().startOf('month'),
                    end: moment().startOf('month').add(10, 'days'),
                    color: "red"
                },
                {
                    title: "Board Meeting",
                    start: moment().startOf('month').add(7,"days"),
                    end: moment().startOf('month').add({'days': 7, 'hours': 3}),
                    color: "green"
                },
                {
                    title: "Scrum Meeting",
                    start: moment().startOf('month').add({'days': 5, 'hours': 9}),
                    end: moment().startOf('month').add({'days': 5, 'hours': 13}),
                    color: "blue"
                }
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
                    	console.log(start._d);
                    	var a = start._d + " ";
                    	//var array = a.text().split(/\s+/);
                    	//console.log(array);
                    	console.log(end);
                    	$('#exampleModal').modal('toggle');
                        if(title != null){
                            var event = {
                                title: title.trim() != "" ? title: "New event",
                                start: start,
                                end: end
                            };
                            $calendar.fullCalendar("renderEvent", event, true);
                        }
                        $calendar.fullCalendar("unselect");
                    },
                    editable: true,
                    eventClick: function(event,jsEvent, view){
                    	
                    	

                        var newTitle = prompt("Enter a new title for this event", event.title);
                        if(newTitle != null){
                            event.title = newTitle.trim() != "" ? newTitle : event.title;
                            $calendar.fullCalendar("updateEvent", event);
                        }
                    }
                }
            )
            $('#calendar').fullCalendar('option', 'height', 540);
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
            var beginOfWeek = currentDate.startOf('week');
            var endOfWeek = currentDate.endOf('week');
            console.log("hoiii");
            var start = $('#calendar').fullCalendar('getView').start;
            var end = $('#calendar').fullCalendar('getView').end;
            var url = "getBookings?start=" + start + "&end=" + end;
            //window.location.href=url;
            
});