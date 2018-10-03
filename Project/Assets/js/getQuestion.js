/**
 * 
 */


var score=0;

$(document).ready(function () {
	       
	      getTotalQuestion();
	      
	$("#nextBtn").click( function (){
	    if($('#answer').val() != undefined ) 
	     {
             if($('#answer').val() == $("input[name='radioBtn']:checked").val()){
                score=score+1;
                }
		   }
		    
		totalQuestion=totalQuestion-1;
		if(totalQuestion==0)
			{submitScore();}
		else{
		getQuestionId(totalQuestion);
		}
   });
	
	function nextQuestion(questionId){
	      $.ajax({
	         type: "Post"  ,
	         url: "/Project/Model/takeTest.cfc?method=getQuestions" ,
	         data:{qid:questionId },
	         datatype: "json",
	         
	         success:function(res)
	              {
	        	    var res= $.parseJSON(res);
	                if(res.DATA[0] == undefined){
	            	 submitScore();
	            	}
	              else{ 
	                $("#ques").html("<br>Ques :: &nbsp" +res.DATA[0][0]);
	                   for (i = 1; i < 5; i++) {
	                $('<br><br><input type="radio" name="radioBtn" value ='+i+'>&nbsp' + res.DATA[0][i] +'</input>').appendTo('#ques');
	                	}
	                $("#answer").val(res.DATA[0][5]);
	              }
	            }
	        });
	      }
	
	function submitScore()
	{  
	         if($('#answer').val() != undefined ) 
                  {
                 if($('#answer').val() == $("input[name='radioBtn']:checked").val()){
                     score=score+1;
                            }
	              }
	             alert("!!!  Test End  !!! Your Score is :: "+ score);
	         $.ajax({
		         type: "Post"  ,
		         url: "/Project/Model/takeTest.cfc?method=submitScore" ,
		         data:{ score:parseInt(score,10)},
		         datatype: "json",
		         success:function(res)
		              { 
                        var res= $.parseJSON(res);
		        	    console.log(res);
		        	    window.location.assign("http://localhost:5000/Project/view/studentDashboard.cfm")
		              }
		        });
              }
	
	function getQuestionId(tq)
	{
		
			 $.ajax({
		         type: "Post"  ,
		         url: "/Project/Model/takeTest.cfc?method=getQuestionId" ,
		         data:{ qno: tq},
		         datatype: "json",
		         
		         success:function(res)
		              {
		        	     questionId =$.parseJSON(res);
		        	     console.log(questionId);
		        	     nextQuestion(questionId);
		              }
		        });
			
		    }	
	
	
	function getTotalQuestion()
	{
		
			 $.ajax( {
		         type: "Post"  ,
		         url: "/Project/Model/takeTest.cfc?method=totalQuestion" ,
		         datatype: "json",
		         success:function(res)
		              {
		        	  totalQuestion= $.parseJSON(res);
		        	  console.log(totalQuestion);
		        	  getQuestionId(totalQuestion);
		              }
		        });
    }
	
	$("#submitBtn").click( function (){
		   submitScore();
		});
	
	//.........it call, when time will be over .
	
	$(function(){
		  $('.timer').startTimer({
		    onComplete: function(element){
		       submitScore();
		    }
		  }).click(function(){ 
			  //.......... it will fire, when some one click on timer
		  });
		});
		
	
	
});
  
 
 



