<html>
	<head>
		<title>
			Login Action
		</title>
	</head>
	<body>
		<!---  <cfdump var = "#FORM#"> --->
		<cfif isDefined("FORM.login") >

			<cfset VARIABLES.valid = TRUE />
			 <cfif  isValid("regex", trim(FORM.uid),"/^([a-zA-Z0-9_.-])+@(([a-zA-Z0-9-])+.)+([a-zA-Z0-9]{2,4})+$/")>
				<cfset VARIABLES.valid = FALSE />
				</cfif>
				<cfif NOT (len(FORM.password) GTE 8 AND refind('[A-Z]',FORM.password)
				AND refind('[a-z]',FORM.password) AND refind('[0-9]',FORM.password)
				AND refind('[!@##$&* = -{}<>,.:;|?""''~]',FORM.password ) )>

				<cfset VARIABLES.valid = FALSE />
				</cfif>
			<cfif  VARIABLES.valid EQ TRUE >

				<cfset VARIABLES.record = application.signupObj.emailExist(FORM.uid) />
				<!---  <cfdump var = "#VARIABLES.record#"><cfabort> --->
				<cfif VARIABLES.record EQ 0 >
					<!---  <cfset VARIABLES.valid = FALSE /> --->
					<cfset VARIABLES.recordAdmin = application.loginObj.emailExist(FORM.uid) />

					<cfif VARIABLES.recordAdmin EQ 0>
						<cflocation url = "../view/login.cfm?errID=2" addToken = "no"/>
					</cfif>

					<cfset VARIABLES.pass = application.loginObj.getPassword(FORM.uid,"ms_admin") />
					<cfset VARIABLES.salt = application.loginObj.getSalt(FORM.uid,"ms_admin") />

					<cfset VARIABLES.hashedPassword = Hash(FORM.password & VARIABLES.salt, "SHA-512") />
					<cfif compare(VARIABLES.hashedPassword,VARIABLES.pass) EQ 0>
                        <cfset SESSION.adminEmail = FORM.uid>
						<cflocation url = "../view/adminDashboard.cfm" addToken = "no" />
					<cfelse >
						<cflocation url = "../view/login.cfm?errID=3" addToken = "no" />
					</cfif>
				<cfelse >

					<cfset VARIABLES.pass = application.loginObj.getPassword(FORM.uid,"ms_student") />
                    <cfset VARIABLES.salt = application.loginObj.getSalt(FORM.uid,"ms_student") />
					<cfset VARIABLES.hashedPassword = Hash(FORM.password & VARIABLES.salt, "SHA-512") />
					<cfif compare(VARIABLES.hashedPassword,VARIABLES.pass) EQ 0>
						<cfset SESSION.studentEmail = FORM.uid>
						<cflocation url = "../view/studentDashboard.cfm" addToken = "no" />
					<cfelse>
						<cflocation url = "../view/login.cfm?errID=3" addToken = "no" />
					</cfif>
				</cfif>
			<cfelse>
				<cflocation url = "../view/login.cfm?errID=1" addToken = "no" />
			</cfif>
		<cfelse>
			<cflocation url = "../error/error.cfm" addToken = "no" />
		</cfif>
	</body>
</html>
