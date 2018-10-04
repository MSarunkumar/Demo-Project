<cfif structKeyExists(session, "studentEmail")>
       <cflocation addtoken="no" url="studentDashboard.cfm">
</cfif>

<html>
	<head>
		<link href="https://fonts.googleapis.com/css?family=Ubuntu" rel="stylesheet">
		<title>
			Registration Form
		</title>
		<link rel="stylesheet" href="../assets/css/signup.css">
	</head>
	<body>
		<header>
			<img src="../assets/image/portal.JPG" alt="Online Examination Portal" width="900px">
		</header>
		<h3>
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
			<div id="bodyid">



				<div id="error" style="color:red;font-size:15px;margin-left:260px;">
					 <cfset errorArray=["Invalid details","Email already Exist"
					                     ,"Internal Problem. Please try again"] />

					  <cfif isDefined("URL.errId") >
						<cfif URL.errID EQ 1 >
						<cfoutput> #errorArray[1]# </cfoutput>
						<cfelseif URL.errID EQ 2>
							<cfoutput> #errorArray[2]# </cfoutput>
						<cfelse>
					    <cfoutput> #errorArray[3]# </cfoutput>
					    </cfif>
						</cfif>
				</div>
				<cfform action="../Controller/signupAction.cfm" onsubmit="return formValidation()" method="POST" id='form' >
					<center>
						<h1>
							Student Register
						</h1>
					</center>
					<div class="LContainer">
						Name
					</div>
					<cfinput type='text' id="name" name="name" placeholder='Full Name' class="input_box" maxlength="50" onblur="nameValid()">
					<span class='star' >
					</span>
					<div id='nid' class="err">
					</div>
					<br>
					<div class="LContainer">
						Email
					</div>
					<cfinput type='text' id="email" name="email" placeholder='abc@mindfiresolutions.com' class="input_box" maxlength="50" onblur="emailValid()">
					<span class='star' >
					</span>
					<div id= 'eid' class="err">
					</div>
					<br>
					<div class="LContainer">
						DOB
					</div>
					<cfinput type='date' id="date" name="date" class="input_box" onblur="dobValid()">
					<span class='star' >
					</span>
					<div id='did' class="err">
					</div>
					<br>
					<div class="LContainer">
						Phone Number
					</div>
					<cfinput type='text' id="mobile" name="mobile" class="input_box" maxlength="10" onblur="mobileValid()">
					<span class='star' >
					</span>
					<div id='mid' class="err">
					</div>
					<br>
					<div class="LContainer">
						Address
					</div>
					<cfinput type='text' id="address" name="address" placeholder='Address' class="input_box" maxlength="250" onblur="addressValid()">
					<span class='star' >
					</span>
					<div id='aid' class="err">
					</div>
					<br>
					<div class="LContainer">
						Password
					</div>
					<cfinput type='Password' id="password" name="password"  placeholder='Minimum 8 character' class="input_box" maxlength="16" onblur="passwordValid()">
					<span class='star' >
					</span>
					<div id='pid' class="err">
					</div>
					<br>
					<div class="LContainer">
					    Confirm-Password
				    </div>
				    <cfinput type='Password' id="cpassword" name="cpassword" placeholder='Minimum 8 character' class="input_box" maxlength="16" onblur="cpasswordValid()">
				    <span class='star'></span>
				    <div  id="cpid" class="err">
				    </div>
				    <br>
				    <br>
					<cfinput type='Submit' value='Submit' class='btn' name='submit'>
					<p style="color:red;margin-left:680px">
						*[Mandatory]
					</p>
			</div>
			</cfform>
			<br>

			<script type="text/javascript" src="../assets/js/signup.js"> </script>
		</h3>
		</div>
		<footer>
		</footer>
	</body>
</html>
