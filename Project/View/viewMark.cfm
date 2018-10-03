
<cfmodule template="../includes/pageValidate.cfm">
</cfmodule>


<html>
	<head>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<link href="https://fonts.googleapis.com/css?family=Ubuntu" rel="stylesheet">
		<link rel="stylesheet" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css">
		<script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
         <link rel="stylesheet" href="../assets/css/student.css">
		<title>
			Student Result
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
		<h3>
		<ul >
			<li>
				<a href="../Controller/logoutAction.cfm">
					Logout
				</a>
			</li>
			<li>
				<a href="viewMark.cfm">
					Marks
				</a>
			</li>
			<li>
				<a href="testInstruction.cfm">
					Take Test
				</a>
			</li>
			<li>
				<a href="profile.cfm">
					Profile
				</a>
			</li>
		</ul>
		<div id="bodyid">
			<br>
			<cfset mark = application.viewDetailsObj.getMark()>
			<table id="tableId" class="cell-border order-column compact stripe hover">
				<thead>
					<tr>
						<th>
							Student Email
						</th>
						<th>
							Start Time
						</th>
						<th>
							End Time
						</th>
						<th>
							Score
						</th>
					</tr>
				</thead>
				<tbody>
					<cfoutput query="mark">
						<tr>
							<td>
								#studentEmail#
							</td>
							<td>
								#startDate#
							</td>
							<td>
								#endDate#
							</td>
							<td>
								#score#
							</td>
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
