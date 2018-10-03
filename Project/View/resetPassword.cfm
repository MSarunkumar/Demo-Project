<cfif NOT isDefined("URL.id")>
	<cflocation addtoken="no" url="../error/error.cfm">
<cfelse>
	<cfset VARIABLES.currentTime=#DateTimeFormat(now(), "MM d yyyy HH:nn:ss ")# />
	<cfset FP=CreateObject("component", "Project.Model.forgotPassword") />

	<cfset VARIABLES.times=FP.getTime(URL.id) />

	  <cfif VARIABLES.times EQ "">
	    <cflocation addtoken="no" url="badRequest.cfm">
        </cfif>

	<cfset VARIABLES.sec=Datediff("s",VARIABLES.times,VARIABLES.currentTime) />
	<cfset VARIABLES.hours=int(variables.sec/3600) />
	<cfif VARIABLES.hours GT 10>
		<cfoutput>
			<h1>
				The Link has been Expire.
				<a href="../index.cfm">
					Go Back
				</a>
			</h1>
		</cfoutput>
	<cfelse>
		<cfset VARIABLES.email= FP.getEmail(URL.id) />
		<html>
			<head>
				<link href="https://fonts.googleapis.com/css?family=Ubuntu" rel="stylesheet">
				<link rel="stylesheet" type="text/css" href="../assets/css/login.css">
				<title>
					Recover Password
				</title>
			</head>
			<body >
				<h3>
					<header>
						<img src="../assets/image/portal.JPG" alt="Online Examination Portal" width="900px">
					</header>
					<div>
						<ul>
							<li>
								<a href="../index.cfm">
									Login
								</a>
							</li>
							<li>
								<a href="signup.cfm">
									Register
								</a>
							</li>
							<li>
								<a href="../index.cfm">
									About
								</a>
							</li>
							<li>
								<a href="../index.cfm">
									Home
								</a>
							</li>
						</ul>
					</div>
					<div id="bodyid">
						<div id="err" style="color:red;font-size:13px;margin-left:250px;">

						</div>
						<br>
						<br>
						<cfform action="../Controller/resetPasswordAction.cfm" onsubmit="return formValidation()" method="POST" id='form'>
							<center>
								<h1>
								</h1>
							</center>
							<div class="LContainer">
								New Password
							</div>
							<cfinput type='Password' id='password' name='password'  class="input_box" maxlength="16" onblur="rpassword()">
							<div id='pid'>
							</div>
							<br>
							<br>
							<cfinput type="hidden" name="email" value="#VARIABLES.email#" >
							<div class="LContainer">
								Confirm-Password
							</div>
							<cfinput type='Password' id='cpassword' name='cpassword'  class="input_box" maxlength="16" onblur="rcpassword()">
							<div id='cpid' style="color:red, font-size:13px">
							</div>
							<br>
							<cfinput name='resetPassword' type='Submit' value='Reset Password' id='btn' class='btn'>
							<br>
						</cfform>
					</div>
					<br>
					<br>
					<footer>
						<!--- <img src="/assets/image/footer.JPG" alt="Online Examination Portal " width="900px" > --->
					</footer>
				</h3>
				<script type="text/javascript" src="../assets/js/resetPassword.js"> </script>
			</body>
		</html>
	</cfif>
</cfif>
