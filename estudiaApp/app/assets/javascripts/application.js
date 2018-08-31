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
// require rails-ujs
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

$( function() {
    var dialog, form,
    dialog = $( "#dialog-form" ).dialog({
      autoOpen: true,
      closeOnEscape: false,
      height: 400,
      width: 350,
      modal: true,
      dialogClass: "no-close",
      open: function(event, ui) { jQuery('.ui-dialog-titlebar-close').hide(); },
    
  
      buttons: {
        /*"Create an account": addUser,*/
        Cancel: function() {
          dialog.dialog( "close" );
        }
      },
      close: function() {
        form[ 0 ].reset();
        allFields.removeClass( "ui-state-error" );
      }
    });
  
    /*form = dialog.find( "form" ).on( "submit", function( event ) {
      event.preventDefault();
      addUser();
    });*/
  
    $( "#create-user" ).button().on( "click", function() {
      dialog.dialog( "open" );
    });
  } );
  