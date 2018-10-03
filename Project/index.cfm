



<html>
	<head>
		<link href="https://fonts.googleapis.com/css?family=Ubuntu" rel="stylesheet">
		<link rel="stylesheet" type="text/css" href="/Project/Assets/css/index.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<title>
			Online Examination Portal Home page
		</title>
		<script>
          $().ready(function() {
          if(document.referrer != 'http://localhost:5000/'){
              history.pushState(null, null, '');
              window.addEventListener('popstate', function () {
              history.pushState(null, null, '');
            });
           }
        });
     </script>


	</head>
	<body ><h3>
		<header>
		 <img src="assets/image/portal.JPG" alt="Online Examination Portal" width="900px">
        </header>

		<div><ul>
			 <li><a href="/Project/View/login.cfm">Login</a></li>
		     <li><a href="View/signup.cfm">Register</a></li>
		     <li><a href="index.cfm">About </a></li>
		     <li><a href='index.cfm'> Home </a></li>
	         </ul>
        </div>
		<div id="bodyid">
		   <a href="/Project/View/login.cfm"><img src="/Project/Assets/image/online1.jpg" style="width:170px; height:190px"
		    alt="online exam logo" hspace="150"></a>
		    <a href="/Project/View/login.cfm"><img src="/Project/Assets/image/online2.jpg" style="width:170px; height:190px"
		    alt="online exam logo" hspace="100"></a>
		    <a href="/Project/View/login.cfm"><img src="/Project/Assets/image/online3.jpg" style="width:170px; height:190px"
		    alt="online exam logo" hspace="150"></a>
		    <a href="/Project/View/login.cfm"><img src="/Project/Assets/image/online6.jpg" style="width:170px; height:190px"
		    alt="online exam logo" hspace="100"></a>
		    <br>
		    <marquee direction="left" style="color:RED">Online Examination System </marquee>
		</div>
        <br> <br>

    	<footer>
	    <img src="/Project/Assets/image/footer.JPG" alt="Online Examination Portal " width="900px" >
        </footer>
		</h3>
	</body>
</html>