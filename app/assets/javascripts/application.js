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
const Portuguese =
CustomLocale = {
  weekdays: {
    shorthand: ["Dom", "Seg", "Ter", "Qua", "Qui", "Sex", "Sáb"],
    longhand: [
      "Domingo",
      "Segunda-feira",
      "Terça-feira",
      "Quarta-feira",
      "Quinta-feira",
      "Sexta-feira",
      "Sábado",
    ],
  },

  months: {
    shorthand: [
      "Jan",
      "Fev",
      "Mar",
      "Abr",
      "Mai",
      "Jun",
      "Jul",
      "Ago",
      "Set",
      "Out",
      "Nov",
      "Dez",
    ],
    longhand: [
      "Janeiro",
      "Fevereiro",
      "Março",
      "Abril",
      "Maio",
      "Junho",
      "Julho",
      "Agosto",
      "Setembro",
      "Outubro",
      "Novembro",
      "Dezembro",
    ],
  },

  rangeSeparator: " até ",
};

function loadflatpickr() {
  if ($('.flatpickr-input').length > 0) {
    flatpickr(".flatpickr-input", {
      dateFormat: 'Y-m-d H:i',
      minDate: new Date().fp_incr(0),
      enableTime: true,
      minuteIncrement: 30,
      time_24hr: true,
      "locale": Portuguese
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
      "locale": Portuguese
    });
  }
}
loadflatpickruser()

