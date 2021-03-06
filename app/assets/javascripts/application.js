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
//= require activestorage
//= require turbolinks
//= require jquery
//= require link_to_add_fields
//= require_tree .

function verify_new_info(div_id, date = null){
  setInterval(function(){
    $.ajax({
      type: 'POST',
      url: '/main/verify_new_info',
      data: {date: date},
      cache: false,
      headers: { 'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content') }
    }).done(function( data ) {
        date = data.date;
        if(data.msg != ''){
          $('#'+div_id).text(data.msg);
        }
    });
  }, 10000);
}

document.addEventListener("turbolinks:load", function() {
  $('#main_alert').delay(5000).animate({opacity: 0}, 1000, function(){
    $('#main_alert').css('display', 'none');
  });
  $('#main_notice').delay(5000).animate({opacity: 0}, 1000, function(){
    $('#main_notice').css('display', 'none');
  });

  $('div').tooltip({placement: 'bottom', trigger: 'hover'});
  $('.nav-item').on('click', function(e) {
      localStorage.setItem('activeTab', $(e.target).attr('href'));
  });

  var activeTab = localStorage.getItem('activeTab');
  if(activeTab){
      if(activeTab != '/lists/new'){
        $('#main_page_tabs a[href="' + activeTab + '"]').tab('show');
      }
  }
});

