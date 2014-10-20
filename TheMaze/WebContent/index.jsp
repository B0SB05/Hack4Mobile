<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!-- Start Header -->
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
    <meta charset="utf-8">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="css/bootstrap.min.css">

</head>
<title>What did he Say!</title>
<body>
<!-- Start NAv -->
    <nav class="navbar navbar-inverse">
      <div class="container-fluid">
        
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>                        
          </button>
          <a class="navbar-brand" href="#">What did he Say!</a>
        </div>

        <div class="collapse navbar-collapse" id="myNavbar">
          <ul class="nav navbar-nav">
            <li class="active"><a href="#Home" data-toggle="modal">Home</a></li>
            <li><a href="#rate" data-toggle="#RateThem" data-toggle="modal">Rate Them !</a></li>
            <li><a href="#know" data-target="#KnowThem" data-toggle="modal">Know Them !</a></li>
          </ul>
          <ul class="nav navbar-nav navbar-right">
            <li><a href="#"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
            <li><a href="#"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
          </ul>

        </div>
      </div>
    </nav>
    <!-- END Nav -->

	 <div class="container" id="Home" >
      <div class="jumbotron">
        <h1>My first Bootstrap website!</h1>      
        <p>This page will grow as we add more and more components from Bootstrap...</p>      
      </div>
    </div>
<!-- End Header -->


<!-- Start Body-->


<div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="Knowthem" id="KnowThem" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content"> 
      <div class="jumbotron">
      	We are going to discovery Who are they !  
      </div>
    </div>
</div>
</div>

<!-- sRating -->

<div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="RateThem" id="RateThem" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content"> 
<!--Sector Selection -->
 
   <div class="form-group" >
  	<label for="sel1">Which One !</label>
  		<select class="form-control" id="sel1">
    		<option>1</option>
    		<option>2</option>
    		<option>3</option>
    		<option>4</option>
  		</select>
	</div>
<!-- End of Sector Selection -->

      <div class="form-group">  
		<label class="radio-inline"><input type="radio" name="optradio"> sad </label>
		<label class="radio-inline"><input type="radio" name="optradio"> Determined </label>
		<label class="radio-inline"><input type="radio" name="optradio"> Happy!</label>
	</div>        


      <div class="form-group">
  		<label for="comment">Comment:</label>
  		<textarea class="form-control" rows="5"  id="comment"></textarea>
	</div>


        <div class="form-group">        
          <div class="col-sm-offset-2 col-sm-10">
            <button type="submit" class="btn btn-default">Say!</button>
          </div>
        </div> 

</div>
</div>
</div>
<!-- eRating-->
<!-- End Body -->


<!-- start footer -->
<!-- Optional: Include the jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<!-- Optional: Incorporate the Bootstrap JavaScript plugins -->
<script src="js/bootstrap.min.js"></script>

</body>

</html>
<!-- End Footer -->