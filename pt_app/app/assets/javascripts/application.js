// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//

//= require jquery
// = require bootstrap
//= require jquery_ujs
//= require turbolinks
//= require bootstrap-sprockets
//= require_tree .

$(document).ready(function() {

  $(".exercise").click(function(e){
    e.preventDefault;
    $.ajax({
      url: window.location.href.split("/").slice(0,5).join("/")+"/assign_exercise"
      type: 'GET',
      data: {ids: {patient_id: this.target.pid,
                    exercise_id: this.target.id}},
      success: function(){
        $(".exercise").addClass("done");
      }
    });
    alert( "Handler for "+ this.id +" called." );
    
  });
});



