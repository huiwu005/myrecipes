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
//= require rails-ujs
//= require jquery
//= require bootstrap-sprockets
//= require turbolinks
//= require_tree .

// when page rolled, it starts from the bottom
function scrollToBottom(){
    if($('#messages').length > 0) {
      $('#messages').scrollTop($('#messages')[0].scrollHeight);
    }
}

// used in course, but doesn't work mostly due to rails version issue

// function submitMessage(event){
//   event.preventDefault();
//   $('#new_message').submit();
// }

// $(document).on('keypress', '[data-behavior~=room_speaker]', function(event) {
//   if (event.keyCode == 13) {
//     submitMessage(event);
//   }
// });

// $(document).on('click', '[data-send~=message]', function(event) {
//   submitMessage(event);
// });

$(document).ready(function() {
  // $("#new_message").on("ajax:complete", function(e, data, status) {
  //   $('#message_content').val('');
  // })
  scrollToBottom();
});

$('#send').keypress(function(e){
  if(e.which == 13){
       $(this).closest('form').submit();
   }
});