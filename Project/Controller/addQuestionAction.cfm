<html>
	<head>
		<title>
			Add Question Action
		</title>
	</head>
	<body>
		<!--- Insert the new record
			<cfdump var = "#FORM#"> --->
		<cfif isDefined("FORM.submit") >
			<!--- <cffile action = "append" file  = "D:/Errors/project.txt" output = "value of form submit::(#FORM.submit#)"> --->
			<cfset VARIABLES.valid = TRUE />
			<cfif (len( trim(FORM.quesId)) GTE 900) OR ((len( trim(FORM.quesId))) LT 1 ) >
				<cfset VARIABLES.valid = FALSE />
			</cfif>
			<cfif (len( trim(FORM.op1)) GTE 250) OR ((len( trim(FORM.op1))) LT 1 ) >
				<cfset VARIABLES.valid = FALSE />
			</cfif>
			<cfif (len( trim(FORM.op2)) GTE 250) OR ((len( trim(FORM.op2))) LT 1 ) >
				<cfset VARIABLES.valid = FALSE />
			</cfif>
			<cfif (len( trim(FORM.op3)) GTE 250) OR ((len( trim(FORM.op3))) LT 1 ) >
				<cfset VARIABLES.valid = FALSE />
			</cfif>
			<cfif (len( trim(FORM.op4)) GTE 250) OR ((len( trim(FORM.op4))) LT 1 ) >
				<cfset VARIABLES.valid = FALSE />
			</cfif>
			<cfif (trim(FORM.op1) EQ trim(FORM.op2)) OR (trim(FORM.op1) EQ trim(FORM.op3))OR
			       (trim(FORM.op1) EQ trim(FORM.op4)) OR (trim(FORM.op2) EQ trim(FORM.op3))OR
			       (trim(FORM.op2) EQ trim(FORM.op4)) OR (trim(FORM.op3) EQ trim(FORM.op4))>
				      <cflocation url = "../view/addQuestion.cfm?errId=3" addToken = "no" />
			       </cfif>
			<cfif  VARIABLES.valid EQ TRUE >
				<cfset VARIABLES.addQuestionStatus = application.addQuestionObj.addQuestion
				                (trim(FORM.quesId),trim(FORM.op1), trim(FORM.op2),
				                trim(FORM.op3),trim(FORM.op4),FORM.selId)>
				<!--- <cfdump var="#VARIABLES.submitStatus#"> <cfabort> --->
				<cfif VARIABLES.addQuestionStatus >
				    <cflocation url = "../view/addQuestion.cfm?errId=2" addToken = "no" />
				<cfelse>
              <!--- <cffile action = "append" file  = "D:/Errors/project.txt" output = "Question not added ::(#now()#)"> --->
				  <cflocation url = "../view/addQuestion.cfm?errId=4" addToken = "no" />
				</cfif>

		<cfelse>
			<cflocation url = "../view/addQuestion.cfm?errId=1" addToken = "no" />
		</cfif>
	<cfelse>
		<cflocation url = "../error/error.cfm" addToken = "no" />
		</cfif>
	</body>
</html>
