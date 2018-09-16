/* eslint react/no-multi-comp:0, no-console:0, no-unused-vars:0 */
import 'rc-calendar/assets/index.css';
import React from 'react';
import ReactDOM from 'react-dom';
import Calendar from 'rc-calendar';
import RangeCalendar from 'rc-calendar/lib/RangeCalendar';

import Select, { Option } from 'rc-select';
import 'rc-select/assets/index.css';

class YearCalendar extends React.Component {
  state = {
    mode: 'month',
    rangeStartMode: 'date',
    rangeEndMode: 'date',
  };


  render() {
    return (<div>
    <h2>hello ...</h2>
    <RangeCalendar
  />
    </div>
    );
  }
}

ReactDOM.render(<YearCalendar />, document.getElementById('year-calendar'));
