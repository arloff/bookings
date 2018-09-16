import React from 'react'
import ReactDOM from 'react-dom'

import {Calendar, CalendarControls} from 'react-yearly-calendar'
//var {Calendar, CalendarControls} = require('react-yearly-calendar');

function onDatePicked(date) {
  alert(date);
}

ReactDOM.render(
  <div><p>huhu</p>
  <Calendar
    year={2018}
    onPickDate={onDatePicked}
  />
  </div>,
  document.getElementById('react-content')
)
