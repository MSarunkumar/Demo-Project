<cfmodule template="../includes/adminPageValidate.cfm" >
</cfmodule>

<html>
	<head>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Ubuntu" >
		<link rel="stylesheet" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css">
		<script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
		<link rel="stylesheet" href="../assets/css/addQuestion.css">
		    <title>
			Student Marks
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

             <br><br>
             <cfset marks = application.viewDetailsObj.getMarks()>
               <table id="tableId" class="cell-border order-column  stripe hover">
					<thead>
					<tr>
					<th> Student Email </th><th>  Start Time</th><th>End Time</th>
					<th>Score</th><th>Total Questions</th>
					 </tr>
					 </thead>
					 <tbody>
                    <cfoutput query="marks">
					 <tr>

					 <td>#studentEmail#</td>
					 <td>#startDate#</td>
					 <td>#endDate#</td>
					 <td>#score#</td>
                     <td>#totalQuestion#</td>

					 </tr>
					 </cfoutput>
					 </tbody>

				</table>
		</h4>
		</div>
	</body>
</html>
