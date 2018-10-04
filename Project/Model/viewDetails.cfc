<!---
  --- viewDetails
  --- -----------
  ---
  --- It will fetch the data and return to calling function.
  ---
  --- author: mindfire
  --- date:   9/25/18
  --->
<cfcomponent hint = "It will fetch the data and return to calling function." accessors = "true" output = "false" persistent = "false">



<!---  Method 1 ---- it will return student information  --->


<cffunction name = "getStudents" access = "remote"  returntype = "Query" >
	<cftry>
	        <cfquery name = "students"  >
               SELECT    Name,email,dob,phone,address
	           FROM      ms_student;

	        </cfquery>
	        <cfreturn students />
	<cfcatch type = "database">
     <cflog file = "onlineExamErrorLog" text = "#cfcatch.message# #cfcatch.detail#..#now()#..fun[getStudents]viewDetails" />
     </cfcatch>
     </cftry>
</cffunction>



<!---  Method 2 ---- it will return all question information  --->

<cffunction name = "getQuestions" access = "public" returntype = "Query" >
	<cftry>
	              <cfquery name = "question"  >
                   SELECT    question,option1,option2,option3,option4,answer
	               FROM      ms_question;
	              </cfquery>
	              <cfreturn question />
	<cfcatch type = "database">
     <cflog file = "onlineExamErrorLog" text = "#cfcatch.message# #cfcatch.detail#..#now()#..fun[getQuestions]viewDetails" />
     </cfcatch>
     </cftry>
</cffunction>



<!--- Method 3 it will return particular student detail based on Email --->


<cffunction name = "getStudent" access = "public" returntype = "Query" >
	<cfargument name = "email" required = "yes">

	<cftry>

	     <cfquery name = "student"  >
             SELECT    Name,email,dob,phone,address
             FROM      ms_student
             WHERE     email = <cfqueryparam cfsqltype = "cf_sql_varchar" maxlength="50"
	                      value = "#arguments.email#">;
         </cfquery>
         <cfreturn student />
   <cfcatch type = "database">
     <cflog file = "onlineExamErrorLog" text = "#cfcatch.message# #cfcatch.detail#..#now()#..fun[getStudent]viewDetails" />
     </cfcatch>
     </cftry>
</cffunction>

<!--- Method 4  It will show Marks of all students  --->
<cffunction name = "getMarks" access = "public" returntype = "Query" >
	<cftry>
	           <cfquery name = "marks"  >
                   SELECT     studentEmail,startDate,endDate,score,totalQuestion
	               FROM       ms_result
               </cfquery>
                <cfreturn marks />
     <cfcatch type = "database">
     <cflog file = "onlineExamErrorLog" text = "#cfcatch.message# #cfcatch.detail#..#now()#..fun[getMarks]viewDetails" />
     </cfcatch>
     </cftry>
</cffunction>


<!--- Method 5 it will return Mark of one student based on Email --->
<cffunction name = "getMark" access = "public" returntype = "Query" >

        <cftry>
	          <cfquery name = "mark"  >
                   SELECT     studentEmail,startDate,endDate,score,totalQuestion
	               FROM      ms_result
	               WHERE     studentEmail = <cfqueryparam cfsqltype = "cf_sql_varchar" maxlength="50"
	                      value = "#session.studentEmail#">
               </cfquery>
               <cfreturn mark />
	  <cfcatch type = "database">
     <cflog file = "onlineExamErrorLog" text = "#cfcatch.message# #cfcatch.detail#..#now()#..fun[getMark]viewDetails" />
     </cfcatch>
     </cftry>
</cffunction>



</cfcomponent>