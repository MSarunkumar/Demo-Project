<!---
	--- login
	--- -----
	---
	--- This is login cfc.
	---
	--- author: mindfire
	--- date:   9/24/18
	--->
<cfcomponent hint = "This is login cfc." accessors = "true" output = "false" persistent = "false">

	<!--- Method  1 [it will return password after fetching from ms_student and ms_admin]--->

	<cffunction name = "getPassword" access = "public" output = "false" returntype = "String">
		<cfargument name = "email" required = "yes" type = "string" />
		<cfargument name = "user"  required = "yes" type = "string" />
		<cftry>
		<cfquery name = "fetchPassword">
		SELECT password
		FROM   #arguments.user#
		WHERE  email = <cfqueryparam cfsqltype = "cf_sql_varchar" value = "#arguments.email#">
	</cfquery>
		<cfreturn #fetchPassword.password# />
		<cfcatch type = "database">
		<cflog file = "onlineExamErrorLog" text = "#cfcatch.message# #cfcatch.detail#..fun[getPassword]login">
		</cfcatch>
		</cftry>
	</cffunction>

	<!---Method 2  It will check email ID Exist or not in ms_admin table    --->

	<cffunction name = "emailExist" returntype = "Numeric" access = "remote" hint = "It will return no. of record">
		<cfargument name = "email" hint = "It will catch the email" required = "true" type = "string" />
		<cftry>
		<cfquery name = "checkemail"  >
		SELECT adminID
		FROM   ms_admin
		WHERE  email = <cfqueryparam cfsqltype = "cf_sql_varchar" value = "#arguments.email#">
        </cfquery>
		<cfreturn #checkemail.RecordCount#>
		<cfcatch type = "database">
		<cflog file = "onlineExamErrorLog" text = "#cfcatch.message# #cfcatch.detail#..fun[emailExist]login">
		</cfcatch>
		</cftry>
     </cffunction >
	<!--- Method 3 it will return salt from ms_student or ms_admin --->

     <cffunction name = "getSalt" access = "public" output = "false" returntype = "String">
		<cfargument name = "email" required = "yes" type = "string" />
		<cfargument name = "user"  required = "yes" type = "string" />
		<cftry>
		<cfquery name = "fetchSalt" >
		SELECT salt
		FROM   #arguments.user#
		WHERE  email = <cfqueryparam cfsqltype = "cf_sql_varchar" value = "#arguments.email#">
	</cfquery>
		<cfreturn #fetchSalt.salt# />
		<cfcatch type = "database">
		<cflog file = "onlineExamErrorLog" text = "#cfcatch.message# #cfcatch.detail#..fun[getSalt]]login">
		</cfcatch>
		</cftry>
	</cffunction>





</cfcomponent>
