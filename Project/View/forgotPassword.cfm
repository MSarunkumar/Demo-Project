<html>
	<head>
		<link href="https://fonts.googleapis.com/css?family=Ubuntu" rel="stylesheet">
		<link rel="stylesheet" type="text/css" href="../assets/css/login.css">
		<title>
			Recover Password
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
			<cfset errorArray=[ "Not Registered Email Id", "Please Enter valid formate",
			                       " Link has been send to your email "]>
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
			<cfform action="../Controller/forgotPasswordAction.cfm" onsubmit="return formValidation()" method="POST" id='form'>
				<center>
					<h1>
						Recover Password
					</h1>
				</center>
				<div class="LContainer">
				 Email ID
				</div>
				<cfinput type='text' id= 'uid' name='uid' placeholder='User Id' class="input_box" maxlength="50" onblur="emailValid()">
				<div id='eid'> </div>
				<br>
	           <cfinput name='login' type='Submit' value='Send' id='btn' class='btn'>
              <br>
           </cfform>
          </div>
        <br> <br>

		</h3>
		<script type="text/javascript" src="../assets/js/forgotPassword.js"> </script>
	</body>
	</html>
