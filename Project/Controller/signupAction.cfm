<html>
	<head>
		<title>
			Signup Action
		</title>
	</head>
	<body>
     <!--- First it will validate the data and than submit detail with secure password --->
		<!--- <cfdump var = "#FORM#"> --->
		<cfif isDefined("#FORM.submit#") >
			<!--- <cffile action = "append" file  = "D:/Errors/project.txt" output = "value of form submit::(#FORM.submit#)"> --->
			<cfset VARIABLES.valid = TRUE />
			<cfif NOT isValid("regex", trim(FORM.name), "[A-Za-z ]+") >
				<cfset VARIABLES.valid = FALSE />
			</cfif>
			<cfif  isValid("regex", trim(FORM.email),"/^([a-zA-Z0-9_.-])+@(([a-zA-Z0-9-])+.)+([a-zA-Z0-9]{2,4})+$/")>
				<cfset VARIABLES.valid = FALSE />
			</cfif>
			<cfset todayDate = DateFormat(now(), "mm/dd/yyyy") />
			<cfset studentDob = FORM.date />
			<cfif DateCompare(todayDate,studentDob) EQ -1>
				<cfset VARIABLES.valid = FALSE />
			</cfif>
			<cfif (NOT isValid("regex", trim(FORM.mobile),"[0-9]{10}") OR FORM.mobile EQ 0)>
				<cfset VARIABLES.valid = FALSE />
			</cfif>
			<cfif NOT (len(FORM.password) GTE 8 AND refind('[A-Z]',FORM.password)
				AND refind('[a-z]',FORM.password) AND refind('[0-9]',FORM.password)
				AND refind('[!@##$&* = -{}<>,.:;|?""''~]',FORM.password ) )>
				<cfset VARIABLES.valid = FALSE />
			</cfif>
			<cfif compare(trim(FORM.password),trim(FORM.cpassword))>
				<cfset VARIABLES.valid = FALSE />
			</cfif>
			<cfif (len(trim(FORM.address)) LTE 0) >
				<cfset VARIABLES.valid = FALSE />
			</cfif>
			<cfif  VARIABLES.valid EQ TRUE >
				<cfset VARIABLES.record = application.signupObj.emailExist(FORM.email) />
				<!---  <cfdump var="#VARIABLES.record#"><cfabort> --->
				<cfif VARIABLES.record GT 0 >
					<cfset VARIABLES.valid = FALSE />
					<cflocation url = "../view/signup.cfm?errId=2" addToken = "no" />
				<cfelse >
					<cfset VARIABLES.salt = Hash(GenerateSecretKey("AES"), "SHA-512") />
					<cfset VARIABLES.hashedPassword = Hash(FORM.password & variables.salt, "SHA-512") />
					<!--- <cfset VARIABLES.password = "#hash('#FORM.password#','MD5','utf-8')#"> --->
					<cfset VARIABLES.submitStatus = APPLICATION.signupObj.submitDetail(
						trim(FORM.name),trim(FORM.email), trim(FORM.date),
						trim(FORM.mobile),trim(FORM.address),VARIABLES.hashedPassword,VARIABLES.salt) />
					<!--- <cfdump var="#VARIABLES.submitStatus#"> <cfabort> --->
					<cfif VARIABLES.submitStatus >
						<cflocation url = "../View/login.cfm" addToken = "no" />
					<cfelse>
					    <cflocation url = "../View/login.cfm?errId=" addToken = "no" />
					</cfif>
				</cfif>
			</cfif>
			<cfif VARIABLES.valid NEQ TRUE>
				<cflocation url = "../view/signup.cfm?errId=1" addToken = "no" />
			</cfif>
		<cfelse>
			<cflocation url = "../error/error.cfm" addToken = "no" />
		</cfif>
	</body>
</html>
