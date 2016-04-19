

function numbersOnly(data) {
  return /[^0-9]/.test(data);
}

function usernameChars(data) {
  return /^[a-zA-Z0-9_-]*$/.test(data);
}



$(document).ready(function() {

  /* Birthday input validation */

  $('#birthday-month').on('keyup', function(e) {

    if ( e.which !== 9 ) {

      var current_val = $(this).val();

      if ( numbersOnly(current_val) ) {
        $(this).val('');
        $('#birthday-errors').show().text('Numbers only please :)');
      }
      else {

        if ($(this).val().length == 2) {
          $('#birthday-day').focus();
        }

      }

    }

  }).on('keydown', function() {
    if ( $('#birthday-errors').is(':visible') ) {
        $('#birthday-errors').hide().text('');
      }
  });


  $('#birthday-day').on('keyup', function(e) {

    if ( e.which !== 9 ) {

      var current_val = $(this).val();

      if ( numbersOnly(current_val) ) {
        $(this).val('');
        $('#birthday-errors').show().text('Numbers only please :)');
      }
      else {

        if ( $(this).val().length == 2 ) {
          $('#birthday-year').focus();
        }

      }

    }

  }).on('keydown', function() {
    if ( $('#birthday-errors').is(':visible') ) {
      $('#birthday-errors').hide().text('');
    }
  });


  $('#birthday-year').on('keyup', function() {

    var current_val = $(this).val();

    if ( numbersOnly(current_val) ) {
      $(this).val('');
      $('#birthday-errors').show().text('Numbers only please :)');
    }

  }).on('keydown', function() {
    if ( $('#birthday-errors').is(':visible') ) {
      $('#birthday-errors').hide().text('');
    }
  });


/* username check */

  $('#user_username').on('keyup', function(e) {
    var val = $(this).val();
    if ( val !== '') {
      if ( usernameChars(val) ) {
        if ( $('#username-errors').is(':visible') ) {
          $('#username-errors').hide().text('');
        }
        $.post('/check_username', { 'username' : val })
          .done(function(data) {
            if ( data.taken) {
              $('#username-errors').show().text(data.taken);
            }
          });
      }
      else if (e.which === 9) {
        if ( $('#username-errors').is(':visible') ) {
          $('#username-errors').hide().text('');
        }
      }
      else {
        $('#username-errors').show().text('Letters and numbers only please :)');
      }

    }
    
  });



});

