<!---
	--- forgotPassword
	--- --------------
	---
	--- This will send the email.
	---
	--- author: mindfire
	--- date:   9/21/18
	--->
<cfcomponent hint="This will send the email." accessors="true" output="false" persistent="false">

<!--- Method Check Email from ms_password return recordcount  --->
<cffunction name="emailExist" returntype="Numeric" access="public" hint="It will return no. of record">
		<cfargument name="email" hint="It will catch the email" required="true" type="string" />
        <cftry>
		<cfquery name="checkEmail" >
		SELECT pid
		FROM   ms_password
		WHERE  email = <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.email#">
        </cfquery>
        <cfreturn #checkEmail.RecordCount#>
		<cfcatch>
		<cflog file="onlineExamErrorLog" text="#cfcatch.message# #cfcatch.detail#..fun[emailExist]FP">
		</cfcatch>
		</cftry>
</cffunction >

<!--- Method Delete tuple  --->

 <cffunction name="deleteEmail" access="public" hint="It will delete the tuple">
		<cfargument name="email" hint="It will catch the email" required="true" type="string" />
        <cftry>
		<cfquery name="delete"  >
		DELETE
		FROM   ms_password
		WHERE  email = <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.email#">
        </cfquery>
       <cfcatch type="database">
		<cflog file="onlineExamErrorLog" text="#cfcatch.message# #cfcatch.detail#..fun[deleteEmail]FP">
		</cfcatch>
		</cftry>
</cffunction >
<!--- Method store the details in ms_ --->
<cffunction name="submitData" access="public">
	<cfargument name="email"    required="true" type="string" />
	<cfargument name="guid"  required="true" type="string" />
     <cfset var currentTime=#DateTimeFormat(now(), "MM d yyyy HH:nn:ss ")# />
        <cftry>
 <cfquery name = "insertData" >
	     INSERT  INTO  ms_password (email,guids,times)
                 VALUES  (
                        <cfqueryparam value = "#arguments.email#" cfsqltype = "cf_sql_varchar">,
                        <cfqueryparam value = "#arguments.guid#" cfsqltype = "cf_sql_char">,
						<cfqueryparam value = "#local.currentTime#" cfsqltype = "cf_sql_timestamp">
						)
              </cfquery>
		<cfcatch type="database">
		<cflog file="onlineExamErrorLog" text="#cfcatch.message# #cfcatch.detail#..fun[emailExist]FP">
		</cfcatch>
		</cftry>
</cffunction>
<!--- Method It will return the sending email time from ms_password --->
<cffunction name="getTime" returntype="String" access="public" hint="It will return time">
		<cfargument name="guid" hint="It will catch guids" required="true" type="string" />
         <cftry>
		<cfquery name="timeQuery"  >
		SELECT times
		FROM   ms_password
		WHERE  guids = <cfqueryparam cfsqltype="cf_sql_string" value="#arguments.guid#">
        </cfquery>
        <cfreturn #timeQuery.times#>
        <cfcatch type="database">
		<cflog file="onlineExamErrorLog" text="#cfcatch.message# #cfcatch.detail#..fun[getTime]FP">
		</cfcatch>
		</cftry>
</cffunction >
<!--- Method 1 It will send email with LINK  --->
	<cffunction name="sendEmail" access="public">
		<cfargument name="from" required="yes" type="string">
		<cfargument name="to" required="yes" type="string">
	    <cfargument name="guid" required="yes" type="string">

		<cfmail from="#arguments.from#" to="#arguments.to#" subject="Recover Password " type="html">
                           <cfmailpart type="text" wraptext="60">
                            <pre> Hello,
                             This is for Reset password from Online examination system.
                              Please Click on following link.</pre><br>
                            </cfmailpart>
                         <cfmailpart type="html">
                           <html>
                                 <head></head>
                                 <body>
									<h3>Link</h3>
                                     <a href="http://localhost:5000/Project/View/resetPassword.cfm?id=#ARGUMENTS.guid#">Please Click here</a>
                                  </body>
                             </html>
                                 </cfmailpart>
                            </cfmail>
	</cffunction>


	<!--- Method 2. It will reset password        --->
	<cffunction name="resetPassword" access="public"  >
        <cfargument name="id" required="yes" type="string" />
	    <cfargument name="pass" required="yes" type="string" />
	    <cfargument name="salt" required="yes" type="string" />
     <cftry>
      <cfquery name="reset"  >
		UPDATE ms_student
		SET    password = <cfqueryparam cfsqltype="cf_sql_char"     value="#arguments.pass#">,
		       salt     = <cfqueryparam cfsqltype="cf_sql_char"     value="#arguments.salt#">
		WHERE  email    = <cfqueryparam cfsqltype="cf_sql_varchar"  value="#arguments.id#">
	   </cfquery>
     <cfcatch type="database">
		<cflog file="onlineExamErrorLog" text="#cfcatch.message# #cfcatch.detail#..fun[resetPassword]FP">
		</cfcatch>
		</cftry>

	</cffunction>

  <!--- Method 3.  It will return GUID --->
 <cffunction name="getGuid" access="public" returntype="string">
	<cfquery name="guid" >
		SELECT Newid() as id;
	</cfquery>
	<cfreturn guid.id>
</cffunction>

<!--- Method It will return email based on guid --->
<cffunction name="getEmail" access="public" returntype="string">
	<cfargument name="guid" required="yes" type="string">
	<cftry>
	<cfquery name="returnEmail" >
		SELECT email
		FROM   ms_password
		WHERE guids=<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.guid#">
	</cfquery>
	<cfreturn returnEmail.email>
	<cfcatch type="database">
		<cflog file="onlineExamErrorLog" text="#cfcatch.message# #cfcatch.detail#..fun[getEmail]FP">
		</cfcatch>
		</cftry>
</cffunction>


</cfcomponent>
