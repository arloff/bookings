import React from 'react'
import ReactDOM from 'react-dom'
import moment from 'moment';

import {Calendar, CalendarControls} from 'react-yearly-calendar'

function onDatePicked(date) {
  alert(date);
}
//const customClasses = day => ( day.isBefore( moment([day.year(),2,21]) ) || day.isAfter( moment([day.year(),11,21]) ) ) ? 'cheap low-season': 'expensive high-season'
const customClasses = {
    holidays: [
      '2018-04-25',
      '2018-05-01',
      '2018-06-02',
      '2018-08-15',
      '2018-11-01'
    ],
    spring: {
      start: '2018-03-21',
      end: '2018-6-20'
    },
    summer: {
      start: '2018-06-21',
      end: '2018-09-22'
    },
    autumn: {
      start: '2018-09-23',
      end: '2018-12-21'
    },
    weekend: 'Sat,Sun',
    winter: function(day) { return day.isBefore( moment([2018,2,21]) ) || day.isAfter( moment([2018,11,21]))}

}

class YearOfBookings extends React.Component {
  constructor(props) {
    super(props);

    const today = moment();

    this.state = {
      year: today.year(),
      selectedDay: today,
      selectedRange: [today, moment(today).add(15, 'day')],
      forceFullWeeks: false,
      showDaysOfWeek: true,
      showTodayBtn: true,
      showWeekSeparators: true,
      selectRange: true,
      firstDayOfWeek: 1
    }
  };


  onPrevYear() {
    this.setState(prevState => ({
      year: prevState.year - 1
    }));
  }

  onNextYear() {
    this.setState(prevState => ({
      year: prevState.year + 1
    }));
  }

  goToToday() {
    const today = moment();

    this.setState({
      selectedDay: today,
      selectedRange: [today, moment(today).add(15, 'day')],
      year: today.year()
    });
  }

  datePicked(date) {
    this.setState({
      selectedDay: date,
      selectedRange: [date, moment(date).add(15, 'day')]
    });
  }

  rangePicked(start, end) {
    this.setState({
      selectedRange: [start, end],
      selectedDay: start
    });
  }

  render() {
    const {
      year,
      showTodayBtn,
      selectedDay,
      showDaysOfWeek,
      forceFullWeeks,
      showWeekSeparators,
      firstDayOfWeek,
      selectRange,
      selectedRange
    } = this.state;

    return (
      <div>
        <div id="calendar">
          <CalendarControls
            year={year}
            showTodayButton={showTodayBtn}
            onPrevYear={() => this.onPrevYear()}
            onNextYear={() => this.onNextYear()}
            goToToday={() => this.goToToday()}
          />
          <Calendar
            year={year}
            selectedDay={selectedDay}
            showDaysOfWeek={showDaysOfWeek}
            forceFullWeeks={forceFullWeeks}
            showWeekSeparators={showWeekSeparators}
            firstDayOfWeek={firstDayOfWeek}
            selectRange={selectRange}
            selectedRange={selectedRange}
            onPickRange={(start, end) => this.rangePicked(start, end)}
            onPickDate={date => this.onDatePicked(date)}
            customClasses={customClasses}

          />
        </div>

      </div>
    );
  }
}



ReactDOM.render(
<div>
  <YearOfBookings />

  </div>,
  document.getElementById('react-content')
)
