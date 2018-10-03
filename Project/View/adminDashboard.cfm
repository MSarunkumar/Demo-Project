
<cfheader name="expires" value="#now()#">
<cfheader name="pragma" value="no-cache">
<cfheader name="cache-control" value="no-cache, no-store, must-revalidate">

<cfmodule template="../includes/adminPageValidate.cfm" >
</cfmodule>

<html>
	<head>
		<link href="https://fonts.googleapis.com/css?family=Ubuntu" rel="stylesheet">
		<title>
			Admin Dashboard
		</title>
		<link rel="stylesheet" href="../assets/css/adminDashboard.css">
	</head>
	<body>
		<header>
			<img src="../assets/image/portal.JPG" alt="Online Examination Portal" width="900px">
		</header>
		<h3>
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
				<center>
					<h1>
						Admin Portal
					</h1>
					<img  alt="admin Protal" height="300px" src="../assets/image/adminPortal.jpg" width="500px">
				</center>

		</h3>
		</div>
		<footer>
		</footer>
	</body>
</html>
