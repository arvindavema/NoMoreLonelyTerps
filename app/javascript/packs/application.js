// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
import 'jquery'
import 'popper.js'
import 'bootstrap'
import '../stylesheets/application'
import './_custom.js'
import "@fortawesome/fontawesome-free/js/all";

//= require moment
//= require fullcalendar

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

require("trix")
require("@rails/actiontext")
require("jquery-ui")
require("moment")
require("fullcalendar")
function eventCalendar() {
  return $('#calendar').fullCalendar({ });
};
function clearCalendar() {
  $('#calendar').fullCalendar('delete');
  $('#calendar').html('');
};
$(document).on('turbolinks:load', function(){
  eventCalendar();
});
$(document).on('turbolinks:before-cache', clearCalendar);
