
<cfheader name="expires" value="#now()#">
<cfheader name="pragma" value="no-cache">
<cfheader name="cache-control" value="no-cache, no-store, must-revalidate">

<cfmodule template="../includes/pageValidate.cfm">
</cfmodule>


<!--- <cfif application.userValid EQ false>
	  <cflocation addtoken="no" url="studentDashboard.cfm">
      </cfif> --->

<cfif NOT isDefined("FORM.startTestBtn")>
<cflocation addtoken="no" url="studentDashboard.cfm" />
</cfif>
<cftry>
<cfif  SESSION.studentValid >
	<cflocation addtoken="no" url="studentDashboard.cfm" />
<cfelse>
<cfset SESSION.studentValid = true />

<cfset session.startTime = #DateTimeFormat(now(), "MM d yyyy HH:nn:ss ")# />
<html>
	<head>
		<link href="https://fonts.googleapis.com/css?family=Ubuntu" rel="stylesheet">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	    <link rel="stylesheet" href="../assets/css/signup.css">
	    <title>
			Online Test
		</title>
		<script>
          $().ready(function() {
          if(document.referrer != 'http://localhost:5000/'){
              history.pushState(null, null, '');
              window.addEventListener('popstate', function () {
              history.pushState(null, null, '');
            });
           }
        });


   /* $(function () {
        $(document).keydown(function (e) {
            return (e.which || e.keyCode) != 116;
        });
    });*/

     </script>

	</head>


	<body>
		<header>
			<img src="../assets/image/portal.JPG" alt="Online Examination Portal" width="900px">
		</header>
		<h3>
			<div id="bodyid">
					<div class='container'>
						<h1 class='timer' data-minutes-left=1>
						</h1>
					</div>


				<div id="ques" style="margin-left:50px">
					</div>
			        <br>

		           <br>
          <div id="btn" style="margin-left:100px">
			<input type="submit" value="Next" name="nextBtn" id="nextBtn">
            <input type="hidden" id="answer" name="answer">
			<input type="button" value="Submit Test" id="submitBtn">
			</div>
		</h3>
		</div>
		<script type="text/javascript" src="../assets/js/getQuestion.js"></script>

		<!--- This javaScript file for timer
		https://www.jqueryscript.net/time-clock/Simple-Countdown-Timer-Plugin-jQuery.html
		       --->
		<script type="text/javascript" src="../assets/js/countdownTimer.js"></script>
	</body>
</html>
</cfif>
<cfcatch type = "any">
 <cfset SESSION.studentValid = FALSE />
<!--- <cfdump var = "#session#" abort = "true"> --->
 <cflog file = "onlineExamErrorLog" text = "#cfcatch.message# #cfcatch.detail#..#now()#..Student [#SESSION.studentEmail#] try to Refresh" />
<cfoutput><h1>Refresh again</h1></cfoutput>
</cfcatch>
</cftry>

