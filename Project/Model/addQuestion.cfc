<!---
  --- addQuestion
  --- -----------
  ---
  --- It will add the question in DB.
  ---
  --- author: mindfire
  --- date:   9/25/18
  --->
<cfcomponent hint="It will add the question in DB." accessors="true" output="false" persistent="false">

<cffunction name="addQuestion" access="public" returntype="boolean">
	<cfargument name="ques" required="yes" type="string" />
	<cfargument name="op1" required="yes" type="string" />
	<cfargument name="op2" required="yes" type="string" />
	<cfargument name="op3" required="yes" type="string" />
	<cfargument name="op4" required="yes" type="string" />
	<cfargument name="ans" required="yes" type="numeric" />
    <cftry>
	<cfquery name="addQues" >
	INSERT INTO ms_question (question,option1,option2,option3,option4,answer)
           VALUES (
			            <cfqueryparam value = "#arguments.ques#" cfsqltype = "cf_sql_varchar">,
                        <cfqueryparam value = "#arguments.op1#" cfsqltype = "cf_sql_varchar">,
                        <cfqueryparam value = "#arguments.op2#" cfsqltype = "cf_sql_varchar">,
						<cfqueryparam value = "#arguments.op3#" cfsqltype = "cf_sql_varchar">,
						<cfqueryparam value = "#arguments.op4#" cfsqltype = "cf_sql_varchar">,
						<cfqueryparam value = "#arguments.ans#" cfsqltype = "cf_sql_integer">)
      </cfquery>
	<cfreturn TRUE />

	<cfcatch type="database">
	<cflog file="onlineExamErrorLog" text="#cfcatch.message# #cfcatch.detail#..fun[addQuestion]">
	<cfreturn FALSE />
	</cfcatch>
	</cftry>

</cffunction>
</cfcomponent>