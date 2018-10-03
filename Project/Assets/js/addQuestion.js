/**
 * 
 */
          
    
         
          var q_Valid = false;
          var o1_Valid = false;
          var o2_Valid = false;
          var o3_Valid = false;
          var o4_Valid = false;
          var a_Valid = false;
         
          var option1;
          var option2;
          var option3;
          var option4;
        

          function formValidation() {

             
              quesValid();
              op1Valid();
              op2Valid();
              op3Valid();
              op4Valid();
              ansValid();
             
              if(option1==option2 ||option1==option3 ||option1==option4||
        	     option2==option3 || option2==option4 ||option3==option4){
            	  return ShowError("oid4","All options must be unique.");
              }
            	  
              
              
             if (q_Valid && o1_Valid && o2_Valid && o3_Valid && o4_Valid && a_Valid ) {
                  if (confirm("Question is going to add. Press OK/CANCEL"))
                      return true;
                  else
                      return false;
              } else return false;
          }
        
        //...................................................  Name Validation 
          function quesValid() {
              var ques = document.getElementById("quesId").value;
                  ques = ques.trim();
                  
               if (ques == "") {
                  q_Valid = ShowError("qid", "Please Enter Question Description");
              } 
              
             else {
            	  //document.getElementById("quesId").value =name.replace(/ {2,}/g, ' ');
                  q_Valid = done("qid");

              }
			}
          //............................................................                             Email Validation 
          function op1Valid() {

               option1 = document.getElementById("op1")
                  .value;
               option1 =  option1.trim();
               o1_Valid = optionValid(option1,"oid1"," Please Enter First option");
               
             
          }
          function op2Valid() {

               option2 = document.getElementById("op2")
                  .value;
               option2 =  option2.trim();
               
               o2_Valid = optionValid(option2,"oid2"," Please Enter Second option");
               if( o2_Valid){
               if(option1==option2)
            	   o2_Valid=DupError("oid2");
               }
          }
         
          function op3Valid() {

               option3 = document.getElementById("op3")
                  .value;
               option3 =  option3.trim();
               o3_Valid = optionValid(option3,"oid3"," Please Enter Third option");
               if( o3_Valid){
               if(option2==option3 )
            	   o3_Valid=DupError("oid3");
               }
          }
         
          function op4Valid() {

               option4 = document.getElementById("op4")
                  .value;
               option4 =  option4.trim();
               o4_Valid = optionValid(option4,"oid4"," Please Enter Last option");
               if( o4_Valid){
               if(option3==option4)
            	   o4_Valid=DupError("oid4");
               }
             
          }
          function ansValid()
          { var ans = document.getElementById("selID").value;
          
              if(ans == "0"){
        			  a_Valid = ShowError("sid", " Please Choose Answer");}
   			   else {
   				  a_Valid = done("sid");
   			   }
   	      }
         
         
         function optionValid(value,id,msg)
         {
        	 value = value.trim();
        	 if (value == "") {
                 return ShowError(id,msg);
             } 
              else {
                   return done(id);
             }
         }
     
          //.....................................   It will remove error
          function done(ids) {
              document.getElementById(ids).innerHTML = '';
              return true;
          }
          //.............  It will display error message on specified position(based on ids)
          function ShowError(ids, msg) {
              document.getElementById(ids)
                  .innerHTML = msg;
              return false;
          }
          //..................show Error on duplicate options 
          function DupError(ids)
          {
        	  document.getElementById(ids)
              .innerHTML = "You have already entered this option";
              return false; 
          }
         
          