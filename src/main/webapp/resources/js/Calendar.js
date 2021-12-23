//월간 달력 사용자 테마
var MONTHLY_CUSTOM_THEME = {
'month.schedule.borderRadius': '5px',
'month.schedule.height': '18px',
'month.schedule.marginTop': '2px',
'month.schedule.marginLeft': '10px',
'month.schedule.marginRight': '10px',
};

//캘린더 띄우기
var cal = new tui.Calendar('#calendar', {
	defaultView:'month',
//	 month: {
//    workweek: true // 주말 없는 월간 달력
//  },
	theme: MONTHLY_CUSTOM_THEME,
	taskView: false,    
    scheduleView: true,  
	useCreationPopup: true,
	useDetailPopup: true
}); 

//캘린더 이동 버튼
$('span#menu-navi > .btn').on('click', function (e) {
    var action = $(this).data('action');
    var year, month;
    switch (action) {
        case 'move-prev': //이전
        	cal.prev();
            break;
        case 'move-next': //다음
        	cal.next();
            break;
        case 'move-today': //오늘
        	cal.today();
            break;
        case 'move-2week': //2주 달력 보기
        	cal.setOptions({month: {visibleWeeksCount: 2}}, true);
        	cal.changeView('month', true);
        	break;
        case 'move-month': //월간 달력 보기
        	cal.setOptions({month: {visibleWeeksCount: null}}, true);
        	cal.changeView('month', true);
        	break;
        default:
            return;
    }
    setRenderRangeText(cal);

    e.stopPropagation();
    e.preventDefault();
    e.stopImmediatePropagation();
});

//오늘 연월(일) 찍기 (현재날짜)
function setRenderRangeText(cal) {
    var renderRange = document.getElementById('renderRange');
    var options = cal.getOptions();
    var viewName = cal.getViewName();
    var html = [];
    if (viewName === 'day') {
        html.push(moment(cal.getDate().getTime()).format('YYYY.MM.DD'));
    } else if (viewName === 'month' &&
        (!options.month.visibleWeeksCount || options.month.visibleWeeksCount > 4)) {
        html.push(moment(cal.getDate().getTime()).format('YYYY.MM'));
    } else {
        html.push(moment(cal.getDateRangeStart().getTime()).format('YYYY.MM.DD'));
        html.push(' ~ ');
        html.push(moment(cal.getDateRangeEnd().getTime()).format(' MM.DD'));
    }
    renderRange.innerHTML = html.join('');
}

//카테고리 리스트 (색깔)
function getUserData() {
    var users = [];
    var names = ['A', 'B', 'C', 'D', 'E']; // 카테고리 별 이름 설정
    var colors = ['#9e5fff', '#00a9ff', '#ff5583', '#03bd9e', '#bbdc00']; //카테고리 별 색깔 설정
    var employ_type = ['regular', 'regular', 'regular', 'regular', 'regular']
    for (var i = 0; i < 5; i++) { //카테고리 수 만큼
        var user = {
            'name': names[i],
            'id': String(i + 1),
            'employ_type': employ_type[i],
            'color': colors[i]
        };
        users.push(user);
    }
    return users;
}

/*function renderLNB(users) {
    var template = $('#template-lnb-calendars-item').html();
    Mustache.parse(template);   // optional, speeds up future uses
    var rendered = Mustache.render(template, {'users': users});
    $('#calendarList').html(rendered);
}

//카테고리 리스트 체크 박스 (해당버튼 클릭시 색깔에 해당하는 일정들만 출력)
function addLNBListener(users, cal) {
    $('div.lnb-calendars-item > label').off('click');
    $('div.lnb-calendars-item > label').on('click', function (e) {
        var id = $(this).find('input').val();
        var $firstSpan = $(this).find('span').first();
        var visible = $firstSpan.data('visible');
        if (visible == 'visible') {
            $firstSpan.css('background-color', 'transparent');
            cal.toggleSchedules(id, true, true);
            $firstSpan.data('visible', 'hidden');
        } else {
            $firstSpan.css('background-color', $firstSpan.css('border-color'));
            cal.toggleSchedules(id, false, true);
            $firstSpan.data('visible', 'visible');
        }
        e.stopPropagation();
        e.preventDefault();
        e.stopImmediatePropagation();
    });
}*/

//카테고리 별 캘린더 (일정등록 팝업창에 카테고리 리스트 표시)
/*var CalendarList = undefined;

function getCalendars(users) {
    var calendars = [];
    for (var user of users) {
        calendars.push({
            id: user['id'],
            name: user['name'],
            color: '#ffffff',
            bgColor: user['color'],
            dragBgColor: user['color'],
            borderColor: user['color'],
            checked: true
        })
    }
    CalendarList = calendars;
    return calendars;
}*/

//캘린더에 대한 것?
'use strict';

var CalendarList = [];

function CalendarInfo() {
    this.id = null;
    this.name = null;
    this.checked = true;
    this.color = null;
    this.bgColor = null;
    this.borderColor = null;
    this.dragBgColor = null;
}

function addCalendar(calendar) {
    CalendarList.push(calendar);
}

function findCalendar(id) {
    var found;

    CalendarList.forEach(function(calendar) {
        if (calendar.id === id) {
            found = calendar;
        }
    });

    return found || CalendarList[0];
}

function hexToRGBA(hex) {
    var radix = 16;
    var r = parseInt(hex.slice(1, 3), radix),
        g = parseInt(hex.slice(3, 5), radix),
        b = parseInt(hex.slice(5, 7), radix),
        a = parseInt(hex.slice(7, 9), radix) / 255 || 1;
    var rgba = 'rgba(' + r + ', ' + g + ', ' + b + ', ' + a + ')';

    return rgba;
}

$(document).ready(function () {
	var users = getUserData();
    renderLNB(users);
    var calendars = getCalendars(users); /* 카테고리 달력 */
    cal.setCalendars(calendars);  /* 카테고리  달력 */
    addLNBListener(users, cal);
    setRenderRangeText(cal);
  
  //저장된 일정 불러오기    
		$.ajax({
		url : "./calendarselectAll.do",
		type : "get",
		dataType : "json",
		success : function(msg){
			$.each(msg,function(key,value){
				   cal.createSchedules([
			         {
				//이부분 데이터 들
			           schedule_id: value.schedule_id,
					   mozzle_id : value.mozzle_id,
					   writer : value.writer,
			           title : value.title,
					   content : value.content,
			           category: value.category,
			           schedule_date: value.schedule_date,
		         }]);
			});
		},
		error : function() {
			alert("잘못된 요청입니다.");
		}
	});
}); 

//스케줄에 대한 것
(function(window, Calendar) {

    // event handlers
    cal.on({
        'clickMore': function(e) {
            console.log('clickMore', e);
        },
        'clickDayname': function(date) {
            console.log('clickDayname', date);
        },
        'afterRenderSchedule': function(e) {
            var schedule = e.schedule;
            var element = cal.getElement(schedule.id, schedule.schedule_id);
//          console.log('afterRenderSchedule', element);
        },
        'clickTimezonesCollapseBtn': function(timezonesCollapsed) {
            console.log('timezonesCollapsed', timezonesCollapsed);

            if (timezonesCollapsed) {
                cal.setTheme({
                    'week.daygridLeft.width': '77px',
                    'week.timegridLeft.width': '77px'
                });
            } else {
                cal.setTheme({
                    'week.daygridLeft.width': '60px',
                    'week.timegridLeft.width': '60px'
                });
            }
            return true;
        }
    });
    
    //일정 삭제
    cal.on('beforeDeleteSchedule',scheduleData => {
         
    	 var schedule = scheduleData.schedule;
    	 console.log(scheduleData.schedule);
         
         schedule_id= schedule.schedule_id;
         id= schedule.id;
         title= schedule.title;
         isAllDay= scheduleData.isAllDay;
         schedule_date = JSON.stringify(scheduleData.schedule_date);
         end = JSON.stringify(scheduleData.end);
         category = schedule.category;
         color = schedule.color;
         bgColor = schedule.bgColor;
         borderColor = schedule.borderColor;
         
         var con = confirm('일정을 삭제하시겠습니까?', schedule);
         if(con == true){
	         $.ajax({
	     		url : "./scheduledelete.do",
	     		type : "post",
	     		dataType : "json",
	     		data :
	     		{
	     			"id" : id
	     		},

	 	   		success : function(msg){
	 	   	        refreshScheduleVisibility();
	 	   	        console.log('beforeDeleteSchedule', [schedule]);
	 	   	        
	 	   	    	cal.deleteSchedule(schedule.id, schedule.schedule_id);
	 	   		},
 	    		error : function() {
 	    			alert("잘못된 요청입니다.");
 	    		}
 	    	});
	   	 }else{
   	    	return false;
   	    }
    });
    
    //일정 수정
    cal.on('beforeUpdateSchedule', function(event) {
        var schedule = event.schedule;
        var changes = event.changes;

        cal.updateSchedule(schedule.id, schedule.schedule_id, changes);
        if(changes.isAllDay == null) {
        	changes.isAllDay = schedule.isAllDay;
        }
        if(changes.schedule_id == null) {
        	changes.schedule_id = schedule.schedule_id;
        }
        if(changes.title == null) {
        	changes.title = schedule.title;
        }
        
        $.ajax({
    		url : "./scheduleupdate.do",
    		type : "post",
    		dataType : "json",
    		data :
    		{
    			"schedule_id" : changes.schedule_id,
    			"id" : schedule.id,
    			"title" : changes.title,
    			"category" : changes.isAllDay?'allday':'time',
    			"schedule_date" : JSON.stringify(schedule.schedule_date),
    			"end" : JSON.stringify(schedule.end)
    		},
	   		success : function(msg){
	   			console.log('beforeUpdateSchedule', [schedule]);
	   			console.log('beforeUpdateSchedule', [changes]);
	   		},
	    		error : function() {
	    			alert("잘못된 요청입니다.");
	    		}
	    	});
    });
    
    //일정 등록
    cal.on('beforeCreateSchedule', scheduleData => {
//    	var calendar = scheduleData.calendar || findCalendar(scheduleData.schedule_id);
        const schedule = {
		  schedule_id: String(Math.random() * 100000000000000000),
		  writer: scheduleData.writer,
          title: scheduleData.title,
          content: scheduleData.content,
          schedule_date: scheduleData.schedule_date,
		  regdate: scheduleData.regdate,
          location_code: scheduleData.location_code
        };
        
        schedule_id= schedule.schedule_id;
        title= scheduleData.title;
        schedule_date = JSON.stringify(scheduleData.schedule_date);
        
        $.ajax({
    		url : "./scheduleinsert.do",
    		type : "post",
    		dataType : "json",
    		data :
    		{
    			"schedule_id" : schedule_id,
				"writer" :  writer,
    			"title" : title,
    			"sd" : schedule_date,
    			"regdate" : regdate,
				"location_code" : location_code
    		},
   		success : function(msg){
   	         cal.createSchedules([schedule]);
   	         console.log('beforeCreateSchedule', [schedule]);
   		},
    		error : function() {
    			alert("잘못된 요청입니다.");
    		}
    	});
  });
    
    //?
    function saveNewSchedule(scheduleData) {
        console.log('scheduleData ', scheduleData)
        var calendar = scheduleData.calendar || findCalendar(scheduleData.schedule_id);
        var schedule = {
    		//schedule_id: String(Math.random() * 100000000000000000),
            schedule_id: scheduleData.schedule_id,
			writer: scheduleData.writer,
            title: scheduleData.title,
			content: scheduleData.content,
            schedule_date: scheduleData.schedule_date,
			regdate: scheduleData.regdate,
            location_code: scheduleData.location_code,

        };
        if (calendar) {
            schedule.schedule_id = calendar.schedule_id;
			
        }

        cal.createSchedules([schedule]);

        refreshScheduleVisibility();
    }
    
    //timetemplate
    function getTimeTemplate(schedule, isAllDay) {
        var html = [];
        var schedule_date = moment(schedule.schedule_date.toUTCString());
        if (!isAllDay) {
            html.push('<strong>' + schedule_date.format('HH:mm') + '</strong> ');
        }
        if (schedule.isPrivate) {
            html.push('<span class="calendar-font-icon ic-lock-b"></span>');
            html.push(' Private');
        } else {
            if (schedule.isReadOnly) {
                html.push('<span class="calendar-font-icon ic-readonly-b"></span>');
            } else if (schedule.recurrenceRule) {
                html.push('<span class="calendar-font-icon ic-repeat-b"></span>');
            } else if (schedule.attendees.length) {
                html.push('<span class="calendar-font-icon ic-user-b"></span>');
            } else if (schedule.location) {
                html.push('<span class="calendar-font-icon ic-location-b"></span>');
            }
            html.push(' ' + schedule.title);
        }

        return html.join('');
    }
    
    //?
    /*
    function onNewSchedule() {
        var title = $('#new-schedule-title').val();
        var location = $('#new-schedule-location').val();
        var isAllDay = document.getElementById('new-schedule-allday').checked;
        var schedule_date = datePicker.getStartDate();
        var end = datePicker.getEndDate();
        var calendar = selectedCalendar ? selectedCalendar : CalendarList[0];

        if (!title) {
            return;
        }

        console.log('calendar.id ', calendar.id)
        cal.createSchedules([{
            id: String(Math.random() * 100000000000000000),
            schedule_id: calendar.schedule_id,
            title: title,
            isAllDay: isAllDay,
            schedule_date: schedule_date,
            end: end,
            category: isAllDay ? 'allday' : 'time',
            dueDateClass: '',
            color: calendar.color,
            bgColor: calendar.bgColor,
            dragBgColor: calendar.bgColor,
            borderColor: calendar.borderColor,
            raw: {
                location: location
            },
//            state: 'Busy'
        }]);
        console.log(calendar.color);

        $('#modal-new-schedule').modal('hide');
    }
    */
    
    //?
    function onChangeNewScheduleCalendar(e) {
        var target = $(e.target).closest('a[role="menuitem"]')[0];
        var schedule_id = getDataAction(target);
        changeNewScheduleCalendar(schedule_id);
    }

    function changeNewScheduleCalendar(schedule_id) {
        var calendarNameElement = document.getElementById('calendarName');
        var calendar = findCalendar(schedule_id);
        var html = [];

        html.push('<span class="calendar-bar" style="background-color: ' + calendar.bgColor + '; border-color:' + calendar.borderColor + ';"></span>');
        html.push('<span class="calendar-name">' + calendar.name + '</span>');

        calendarNameElement.innerHTML = html.join('');

        selectedCalendar = calendar;
    }

    //아마도 new schedule 버튼(#btn-new-schedule) 만들면 오늘 날짜에 일정 들록 팝업창 뜨는 것 - 구현 안 함
    /*
    function createNewSchedule(event) {
        var schedule_date = event.schedule_date ? new Date(event.schedule_date.getTime()) : new Date();
        var end = event.end ? new Date(event.end.getTime()) : moment().add(1, 'hours').toDate();

        if (useCreationPopup == true) {
            cal.openCreationPopup({
                schedule_date: schedule_date,
                end: end
            });
        }
    }
    */
    
    function refreshScheduleVisibility() {
        var calendarElements = Array.prototype.slice.call(document.querySelectorAll('#calendarList input'));
        
        CalendarList.forEach(function(calendar) {
            cal.toggleSchedules(calendar.id, !calendar.checked, false);
        });

        cal.render(true);

        calendarElements.forEach(function(input) {
            var span = input.nextElementSibling;
            span.style.backgroundColor = input.checked ? span.style.borderColor : 'transparent';
        });
    }
    
    //오늘 연월 찍기 - 다른 형태
    /*
    function setRenderRangeText() {
        var renderRange = document.getElementById('renderRange');
        var options = cal.getOptions();
        var viewName = cal.getViewName();
        var html = [];
        if (viewName === 'day') {
            html.push(moment(cal.getDate().getTime()).format('MMM YYYY DD'));
        } else if (viewName === 'month' &&
            (!options.month.visibleWeeksCount || options.month.visibleWeeksCount > 4)) {
            html.push(moment(cal.getDate().getTime()).format('MMM YYYY'));
        } else {
            html.push(moment(cal.getDateRangeStart().getTime()).format('MMM YYYY DD'));
            html.push(' ~ ');
            html.push(moment(cal.getDateRangeEnd().getTime()).format(' MMM DD'));
        }
        renderRange.innerHTML = html.join('');
    }
    */

    //? 스케줄 생성예시?
    function setSchedules() {
        cal.clear();
        var schedules = [
            {id: 489273, title: 'Workout for 2020-04-05', isAllDay: false, schedule_date: '2020-03-03T11:30:00+09:00', end: '2020-03-03T12:00:00+09:00', goingDuration: 30, comingDuration: 30, color: '#ffffff', isVisible: true, bgColor: '#69BB2D', dragBgColor: '#69BB2D', borderColor: '#69BB2D', schedule_id: '1', category: 'allday', dueDateClass: '', customStyle: 'cursor: default;', isPending: false, isFocused: false, isReadOnly: false, isPrivate: false, location: '', attendees: '', recurrenceRule: '', state: ''},
            {id: 489273, title: 'Workout for 2020-04-05', isAllDay: false, schedule_date: '2020-03-11T11:30:00+09:00', end: '2020-03-11T12:00:00+09:00', goingDuration: 30, comingDuration: 30, color: '#ffffff', isVisible: true, bgColor: '#69BB2D', dragBgColor: '#69BB2D', borderColor: '#69BB2D', schedule_id: '2', category: 'allday', dueDateClass: '', customStyle: 'cursor: default;', isPending: false, isFocused: false, isReadOnly: false, isPrivate: false, location: '', attendees: '', recurrenceRule: '', state: ''},
            {id: 18073, title: 'completed with blocks', isAllDay: false, schedule_date: '2020-03-20T09:00:00+09:00', end: '2020-03-20T10:00:00+09:00', color: '#ffffff', isVisible: true, bgColor: '#54B8CC', dragBgColor: '#54B8CC', borderColor: '#54B8CC', schedule_id: '1', category: 'allday', dueDateClass: '', customStyle: '', isPending: false, isFocused: false, isReadOnly: false, isPrivate: false, location: '', attendees: '', recurrenceRule: '', state: ''},
            {id: 18073, title: 'completed with blocks', isAllDay: false, schedule_date: '2020-03-25T09:00:00+09:00', end: '2020-03-25T10:00:00+09:00', color: '#ffffff', isVisible: true, bgColor: '#54B8CC', dragBgColor: '#54B8CC', borderColor: '#54B8CC', schedule_id: '1', category: 'allday', dueDateClass: '', customStyle: '', isPending: false, isFocused: false, isReadOnly: false, isPrivate: false, location: '', attendees: '', recurrenceRule: '', state: ''},
            {id: 18073, title: 'completed with blocks', isAllDay: false, schedule_date: '2020-01-28T09:00:00+09:00', end: '2020-01-28T10:00:00+09:00', color: '#ffffff', isVisible: true, bgColor: '#54B8CC', dragBgColor: '#54B8CC', borderColor: '#54B8CC', schedule_id: '1', category: 'allday', dueDateClass: '', customStyle: '', isPending: false, isFocused: false, isReadOnly: false, isPrivate: false, location: '', attendees: '', recurrenceRule: '', state: ''},
            {id: 18073, title: 'completed with blocks', isAllDay: false, schedule_date: '2020-03-07T09:00:00+09:00', end: '2020-03-07T10:00:00+09:00', color: '#ffffff', isVisible: true, bgColor: '#54B8CC', dragBgColor: '#54B8CC', borderColor: '#54B8CC', schedule_id: '1', category: 'allday', dueDateClass: '', customStyle: '', isPending: false, isFocused: false, isReadOnly: false, isPrivate: false, location: '', attendees: '', recurrenceRule: '', state: ''},
            {id: 18073, title: 'Time Schedule Need BGCOLOR', isAllDay: false, schedule_date: '2020-03-28T09:00:00+09:00', end: '2020-03-28T10:00:00+09:00', color: '#ffffff', isVisible: true, bgColor: '#54B8CC', dragBgColor: '#54B8CC', borderColor: '#54B8CC', schedule_id: '1', category: 'time', dueDateClass: '', customStyle: '', isPending: false, isFocused: false, isReadOnly: false, isPrivate: false, location: '', attendees: '', recurrenceRule: '', state: ''},
            {id: 18073, title: 'Time Schedule Need BGCOLOR', isAllDay: false, schedule_date: '2020-03-17T09:00:00+09:00', end: '2020-03-17T10:00:00+09:00', color: '#ffffff', isVisible: true, bgColor: '#54B8CC', dragBgColor: '#54B8CC', borderColor: '#54B8CC', schedule_id: '3', category: 'time', dueDateClass: '', customStyle: '', isPending: false, isFocused: false, isReadOnly: false, isPrivate: false, location: '', attendees: '', recurrenceRule: '', state: ''}
        ];
        // generateSchedule(cal.getViewName(), cal.getDateRangeStart(), cal.getDateRangeEnd());
        cal.createSchedules(schedules);
        refreshScheduleVisibility();
    }

    function setEventListener() {
//         $('.dropdown-menu a[role="menuitem"]').on('click', onClickMenu);
        // $('#lnb-calendars').on('change', onChangeCalendars);

//        $('#btn-save-schedule').on('click', onNewSchedule);
//        $('#btn-new-schedule').on('click', createNewSchedule);

        $('#dropdownMenu-calendars-list').on('click', onChangeNewScheduleCalendar);
        window.addEventListener('resize', resizeThrottled);
    }
    
    function getDataAction(target) {
        return target.dataset ? target.dataset.action : target.getAttribute('data-action');
    }
    resizeThrottled = tui.util.throttle(function() {
        cal.render();
    }, 50);
    window.cal = cal;

//    setDropdownCalendarType();
//    setRenderRangeText();
    setSchedules();
    setEventListener();
})(window, tui.Calendar);