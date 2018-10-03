<cfmodule template="../includes/pageValidate.cfm">
</cfmodule>

<cfinclude template="../includes/header.cfm">

		 <cfset student = application.viewDetailsObj.getStudent(session.studentEmail)>
         <div id="bodyid">

         <img alt="Student`s photo" height="150px"  src="../assets/image/student.jpg" width="150px">
			<center><h2> Your detail </h2><br>

		   <cfoutput>
		    Name ::&nbsp &nbsp #student.Name#
		   <br>
		    Mobile ::&nbsp &nbsp#student.phone#
		   <br>
		    Email ::&nbsp &nbsp #student.email#
		   <br>
          </cfoutput>
	</center>

		</h3>
		</div>


	</body>
</html>
