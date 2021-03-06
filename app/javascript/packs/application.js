import "bootstrap";
import $ from 'jquery';
import 'moment';
import 'fullcalendar';
import 'fullcalendar-scheduler';
import { loadDynamicBannerText } from '../components/banner';
loadDynamicBannerText();

// document.getElementById('#calendar').fullCalendar({});

$('#calendar').fullCalendar({
    schedulerLicenseKey: 'CC-Attribution-NonCommercial-NoDerivatives',
    editable: false,
    locale: "pt-BR",
    scrollTime: '06:00', // undo default 6am scrollTime
    contentHeight: 455,
    firstDay: 0,
    slotLabelInterval: "00:30",
    selectable: true,
    selectHelper: true, // makes it so you can make a placeholder event
    header: {
      left: 'today prev,next',
      center: 'title',
      right: 'agendaWeek,month,listWeek'
    },
    defaultView: 'listWeek',
    views: {
      agendaWeek:{
      allDaySlot: false,
      nowIndicator: true,
      },
      month:{
        showNonCurrentDates: false,
      },
      listWeek:{
      noEventsMessage: "Sem horários de trabalho ou crianças para cuidar!.",
      timeFormat: 'H:mm',
      },
    },
    resources: [],
    events: '/api/v1/availables',
    // events: array_available,
    eventClick: function(event) {
    if (event.color == "red"){
      {
        window.open(`/bookings/${event.id}`, "_self");
      }
    }
      else {
      {
        window.open(`/availables/${event.id}`, "_self");
      }

      }
  }
  });


