<!---
	--- takeTest
	--- --------
	---
	--- It is for getting question at test time.
	---
	--- author: mindfire
	--- date:   9/26/18
	--->
<cfcomponent hint = "It is for getting question at test time." accessors = "true" output = "false" persistent = "false">

	<!--- Method 1  will return question with options and answer --->


	<cffunction name = "getQuestions" returntype = "query" access = "remote" returnformat = "JSON">
		<cfargument name = "qid" type = "any" required = "yes">

		<cftry>
			    <cfset VARIABLES.qd = LSParseNumber(qid)>
		        <cfquery name = "getQues"  >

		          SELECT    question,option1,option2,option3,option4,answer
		          FROM      ms_question
		          WHERE     questionId = <cfqueryparam cfsqltype = "cf_sql_integer"
			         value = "#variables.qd#">
		         </cfquery>
		         <cfreturn getQues />
		         <cfcatch type = "database">
		         <cflog file = "onlineExamErrorLog" text = "#cfcatch.message# #cfcatch.detail#..#now()#..fun[getQuestions]takeTest" />
                 </cfcatch>
		</cftry>

	</cffunction>


	<!---    Method   It will return questionId based on total no. of question   --->

	<cffunction name = "getQuestionId" returntype = "Numeric" access = "remote" returnformat = "JSON">
		<cfargument name = "qno" type = "Numeric" required = "yes">
		<cftry>
		       <cfquery name = "getId"  >
		          SELECT TOP 1 questionId AS qid
                      FROM  ( SELECT DISTINCT TOP #arguments.qno# questionId FROM ms_question
                              ORDER BY questionId DESC) bb
                              ORDER BY  questionId
                </cfquery>
		        <cfreturn getId.qid  />
		        <cfcatch type = "database">
		        <cflog file = "onlineExamErrorLog" text = "#cfcatch.message# #cfcatch.detail#..#now()#..fun[getQuestionId]takeTest" />
                </cfcatch>
		</cftry>
     </cffunction>


	<!--- Method  it will submit the result  --->

	<cffunction name = "submitScore" access = "remote" returntype = "numeric"  returnformat = "JSON">
        <cfargument name = "score" required = "yes" type = "numeric" >
		<cfargument name = "totalQuestion" required="yes" type="numeric">
        <cftry>
		       <cfset var currentTime = #DateTimeFormat(now(), "MM d yyyy HH:nn:ss ")# />
               <cfset SESSION.studentValid  =  FALSE />
		       <!--- <cfquery name = "submitResult"  >
		       INSERT INTO ms_result (studentEmail,startDate,endDate,score,totalQuestion)
               VALUES(
                      <cfqueryparam value = "#session.studentEmail#" cfsqltype = "cf_sql_varchar">,
		              <cfqueryparam value = "#session.startTime#"    cfsqltype = "cf_sql_timestamp">,
		              <cfqueryparam value =  "#local.currentTime#"   cfsqltype = "cf_sql_timestamp">,
		              <cfqueryparam value = "#arguments.score#" cfsqltype = "cf_sql_integer" >,
		              <cfqueryparam value = "#arguments.totalQuestion#" cfsqltype = "cf_sql_integer" >
                      )
		        </cfquery> --->
                <cfreturn #arguments.score# />
		        <cfcatch type = "database">
		        <cflog file = "onlineExamErrorLog" text = "#cfcatch.message# #cfcatch.detail#..#now()#..fun[submitScore]takeTest" />
                </cfcatch>
		</cftry>

  </cffunction>


	<!--- Method  It will return total number of questions   --->

	<cffunction name = "totalQuestion" access = "remote" returntype = "Numeric" returnformat = "JSON">

		<cftry>
			   <cfquery name = "totalNo"  >
               SELECT COUNT(questionId) AS total
	           FROM   ms_question;
	           </cfquery>
		       <cfreturn totalNo.total>
		       <cfcatch type = "database">
		       <cflog file = "onlineExamErrorLog" text = "#cfcatch.message# #cfcatch.detail#..fun[totalQuestion]takeTest" />
               </cfcatch>
		</cftry>
	</cffunction>

	<!---  Method It will return total number of record of result table

	<cffunction name = "totalResult" access = "remote" returntype = "Numeric" returnformat = "JSON">
		<cfquery name = "totalNo"  >
       SELECT COUNT(resultId) AS total
	   FROM   ms_result;
	  </cfquery>
		<cfreturn totalNo.total>
	</cffunction>--->


</cfcomponent>
