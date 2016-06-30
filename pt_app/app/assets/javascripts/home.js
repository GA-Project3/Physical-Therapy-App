$(document).ready(function() {
  console.log("sanity check")
  
  $(".exercise").click(function(e){
    e.preventDefault();
    switchAddRemove(this);
    sendData(this);
    e.stopPropagation();
    return false;
    });

});

function sendData(target){
  path = window.location.href.split("/").slice(0,5).join("/")+"/assign_exercise"
  $.ajax({
  url: path,
  type: 'POST',
  data: {ids: {exercise_id: target.id}},
  headers: {
   'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
  },
  });
}

function switchAddRemove(target){
  if (target.innerHTML=="Remove") {
    target.innerHTML = "Add";
    $(target).removeClass("btn-warning");
    $(target).addClass("btn-success");
  }
  else {
    target.innerHTML = "Remove";
    $(target).removeClass("btn-success");
    $(target).addClass("btn-warning");
  };
}