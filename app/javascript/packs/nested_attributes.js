$(document).on('click', '#sub-field', function(){
  var field = $(this).data('field');
  var new_id = new Date().getTime();
  $('.sub_address').append(field.replace(/hello/g, new_id));
});

$(document).on('click', '.remove-btn', function() {
  $(this).parent().remove();
});