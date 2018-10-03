<cfcomponent hint="This is Application cfc for Online Exam System Project" accessors="true"
	output="false" persistent="false">

	<cfset THIS.name = "onlineExam123" />
	<cfset THIS.applicationTimeout = CreateTimeSpan(0, 2,0, 0) />
	<cfset THIS.sessionManagement = true />
	<cfset THIS.sessionTimeout = CreateTimeSpan(0, 1,0, 0) />
    <cfset THIS.datasource="demoProject">



	<!--- Method [ OnApplicationStart ] --->


	<cffunction name="OnApplicationStart" access="public" returntype="boolean" output="false"
		hint="Fires when the application is first created.">
		<cffile action="write" file="D:/Errors/project.txt" output="Application has been started,all errors in project ">
          <cfset application.signupObj = CreateObject("component", "Model.signup") />
		  <cfset application.loginObj = CreateObject("component", "Model.login") />
		  <cfset application.logoutObj = CreateObject("component", "Model.logout") />
          <cfset application.addQuestionObj = CreateObject("component", "Model.addQuestion") />
		  <cfset application.takeTestObj = CreateObject("component", "Model.takeTest") />
          <cfset application.viewDetailsObj = CreateObject("component", "Model.viewDetails") />
		<cfreturn true />
	</cffunction>

	<!---       Method [ onSessionStart ]     --->

	<cffunction name="OnSessionStart" access="public" returntype="boolean" output="false" >
         <cfset SESSION.studentValid=false>

		<cfreturn true />
	</cffunction>

	<!---       Method [ onRequestStart ]     --->

	<cffunction name="OnRequestStart" access="public" returntype="boolean" output="false"
		hint="Fires when the user request to next page" >



		<cfreturn true />
	</cffunction>

	<!---   Method [onMissingTemplate]   --->

  <cffunction name="onMissingTemplate" access="public" >
	<cfargument  name="targetPage" type="string" required=true />

		<cftry>
		   <cflog type="error" text="Missing template: #Arguments.targetPage#">

			<cfoutput><center>
				<h1>
					#Arguments.targetPage# could not be found.
				</h1>
				<h3>
					You requested a non-existent ColdFusion page.
					<br />
					Please check the URL/Go Back
				</p></h3></center>
			</cfoutput>
			<cfreturn true />
			<cfcatch>
				<cfreturn false />
			</cfcatch>
		</cftry>
	</cffunction>





<!--- Method [onRequest] --->
<cffunction name="OnRequest" access="public" returntype="void" output="true"
		hint="Fires after pre page processing is complete.">
		 <cfargument name="TargetPage" type="string" required="true"/>
         <cfinclude template="#ARGUMENTS.TargetPage#" />

		<cfreturn />
	</cffunction>
<!--- Method [OnRequestEnd] --->

<cffunction name="OnRequestEnd" access="public" returntype="void" output="true"
		hint="Fires after the page processing is complete.">

		<cfreturn />
	</cffunction>

<!--- Method [OnSessionEnd] --->

<cffunction name="OnSessionEnd" access="public" returntype="void" output="true"
		hint="Fires when the session is terminated.">
          <cfset SESSION.studentValid=false>

		<cfreturn />
	</cffunction>

<!--- Method [OnApplicationEnd] --->
<cffunction name="OnApplicationEnd" access="public" returntype="void" output="true"
		hint="Fires when the application is terminated.">
		<cfargument name="ApplicationScope" type="struct" required="false"
			default="#StructNew()#" />

	    <cflog file="#This.Name#" type="Information"
			text="Application #Arguments.ApplicationScope.applicationname# Ended" >
		<cfreturn />
	</cffunction>

	<!--- Method [OnError] --->
	<cffunction name="OnError" access="public" returntype="void" output="true"
		hint="Fires when an exception occures that is not caught by a try/catch.">
		<cfargument name="Exception" type="any" required=true />
		<cfargument type="String" name="EventName" required=true/>
		    <!--- Log all errors. --->
         <cflog file="#This.Name#" type="error"
            text="Event Name: #Arguments.Eventname#"  />

		 <cflog file="#This.Name#" type="error"
            text="Message: #Arguments.Exception.message#" />

		<cflog file="#This.Name#" type="error"
             text="Root Cause Message: #Arguments.Exception.rootcause.message#" />

			<!--- Display an error message if there is a page context. --->
            <cfif NOT (Arguments.EventName IS "onSessionEnd") OR
                                (Arguments.EventName IS "onApplicationEnd")>
                       <cfoutput>
                              <h2>An unexpected error occurred.</h2>
                             <p>Please provide the following information to technical support:</p>
                              <p>Error Event: #Arguments.EventName#</p>
                                    <p>Error details:<br>
                                 <cfdump var=#Arguments.Exception#></p>
                         </cfoutput>
               </cfif>

		<cfreturn />
	</cffunction>

</cfcomponent>
