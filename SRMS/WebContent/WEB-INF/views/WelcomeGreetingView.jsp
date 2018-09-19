<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<head>
   <meta charset="ISO-8859-1">
    <title>
        Welcome!
    </title>
    <meta http-equiv="Refresh" content="6;url= landing">
    <link rel="stylesheet" href="resources/css/animate.css"/>
    <link rel="stylesheet" href="resources/css/bootstrap.css"/>
    <link rel="stylesheet" href="resources/css/all.css"/>
  <style>
    body {
      width: 100%;
      height: 100%;
      overflow-y:hidden;
      font-family: 'Muli', 'Helvetica', 'Arial', 'sans-serif';
    }


    .btn{
      padding: 30px;
      margin: 10px;
      border-radius: 180px;
      -webkit-border-radius: 28;
      -moz-border-radius: 28;
      border-radius: 28px;
      font-family: Arial;
      color: #fafafa;
      font-size: 27px;
      padding: 19px;
      transition: all 0.5s;
      cursor: pointer;
    }
    
    .btn span {
      cursor: pointer;
      display: inline-block;
      position: relative;
      transition: 0.5s;
    }

    .btn span:after {
      content: '\00bb';
      position: absolute;
      opacity: 0;
      top: 0;
      right: -20px;
      transition: 0.5s;
    }

    .btn:hover span {
      padding-right: 25px;
    }

    .btn:hover span:after {
      opacity: 1;
      right: 0;
    }
    .btn:hover {
      background: #2079b0;
      background-image: -webkit-linear-gradient(top, #2079b0, #0b59ce);
      background-image: -moz-linear-gradient(top, #2079b0, #0b59ce);
      background-image: -ms-linear-gradient(top, #2079b0, #0b59ce);
      background-image: -o-linear-gradient(top, #2079b0, #0b59ce);
      background-image: linear-gradient(to bottom, #2079b0, #0b59ce);
      text-decoration: none;
      }
    p {
      font-size: 18px;
      line-height: 1.5;
      margin-bottom: 20px;
    }

    section {
      padding: 100px 0;
    }

    section h2 {
      font-size: 50px;
    }

    header.masthead {
      position: relative;
      width: 100%;
      padding-top: 150px;
      padding-bottom: 100px;
      color: white;
      /*background: linear-gradient(to bottom, rgba(22, 22, 22, 0.1) 0%, rgba(22, 22, 22, 0.5) 75%, #161616 100%), url("../img/bg-masthead.jpg");
      background: url("../img/bg-pattern.png"), #00ff37;
      background: url("../img/bg-pattern.png"), -webkit-linear-gradient(to left, #932ac7, #dc2430);
      background: url("../img/bg-pattern.png"), linear-gradient(to left, #73f708, #dc2430);I*/
      /*background: #000000;  /* fallback for old browsers */
      background: -webkit-linear-gradient(-45deg, #434343, #000000);
      background: linear-gradient(-45deg, #434343, #000000); 
      background-size: 400% 400%;
      -webkit-animation: Gradient 15s ease infinite;
      -moz-animation: Gradient 15s ease infinite;
      animation: Gradient 15s ease infinite;
      }

    @-webkit-keyframes Gradient {
      0% {
        background-position: 0% 50%
      }
      50% {
        background-position: 100% 50%
      }
      100% {
        background-position: 0% 50%
      }
    }

    @-moz-keyframes Gradient {
      0% {
        background-position: 0% 50%
      }
      50% {
        background-position: 100% 50%
      }
      100% {
        background-position: 0% 50%
      }
    }

    @keyframes Gradient {
      0% {
        background-position: 0% 50%
      }
      50% {
        background-position: 100% 50%
      }
      100% {
        background-position: 0% 50%
      }
    }

    header.masthead .header-content {
      max-width: 500px;
      margin-bottom: 50px;
      text-align: center;
    }

    header.masthead .header-content h1 {
      font-size: 30px;
    }

    header.masthead .device-container {
      max-width: 325px;
      margin-right: auto;
      margin-left: auto;
    }
    @media (min-width: 992px) {
      header.masthead {
        height: 100vh;
        min-height: 775px;
        padding-top: 0;
        padding-bottom: 0;
      }
      header.masthead .header-content {
        margin-bottom: 0;
        text-align: left;
      }
      header.masthead .header-content h1 {
        font-family: Georgia, 'Times New Roman', Times, serif;
        font-size: 60px;
      }
      header.masthead .device-container {
        max-width: 325px;
      } 
    }
  </style>
  <body id="page-top">

    <header class="masthead">
      <div class="container h-100">
        <div class="row h-100">
          <div class="col-lg-7 my-auto">
            <div class="header-content mx-auto">
                <h1 class = "mb-5">Thanks for Checking In!</h1>
                <img src="resources/images/book-logo.png" alt="logo" style="height:65%; width:65%; padding-bottom:0px; "/>
                <br>
            </div>
          </div>

              </div>
            </div>
    </header>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  </body>

</html>