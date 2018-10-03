
<html>
	<head>
		<title>
			Reset Password Action
		</title>
	</head>
	<body>
		<!--- <cfdump var = "#FORM#"> --->
		<cfif isDefined("FORM.resetPassword") >
	<!--- <cffile action = "append" file  = "D:/Errors/project.txt" output = "value of form submit::(#FORM#)"> --->
			<cfset Variables.valid = TRUE />
            <cfif NOT (len(FORM.password) GTE 8 AND refind('[A-Z]',FORM.password)
				  AND refind('[a-z]',FORM.password) AND refind('[0-9]',FORM.password)
				  AND refind('[!@##$&* = -{}<>,.:;|?""''~]',FORM.password ) )>
				<cfset Variables.valid = FALSE />
			</cfif>

			<cfif compare(FORM.password,FORM.cpassword) NEQ 0 >
				<cfset Variables.valid = FALSE />
			</cfif>
            <cfif  Variables.valid EQ TRUE >
                      <cfset VARIABLES.salt = Hash(GenerateSecretKey("AES"), "SHA-512") />
				      <cfset VARIABLES.hashedPassword = Hash(FORM.password & VARIABLES.salt, "SHA-512") />
				      <cfset update=CreateObject("component", "Project.Model.forgotPassword") />
                      <cfset update.resetPassword(FORM.email,VARIABLES.hashedPassword,VARIABLES.salt) />
                      <cflocation url="../view/login.cfm" addtoken="no" />
			  <cfelse>
			  <cflocation url="../view/resetPassword.cfm?errId=1" addtoken="no" />
			 </cfif>
			<cfelse>
			 <cflocation url = "../error/error.cfm" addToken = "no" />
		</cfif>
	</body>
</html>



