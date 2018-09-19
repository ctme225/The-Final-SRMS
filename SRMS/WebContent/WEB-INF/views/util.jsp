<%--
  Created by IntelliJ IDEA.
  User: owile
  Date: 9/8/2018
  Time: 2:54 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="<core:url value="/resources/css/bootstrap.css"/>">
    <link rel="stylesheet" href="<core:url value="/resources/css/all.css"/>">
    <link rel="stylesheet" href="<core:url value="/resources/css/srms.css"/>">
    <jsp:include page="navbar.jsp" />
    
    <title>Utilization of Resources</title>
</head>
<body>
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
            }
            @media (max-width: 600px){ .welcome-tag{ display: none} }
            </style>

<div class="container d-flex justify-content-between mt-5 pb-5 w-75">
    <div class="dropdown pr-2">
        <button class="btn btn-secondary dropdown-toggle" type="button" id="Rangedropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            Time Frame
        </button>
        <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
            <a class="dropdown-item" href="setDefaults/0/1">Daily</a>
            <a class="dropdown-item" href="setDefaults/0/2">Weekly</a>
            <a class="dropdown-item" href="setDefaults/0/3">Monthly</a>
            <a class="dropdown-item" href="setDefaults/0/4">Quarterly</a>
            <a class="dropdown-item" href="setDefaults/0/5">Yearly</a>
        </div>

    </div>
    <div class="dropdown ">
        <button class="btn btn-secondary dropdown-toggle" type="button" id="Locationdropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            Location
        </button>
        <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
            <core:forEach var="i" items="${locations}">
                <a class="dropdown-item" href="setDefaults/${i.locId}/0">${i.locName}-${i.locCity},${i.locState}</a>
            </core:forEach>
        </div>
    </div>
</div>

<div class="text-center"><h1>Resource Utilization Report</h1></div>

<div class="container" id="containIt">

    <!--Row with two equal columns-->
    <div class="row">
        <div class="col-lg-6 border border-dark">
            <canvas id="myChart" width="400" height="300"></canvas>
        </div>
        <div class="col-lg-6 border border-dark">
            <canvas id="donutChart" width="400" height="300"></canvas>
        </div>
    </div><br>
    <div clss="pt-3"><button class="btn btn-primary">PDF</button></div>
</div>
<script src="<core:url value="/resources/js/Chart.bundle.min.js"/>"></script>
<script src="<core:url value="/resources/js/jquery-3.3.1.min.js"/>"></script>
<script src="<core:url value="/resources/js/popper.js"/>"></script>
<script src="<core:url value="/resources/js/bootstrap.js"/>"></script>
<script src="<core:url value="/resources/js/srms.js"/>"></script>
<script>
    $(function() {

        var dummy = [<core:forEach items="${chartData}" var="dat" varStatus="i">
            '${dat.numDays}' <core:if test="${not i.last}">,</core:if>
            </core:forEach>];
        var dummy2 = [<core:forEach items="${chartData}" var="dat" varStatus="i">
            '${dat.title}' <core:if test="${not i.last}">,</core:if>
            </core:forEach>];
        var ctx = $('#myChart');
        var myChart = new Chart(ctx, {
            type: 'horizontalBar',

            data: {
                labels: dummy2,
                datasets: [
                    {
                        label: '# of Votes',
                        data: dummy,
                        backgroundColor: [
                            '#cc2462',
                            '#bf1616',
                            '#ecf24b',
                            '#0faf22',
                            '#1c87d8',
                            '#e26c90'
                        ],
                        borderColor: [
                            '#cc2462',
                            '#bf1616',
                            '#ecf24b',
                            '#0faf22',
                            '#1c87d8',
                            '#e26c90'
                        ],
                        borderWidth: 1
                    }
                ]
            },
            options: {
                legend:{
                    display: true,
                    label:{
                        fontSize: 28,
                        fontStyle: "bold",
                        usePointStyle: true
                    }
                },
                scales: {
                    yAxes: [
                        {
                            ticks: {
                                beginAtZero: true
                            }
                        }
                    ]
                },
                onClick:function(event){
                    console.log(this.active);
                    var selected = this.active[0]._index;
                    // send dummy2[index] to get its resources so reources by location and resourcetype and date
                    console.log(typeof (dummy2[selected]));
                    //ajax to database? Or show pie when we refresh?
                    var place = "Java/";
                    var loc = "Utilization/";
                    loc = loc.concat(dummy2[selected]);
                    console.log(loc);
                    window.location.href = loc;
                    $.post();
                }
            }
        });
        var pieData =[1];
        var pieLabel=['Click on bars to the left for details'];
        <core:if test="${pieData.size() gt 0}">
        pieData = [<core:forEach items="${pieData}" var="dat" varStatus="i">
            "${dat.numDays}" <core:if test="${not i.last}">,</core:if>
            </core:forEach>];
        pieLabel = [<core:forEach items="${pieData}" var="dat" varStatus="i">
            "${dat.title}" <core:if test="${not i.last}">,</core:if>
            </core:forEach>];
        </core:if>
        var ctx1 = $('#donutChart');
        var data1 = {
            labels: pieLabel,
            datasets: [
                {
                    label: 'TeamA Score',
                    data: pieData,
                    backgroundColor: [
                        <core:if test="${pieData.size() eq 0 }">
                        'rgba(0, 0, 0, 0.1)',</core:if>
                        '#5d8aa8',
                        '#f0f8ff',
                        '#e32636',
                        '#efdecd',
                        '#e52b50',
                        '#ffbf00',
                        '#ff033e',
                        '#9966cc',
                        '#a4c639',
                        '#f2f3f4',
                        '#cd9575',
                        '#915c83',
                        '#faebd7',
                        '#008000',
                        '#8db600',
                        '#fbceb1',
                        '#00ffff',
                        '#7fffd4',
                        '#4b5320',
                        '#e9d66b',
                        '#b2beb5'
                    ],
                    borderColor: [
                        '#5d8aa8',
                        '#f0f8ff',
                        '#e32636',
                        '#efdecd',
                        '#e52b50',
                        '#ffbf00',
                        '#ff033e',
                        '#9966cc',
                        '#a4c639',
                        '#f2f3f4',
                        '#cd9575',
                        '#915c83',
                        '#faebd7',
                        '#008000',
                        '#8db600',
                        '#fbceb1',
                        '#00ffff',
                        '#7fffd4',
                        '#4b5320',
                        '#e9d66b',
                        '#b2beb5'
                    ],
                    borderWidth: [1, 1, 1, 1, 1]
                }
            ]
        };
        //options
        var options = {
            responsive: true,
            title: {
                display: true,
                position: 'top',
                text: 'Resources Utilization by Room',
                fontSize: 24,
                fontColor: '#111'
            },
            legend: {
                display: true,
                position: 'bottom',
                labels: {
                    fontColor: '#333',
                    fontSize: 16
                }
            }
        };
        //create Chart class object
        var chart1 = new Chart(ctx1, {
            type: 'doughnut',
            data: data1,
            options: options
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