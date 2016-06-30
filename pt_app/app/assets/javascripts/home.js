$(document).ready(function() {
  console.log("sanity check")
  
  $(".exercise").click(function(e){
    e.preventDefault();
    if (this.innerHTML == 'Remove') var action = 'remove'
    if (this.innerHTML == 'Add') var action = 'assign'
    sendData(this,action);
    switchAddRemove(this);
    e.stopPropagation();
    return false;
    });

});

function sendData(target,action){
  path = window.location.href.split("/").slice(0,5).join("/")+"/"+action+"_exercise"
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