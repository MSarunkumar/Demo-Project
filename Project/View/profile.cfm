<cfmodule template="../includes/pageValidate.cfm">
</cfmodule>

<cfinclude template="../includes/header.cfm">

		 <cfset student = application.viewDetailsObj.getStudent(session.studentEmail)>
         <div id="bodyid">

         <img alt="Student`s photo" height="150px"  src="../assets/image/student.jpg" width="150px" align="right">
			<center><cfoutput>
				<br>
		    Name ::&nbsp &nbsp #student.Name#
		   <br>
		    Mobile ::&nbsp &nbsp#student.phone#
		   <br>
		   #student.email#
		   <br>
          </cfoutput>
		               <br><br><br>
		 <img alt="Profile wallpaper" height="350px"  src="../assets/image/profile.jpg" width="600px">
	</center>

		</h3>
		</div>


	</body>
</html>
