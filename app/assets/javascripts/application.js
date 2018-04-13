//= require jquery
//= require rails-ujs
//= require moment
//= require fullcalendar
//= require flatpickr
//= require flatpickr/l10n/pt
//= require_tree .
function loadflatpickr() {
  if ($('.flatpickr-input').length > 0) {
    flatpickr(".flatpickr-input", {
      dateFormat: 'Y-m-d H:i',
      enableTime: true,
      minuteIncrement: 30,
      time_24hr: true,
      parseDate: true,
    });
  }
}
loadflatpickr()
function loadflatpickruser() {
  if ($('.flatpickr-user').length > 0) {
    flatpickr(".flatpickr-input", {
      dateFormat: 'd-m-Y',
      noCalendar: false,
      parseDate: true,
    });
  }
}
loadflatpickruser()
