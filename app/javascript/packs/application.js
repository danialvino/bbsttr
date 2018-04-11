import "bootstrap";
import $ from 'jquery';
import 'fullcalendar';
import 'fullcalendar-scheduler';
import 'moment';
import { loadDynamicBannerText } from '../components/banner';
loadDynamicBannerText();
// document.getElementById('#calendar').fullCalendar({});

var array_available = [];
function createAvailableObject(element) {
    // debugger
  array_available.push(
    {
      title: "Oi",
      start: element.dataset.start,
      end: element.dataset.end
    }
  )
}

var elementsAvailable = $('.available');

for (var i = 0; i < elementsAvailable.length; i++) {
  createAvailableObject(elementsAvailable[i])
}


$('#calendar').fullCalendar({
    schedulerLicenseKey: 'CC-Attribution-NonCommercial-NoDerivatives',
    editable: false,
    contentHeight: 455,
    scrollTime: '06:00', // undo default 6am scrollTime
    firstDay: 0,
    selectable: true,
    selectHelper: true, // makes it so you can make a placeholder event
    header: {
      left: 'today prev,next',
      center: 'title',
      right: 'agendaDay,agendaWeek,month,listWeek'
    },
    defaultView: 'agendaWeek',
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
    resources: [],
    events: array_available,
  });
