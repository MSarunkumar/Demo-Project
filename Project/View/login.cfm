<cfheader name="expires" value="#now()#">
<cfheader name="pragma" value="no-cache">
<cfheader name="cache-control" value="no-cache, no-store, must-revalidate">

<cfif  structKeyExists(session, "adminEmail")>
           <cflocation addtoken="no" url="adminDashboard.cfm">
	<cfelseif structKeyExists(session, "studentEmail")>
	        <cflocation addtoken="no" url="studentDashboard.cfm">
</cfif>

<html>
	<head>
		<link href="https://fonts.googleapis.com/css?family=Ubuntu" rel="stylesheet">
		<link rel="stylesheet" type="text/css" href="../assets/css/login.css">
		<title>
			Online Examination Portal Home page
		</title>


	</head>
	<body ><h3>
		<header>
		 <img src="../assets/image/portal.JPG" alt="Online Examination Portal" width="900px">
        </header>

		<div><ul>
			 <li><a href="../index.cfm">Login</a></li>
		     <li><a href="signup.cfm">Register</a></li>
		     <li><a href="../index.cfm">About </a></li>
		     <li><a href="../index.cfm"> Home </a></li>
	         </ul>
        </div>
		<div id="bodyid">


         <div id="err" style="color:red;font-size:13px;margin-left:250px;">
			<cfset errorArray=["Invalid Formate Email Id/Password",
			                    "Does Not Exist Email Id/Password",
			                    "Invalid Email Id/Password"]>
				<cfif isdefined("URL.errID")>
				<cfif URL.errId EQ 1>
					<cfoutput>#errorArray[1]#</cfoutput>
				</cfif>
				<cfif URL.errId EQ 2>
					<cfoutput>#errorArray[2]#</cfoutput>
				</cfif>
				<cfif URL.errId EQ 3>
					<cfoutput>#errorArray[3]#</cfoutput>
				</cfif>
				<cfelse>
				</cfif>
		 </div>
			<cfform action= "../Controller/loginAction.cfm" onsubmit="return formValidation()" method="POST" id='form'>
				<center>
					<h1>
						User Login
					</h1>
				</center>
				<div class="LContainer">
					Email ID
				</div>
				<cfinput type='text' id= 'uid' name='uid' placeholder='User Id' class="input_box" maxlength="50" onblur="emailValid()">
				<div id='eid'> </div>
				<br>
				<div class="LContainer">
					Password
				</div>
				<cfinput type='Password' id='password' name='password'  class="input_box" maxlength="16" onblur="passwordValid()">
		        <div id='pid'> </div>
				<br>

				<cfinput name='login' type='Submit' value='Login' id='btn' class='btn'>
            <div id="forgot">
			 <br><br>
               <a href="forgotPassword.cfm">Forgot Password ? </a> <br> <br>
		           <a href="signup.cfm">Not Registered yet ? </a>
				</div>
				</div>
				<br>

			</cfform>
			<script type="text/javascript" src="../assets/js/login.js"> </script>
           </div>
          <br> <br></h3>
	</body>
</html>