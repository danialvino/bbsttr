//= require jquery
//= require rails-ujs
//= require moment
//= require fullcalendar
//= require flatpickr
//= require_tree .

function loadflatpickr() {
  if ($('.flatpickr-input').length > 0) {
    flatpickr(".flatpickr-input", {
      enableTime: true,
      minuteIncrement: 30,
      time_24hr: true,
      parseDate: true,
    });
  }
}
loadflatpickr()
