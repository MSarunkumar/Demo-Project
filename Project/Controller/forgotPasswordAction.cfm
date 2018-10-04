
	<html>
		<head>
			<title>
				Forgot Password Action
			</title>
		</head>
		<body>
			<!--- <cfdump var = "#FORM#"> --->
			<cfif isDefined("FORM.login") >
				<!--- <cffile action = "append" file  = "D:/Errors/project.txt" output = "value of form submit::(#FORM.submit#)"> --->
				<cfset VARIABLES.valid = TRUE />
				<cfif  isValid("regex", trim(FORM.uid),"/^([a-zA-Z0-9_.-])+@(([a-zA-Z0-9-])+.)+([a-zA-Z0-9]{2,4})+$/")>
					<cfset VARIABLES.valid = FALSE />
				</cfif>
				<cfif VARIABLES.valid EQ TRUE >
					<cfset VARIABLES.record = APPLICATION.signupObj.emailExist(FORM.uid)>
					<cfif VARIABLES.record EQ 0>
						<cflocation url = "../view/forgotPassword.cfm?errId=1" addToken = "no" />
					<cfelse>
                     <cfset SESSION.passwordId=FORM.uid />

                      <cfset FP=CreateObject("component", "Project.Model.forgotPassword") />
					  <cfset VARIABLES.emailExist=FP.emailExist(FORM.uid) />
					  <cfif VARIABLES.emailExist NEQ 0>
						  <cfset delete=FP.deleteEmail(FORM.uid) />
						  </cfif>
					   <cfset VARIABLES.guid=FP.getGuid() />
					  <cfset submitStatus=FP.submitData(FORM.uid,VARIABLES.guid) />
                      <cfset mail=FP.sendEmail("arunyc2@gmail.com",FORM.uid,VARIABLES.guid) />
                        <cflocation url = "../view/forgotPassword.cfm?errId=3" addToken = "no" />
					</cfif>
				<cfelse>
					<cflocation url = "../view/forgotPassword.cfm?errId=2" addToken = "no" />
				</cfif>
			<cfelse>
				<cflocation url = "../error/error.cfm" addToken = "no" />
			</cfif>
		</body>
	</html>

