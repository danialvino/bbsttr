//= require jquery
//= require rails-ujs
//= require moment
//= require fullcalendar
//= require flatpickr
//= require flatpickr/l10n/pt
//= require social-share-button
//= require timepiece
//= require bootstrap-toggle
//= require toastr
//= require_tree .

function loadflatpickr() {
  if ($('.flatpickr-input').length > 0) {
    flatpickr(".flatpickr-input", {
      dateFormat: 'Y-m-d H:i',
      minDate: new Date().fp_incr(0),
      enableTime: true,
      minuteIncrement: 30,
      time_24hr: true,
    });
  }
}
loadflatpickr()
function loadflatpickruser() {
  if ($('.flatpickr-user').length > 0) {
    flatpickr(".flatpickr-input", {
      minDate: new Date().fp_incr(0),
      dateFormat: 'd-m-Y',
      noCalendar: false,
    });
  }
}
loadflatpickruser()

