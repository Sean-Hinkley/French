document.addEventListener("turbolinks:load", () =>{
  /* Start of calendar JS
  Gets all calendar days and assigns it to a variable*/
  var allCalendarDays = $(".day")
  // This variable is used to give every calendar a unique id
  var idNum = 1;
  // Checks whether the user can see the add calendar day icons
  var childrenLength = 3
  var skipLength = 2
  if($(this).find("div.calendarIconContainer").length != 0){
    childrenLength = 4
    skipLength = 3
  }
  // Loops over all calendar days
  allCalendarDays.each(function(){
    // Checks if there is more than three events in one day
    if($(this).children().length >= childrenLength){
      // Start of creating the More Events button
      var seeMoreDiv = document.createElement("div");
      var seeMore = document.createElement("small");
      seeMoreDiv.append(seeMore);
      seeMore.innerHTML = "More Events ►"
      $(this).append(seeMoreDiv);
      var seeMore = $(this).children().last().children().last();
      var seeMoreDiv = $(this).children().last();
      seeMoreDiv.addClass("text-center");
      seeMore.addClass("seeMore");
      seeMore.attr("data-bs-toggle", "collapse")
      seeMore.attr("href", "#collapseDiv" + idNum.toString());
      seeMore.attr("aria-expanded", "false")
      seeMore.attr("aria-controls", "collapseDiv" + idNum.toString());
      seeMore.addClass("text-primary");
      /* End of creating the More Events button
      Start of creating the collapse div (Div that is the container of the collapsed events) */
      var collapseDiv = document.createElement("div");
      $(this).append(collapseDiv);
      var collapseDiv = $(this).children().last()
      collapseDiv.addClass("collapse");
      collapseDiv.attr("id", "collapseDiv" + idNum.toString());
      /* End of Creating the collapse Div 
      Start of putting all of the events into the collapse div besides the last two elements and the first two events */ 
      var firstCheck = 0;
      var lastCheck = $(this).children().length - 2;
      // Loops over all of the events and if it isn't the first two events or the last two elements then the event is appended
      $(this).children().each(function(){
        if(firstCheck >= skipLength && firstCheck != lastCheck){
          collapseDiv.append($(this));
        }
        firstCheck++;
      });
      idNum++;
      // End of putting all of the events into the collapse div
    }
  });
  // Code to check if the More events button is being clicked
  $(".seeMore").click(function(){
    if($(this).hasClass("hasBeenClicked")){
      $(this).text("More Events ►");
      $(this).removeClass("hasBeenClicked");
    }
    else{
      $(this).text("More Events ▼");
      $(this).addClass("hasBeenClicked");
    }
  });
  // End of Calendar JS
  //Start of sidebar code, checks if the sidebar can scroll and if it can removes the column class.
  if(document.getElementById("sideBar").scrollWidth > document.getElementById("sideBar").clientWidth){
    $("#centerRow").removeClass("justify-content-center")
  }
});