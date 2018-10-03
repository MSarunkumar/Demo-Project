
<cfmodule template="../includes/adminPageValidate.cfm" >
</cfmodule>
<html>
	<head>
		<link href="https://fonts.googleapis.com/css?family=Ubuntu" rel="stylesheet">
		<title>
			Adding Question
		</title>
		<link rel="stylesheet" href="../assets/css/addQuestion.css">
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
				<div id="err" style="color:red;font-size:13px;margin-left:200px;">
					<cfset errorArray=["!!! All Fields are required  !!!",
						"!!! Question Added Successfully !!!",
						"All Options Must be unique",
						"Internal Problem. Please try again "] />
					<cfif isDefined("URL.errID") >
						<cfif URL.errID EQ 2>
							<cfoutput>#errorArray[2]# </cfoutput>
					    <cfelseif URL.errID EQ 1>
							<cfoutput>#errorArray[1]# </cfoutput>
							<cfelseif URL.errID EQ 3>
							<cfoutput>#errorArray[3]# </cfoutput>
							<cfelse>
							<cfoutput>#errorArray[4]#</cfoutput>
				        </cfif>

					<cfelse>
					</cfif>
				</div>
				<cfform action="../Controller/addQuestionAction.cfm" onsubmit="return formValidation()" method="POST" id='form' >
					<div class="position">
						Question
					</div>
					<br>
					<cfinput type='text' id="quesId" name="quesId" placeholder='Question Description ' class="input_box_ques" maxlength="900" onblur="quesValid()">
					<div id='qid' class="err">
					</div>
					<br>
					<div class="position">
						Option 1:
					</div>
					<br>
					<cfinput type='text' id="op1" name="op1" placeholder='First Option' class="input_box" maxlength="250" onblur="op1Valid()">
					<div id= 'oid1' class="err">
					</div>
					<br>
					<div class="position">
						Option 2:
					</div>
					<br>
					<cfinput type='text' id="op2" name="op2" placeholder='Second Option' class="input_box" maxlength="250" onblur="op2Valid()">
					<div id='oid2' class="err">
					</div>
					<br>
					<div class="position">
						Option 3:
					</div>
					<br>
					<cfinput type='text' id="op3" name="op3" class="input_box" placeholder='Third Option' maxlength="250" onblur="op3Valid()">
					<div id='oid3' class="err">
					</div>
					<br>
					<div class="position">
						Option 4:
					</div>
					<br>
					<cfinput type='text' id="op4" name="op4" placeholder='Fourth Option' class="input_box" maxlength="250" onblur="op4Valid()">
					<div id='oid4' class="err">
					</div>
					<br>
					<div class="position">
						Answer
					</div>
					<br>
					<cfselect  id="selID" name="selId"   class="input_box" onChange="ansValid()">
						<!--- bind="cfc:bindFcns.getstates()" bindonload="true" --->
						<option  value="0">
							Choose Answer
						</option>
						<option  value="1">
							1
						</option>
						<option  value="2">
							2
						</option>
						<option  value="3">
							3
						</option>
						<option  value="4">
							4
						</option>
					</cfselect>
					<div id='sid' class="err">
					</div>
					<br><br>
					<cfinput type='Submit' value='Add Question' class='btn' name='submit'>
			</div>
			</cfform>
			<br>
			<script type="text/javascript" src="../assets/js/addQuestion.js"> </script>
		</h4>
		</div>
		<footer>
		</footer>
	</body>
</html>
