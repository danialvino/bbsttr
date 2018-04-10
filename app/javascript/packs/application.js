import "bootstrap";
import $ from 'jquery';
import 'fullcalendar';
import 'fullcalendar-scheduler';

// document.getElementById('#calendar').fullCalendar({});

$('#calendar').fullCalendar({
    schedulerLicenseKey: 'CC-Attribution-NonCommercial-NoDerivatives',
    editable: false,
    contentHeight: 455,
    scrollTime: '00:00', // undo default 6am scrollTime
    firstDay: 0,
    selectable: true,
    // selectHelper: true, // makes it so you can make a placeholder event
    header: {
      left: 'today prev,next',
      center: 'title',
      right: 'agendaDay,agendaWeek,month,listWeek'
    },
    defaultView: 'agendaDay',
    views: {
      agendaDay:{
      allDaySlot: false,
      nowIndicator: true,
      },
      agendaWeek:{
      allDaySlot: false,
      nowIndicator: true,

      },
      month:{
        showNonCurrentDates: false,
      },
      listWeek:{
      noEventsMessage: "No kids to take care.",
      },
    },
    events: [
      { id: '1', start: '2018-04-09T02:00:00', end: '2018-04-09T03:30:00', title: 'event 1' },
    ]

  });
