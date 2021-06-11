// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//

//= require jquery3
//= require popper
//= require bootstrap-sprockets
//= require rails-ujs
//=require jquery
//= require activestorage
//= require turbolinks
//= require semantic-ui
//= require_tree .


// below the function we are saying that everytime scroll to the bottom when the function is called
// we grabbed the messages id from the div in the index.html.erb file in chatroom view
scroll_bottom = function() {
  if ($('#messages').length > 0 ){
    $('#messages').scrollTop($('#messages')[0].scrollHeight);
  }
}

//here we are creating a function(e) on keycode 13(which is enter) on the id of message body
submit_message = function(){
  $('#message_body').on('keydown', function(e) {
    //if enter is hit then click the nearest button
    if (e.KeyCode == 13) {
      $('button').click();
    };
  });
};

  //below we are saying that the message box value will be empty string after each time the buttom gets clicked
$(document).bind("ajax:beforeSend", function(){
    $('#message_body').val('');
});


$(document).on('turbolinks:load', function() {
  $('.ui.dropdown').dropdown();
  $('.message .close')
    .on('click', function() {
      $(this).closest('.message').transition('fade');
    });
    //calling the submit_message function
    submit_message();
    //calling the function below everytime the page loads
    scroll_bottom();
})
