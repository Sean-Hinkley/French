document.addEventListener("turbolinks:load", () => {
	console.log("CODE EXECUTED!");
	$("#emailUsButton").click(function(){
	  $("#emailUsBG").toggleClass("bg-primary");
	  $("#emailUsBG").toggleClass("bg-success");
	  $("#emailUsForm").submit();
	});
	$("#emailUsButton").mouseenter(function(){
	  $("#emailUsBG").toggleClass("bg-primary");
	  $("#emailUsBG").toggleClass("bg-success");
	});
	$("#emailUsButton").mouseleave(function(){
	  $("#emailUsBG").toggleClass("bg-primary");
	  $("#emailUsBG").toggleClass("bg-success");
	});
});