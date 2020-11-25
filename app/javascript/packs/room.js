$(function() {
  $('#new_room_msg').on('ajax:success', function(a, b,c ) {
    $(this).find('input[type="text"]').val('');
  });
});
