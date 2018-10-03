<!---
	--- signup
	--- ------
	---
	--- author: mindfire
	--- date:   9/20/18
	--->
<cfcomponent accessors="true" output="false" persistent="false">

<!--- Method 1 --->

	<!---[emailExist] function will check, user already registered or not,based on recordcount. if recorcount
		   greater than one that means user exist with this email. --->

	<cffunction name="emailExist" returntype="Numeric" access="remote" hint="It will return no. of record">
		<cfargument name="email" hint="It will catch the email" required="true" type="string" />
        <cftry>
		        <cfquery name="checkemail">
		            SELECT studentID
		            FROM   ms_student
		            WHERE  email = <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.email#">
                </cfquery>
                   <cfreturn #checkemail.RecordCount#>
        <cfcatch type="database">
		<cflog file="onlineExamErrorLog" text="#cfcatch.message# #cfcatch.detail#..fun[emailExist]signup" />

		</cfcatch>
		</cftry>

	</cffunction >


<!--- Method 2 --->

   <!--- [submitDetail] function will submit the detial in demoProject DB --->

    <cffunction name="submitDetail" returntype="boolean" access="public" hint="It will store the student detail in DB">
		<cfargument name="name"     required="true" type="string" />
		<cfargument name="email"    required="true" type="string" />
		<cfargument name="dob"      required="true" type="date" />
		<cfargument name="phone"    required="true" type="numeric" />
		<cfargument name="address"  required="true" type="string" />
		<cfargument name="password" required="true" type="string" />
		<cfargument name="salt"     required="true" type="string" />

        <cftry>
        <cfquery name = 'insertQuery' >
	     INSERT  INTO  ms_student (Name,email,dob,phone,address,password,salt)
                 VALUES  (
			            <cfqueryparam value = "#arguments.name#"     cfsqltype = "cf_sql_varchar" >,
                        <cfqueryparam value = "#arguments.email#"    cfsqltype = "cf_sql_varchar">,
                        <cfqueryparam value = "#arguments.dob#"      cfsqltype = "cf_sql_date">,
						<cfqueryparam value = "#arguments.phone#"    cfsqltype = "cf_sql_bigint">,
						<cfqueryparam value = "#arguments.address#"  cfsqltype = "cf_sql_varchar">,
						<cfqueryparam value = "#arguments.password#" cfsqltype = "cf_sql_char">,
						<cfqueryparam value = "#arguments.salt#"     cfsqltype = "cf_sql_char">)
              </cfquery>

		 <cfreturn TRUE />
		 <cfcatch type="database">
		<cflog file="onlineExamErrorLog" text="#cfcatch.message# #cfcatch.detail#..fun[submitDetail]signup" />
		<cfreturn FALSE />
		</cfcatch>
		</cftry>

	</cffunction>

</cfcomponent>
