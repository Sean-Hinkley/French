document.addEventListener("turbolinks:load", () => {
  var selectBox = false;
  $("#rememberButton").click(function(){
  	  $("#rememberBG").toggleClass("bg-danger");
  	  $("#rememberBG").toggleClass("bg-success");
	  if(selectBox == false){
		  $("#xCircle").fadeToggle("fast", function(){
			  $("#checkCircle").fadeToggle("fast", function(){;
			    selectBox = true;
        });
		  });
	  }
	  else{
	    $("#checkCircle").fadeToggle("fast", function(){
			  $("#xCircle").fadeToggle("fast", function(){
			    selectBox = false;
        });
		  });
	  }
  });
  $("#deviseLogInButton").click(function(){
	$("#logInBG").toggleClass("bg-primary");
	$("#logInBG").toggleClass("bg-success");
	$("#logInForm").submit();
  });
  $("#deviseLogInButton").mouseenter(function(){
	$("#logInBG").toggleClass("bg-primary");
	$("#logInBG").toggleClass("bg-success");
  });
  $("#deviseLogInButton").mouseleave(function(){
	$("#logInBG").toggleClass("bg-primary");
	$("#logInBG").toggleClass("bg-success");
  });

  $("#deviseSignUpButton").click(function(){
	$("#signUpBG").toggleClass("bg-primary");
	$("#signUpBG").toggleClass("bg-success");
  });
  $("#deviseSignUpButton").mouseenter(function(){
	$("#signUpBG").toggleClass("bg-primary");
	$("#signUpBG").toggleClass("bg-success");
  });
  $("#deviseSignUpButton").mouseleave(function(){
	$("#signUpBG").toggleClass("bg-primary");
	$("#signUpBG").toggleClass("bg-success");
  });

  $("#deviseForgotButton").click(function(){
	$("#forgotBG").toggleClass("bg-primary");
	$("#forgotBG").toggleClass("bg-danger");
  });
  $("#deviseForgotButton").mouseenter(function(){
	$("#forgotBG").toggleClass("bg-primary");
	$("#forgotBG").toggleClass("bg-danger");
  });
  $("#deviseForgotButton").mouseleave(function(){
	$("#forgotBG").toggleClass("bg-primary");
	$("#forgotBG").toggleClass("bg-danger");
  });

  if($(".field_with_errors")[0]){

	var errorFormsChildren = $(".field_with_errors").children();
	errorFormsChildren.unwrap();
  }
});
