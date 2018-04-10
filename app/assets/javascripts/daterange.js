$(document).ready(function() {
  $(".daterange").daterangepicker({
    singleDatePicker: true,
    timePicker: true,
        timePickerIncrement: 30,
        locale: {
            format: 'DD/MM/YYYY h:mm A'
        }});
});
