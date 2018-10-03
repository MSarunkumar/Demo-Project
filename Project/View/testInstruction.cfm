
 <cfmodule template="../includes/pageValidate.cfm">
</cfmodule>

<html>
	<head>
		<link href="https://fonts.googleapis.com/css?family=Ubuntu" rel="stylesheet">
		<title>
			Test Instructions
		</title>
		 <link rel="stylesheet" href="../assets/css/student.css">
	</head>
	<body>
		<header>
	      <img src="../assets/image/portal.JPG" alt="Online Examination Portal" width="900px">
        </header>

		<h3>
			<ul >
			 <li><a href="../Controller/logoutAction.cfm">Logout</a></li>
		     <li><a href="viewMark.cfm">Marks</a></li>
		     <li><a href="testInstruction.cfm">Take Test</a></li>
		     <li><a href="profile.cfm"> Profile </a></li>
	         </ul>
<div id="bodyid">
 <!--- <script type="text/javascript">
  function opennew(url) {
      var win= window.open(url, '','scrollbars=no,menubar=no,resizable=yes,toolbar=no,location=no,status=no');
      }
  </script> --->



<!--- <ol Style="float:right; margin-left:40px"><br>
<img height="100px" width="100px" src="../assets/image/instructions.jpg"
   style="margin-right:200px margin-top:100px">
<h2>Instructions:</h2>
<li>
Once You start the test, you can not pause/resume.
</li>
<br><br><br>
<li>
You can not go to previous questions,So please try to attempt in one time.
</li>
<br><br><br>
<li>
	Once you  start the test. Don`t Press refresh button otherwise your score will not be submit.
</li>

</ol> --->
<div id="ins" style="margin-left:20px">
	<img height="100px" width="100px" src="../assets/image/instructions.jpg">
<pre>
<h1>Instructions:</h1>

1.Once You start the test, you can not pause/resume.

2.You can not go to previous questions,So please try to attempt in one time.

3.Once you start the test. Don`t Press refresh button otherwise your score will not be submit.


</div>
</pre>

<br><br><br><br>

<cfform action="takeTest.cfm" >
<div id="test">
<cfinput type="submit" id="testBtn" name="startTestBtn" value="Start Test"  >
</div>
</cfform>


</h3> </div>

<footer>
</footer>
</body> </html>
