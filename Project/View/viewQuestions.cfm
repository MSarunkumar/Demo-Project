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
			Question Details
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
             <cfset question = application.viewDetailsObj.getQuestions()>
               <table id="tableId" class="cell-border order-column compact stripe hover">
					<thead>
					<tr>
					<th>Question </th><th>Option1</th><th>Option2</th><th>Option3</th>
					      <th>Option4</th><th>Answer</th>
					 </tr>
					 </thead>
					 <tbody>
					 <cfoutput query="question">
					 <tr>
					 <td>#question.question#</td>
					 <td>#question.option1#</td>
					 <td>#question.option2#</td>
					 <td>#question.option3#</td>
					 <td>#question.option4#</td>
					  <td>#question.answer#</td>
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
