/* eslint react/no-multi-comp:0, no-console:0 */

import React from 'react';
import ReactDOM from 'react-dom';
import Picker from 'rc-calendar/lib/Picker';
import RangeCalendar from 'rc-calendar/lib/RangeCalendar';
import deDE from 'rc-calendar/lib/locale/de_DE';
import enUS from 'rc-calendar/lib/locale/en_US';
import TimePickerPanel from 'rc-time-picker/lib/Panel';
import 'rc-calendar/assets/index.css';
import 'rc-time-picker/assets/index.css';

import moment from 'moment';
import 'moment/locale/en-gb';
import 'moment/locale/de';

const cn = false;

if (cn) {
  moment.locale('en-gb');
} else {
  moment.locale('de-de');
}

const now = moment();
if (cn) {
  now.utcOffset(0);
} else {
  now.utcOffset(1);
}

const defaultCalendarValue = now.clone();
defaultCalendarValue.add(-1, 'month');

const timePickerElement = (
  <TimePickerPanel
    defaultValue={[moment('00:00:00', 'HH:mm:ss'), moment('23:59:59', 'HH:mm:ss')]}
  />
);

function newArray(start, end) {
  const result = [];
  for (let i = start; i < end; i++) {
    result.push(i);
  }
  return result;
}

function disabledDate(current) {
  const date = moment();
  date.hour(0);
  date.minute(0);
  date.second(0);
  return current.isBefore(date);  // can not select days before today
}


//const formatStr = 'YYYY-MM-DD HH:mm:ss';
const formatStr = 'DD.MM.YYYY';
function format(v) {
  return v ? v.format(formatStr) : '';
}

function isValidRange(v) {
  return v && v[0] && v[1];
}

function onStandaloneChange(value) {
  console.log('onChange');
  console.log(value[0] && format(value[0]), value[1] && format(value[1]));
}

function onStandaloneSelect(value) {
  console.log('onSelect');
  console.log(format(value[0]), format(value[1]));
}


ReactDOM.render(
  <div>
    <div style={{ margin: 10 }}>
      <RangeCalendar
        showToday={true}
        showWeekNumber
        dateInputPlaceholder={['Anreisetag', 'Abreisetag']}
        locale={cn ? enUS : deDE}
        showOk={false}
        showClear
        format={formatStr}
        onChange={onStandaloneChange}
        onSelect={onStandaloneSelect}
        disabledDate={disabledDate}
        timePicker={timePickerElement}
        renderFooter={() => <span>Zeitraum Buchung: </span>}
      />
    </div>
    <br />

  </div>, document.getElementById('year-calendar'));
