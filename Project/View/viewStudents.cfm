<cfmodule template="../includes/adminPageValidate.cfm" >
</cfmodule>

<html>
	<head>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<link href="https://fonts.googleapis.com/css?family=Ubuntu" rel="stylesheet">
		<link rel="stylesheet" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css">
		<script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
		<link rel="stylesheet" href="../assets/css/addQuestion.css">

	    <title>
			Student Details
		</title>
	                       <script type="text/javascript">
                               $(document).ready(function () {
                                       $('#tableId').dataTable();
                                  });
                           </script>

	</head>
	<body>
		<header>
			<img src="../assets/image/portal.JPG" alt="Online Examination Portal" width="900px">
		</header>
		<h4>
			<ul>
				<li>
					<a href="addQuestion.cfm">
						Add Question
					</a>
				</li>

				<li>
					<a href="viewQuestions.cfm">
						 Questions
					</a>
				</li>
				<li>
					<a href="viewMarks.cfm">
					    Marks
					</a>
				</li>
				<li>
					<a href="viewStudents.cfm">
						 Students
					</a>
				</li>
				<li>
					<a href="../Controller/logoutAction.cfm">
						Logout
					</a>
					</a>
				</li>
			</ul>
			<div id="bodyid">
				<!--- <div id="err" style="color:red;font-size:13px;margin-left:200px;">
					<cfset errorArray=["!!! All Fields are required  !!!",
						"!!! Question Added Successfully !!!"] />
					<cfif isDefined("URL.errID") >
						<cfif URL.errID EQ 2>
							<cfoutput>#errorArray[2]# </cfoutput>
					    <cfelse>
							<cfoutput>#errorArray[1]# </cfoutput>
				        </cfif>
					<cfelse>
					</cfif>
				</div> ---><br><br><br>
				<cfset student = application.viewDetailsObj.getStudents()>
               <table id="tableId" class="cell-border order-column  stripe hover">
                   <thead>
					<tr>
					<th>Name</th><th>Email</th><th>Dob</th><th>Mobile</th>
					      <th>Address Line</th>
					 </tr>
					 </thead>
					 <tbody>
					 <cfoutput query="student">
					 <tr>
					 <td>#Name#</td>
					 <td>#email#</td>
					 <td>#dob#</td>
					 <td>#phone#</td>
					 <td>#address#</td>
					 </tr>
					 </cfoutput>
					 </tbody>

				</table>

		</h4>
		</div>
		<footer>
		</footer>

	</body>
</html>
