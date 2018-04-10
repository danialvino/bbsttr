import "bootstrap";
import $ from 'jquery';
import 'fullcalendar';
import 'fullcalendar-scheduler';

// document.getElementById('#calendar').fullCalendar({});

$('#calendar').fullCalendar({
    schedulerLicenseKey: 'CC-Attribution-NonCommercial-NoDerivatives',

    editable: true,
    aspectRatio: 2,
    scrollTime: '00:00', // undo default 6am scrollTime

    header: {
      left: 'today prev,next',
      center: 'title',
      right: 'agendaDay, agendaWeek,month,listWeek'
    },
    defaultView: 'agendaDay',
    views: {
    },
    events: [
      { id: '1', start: '2018-04-09T02:00:00', end: '2018-04-09T07:10:00', title: 'event 1' },
    ]
  });
