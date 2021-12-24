<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일정관리</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="https://uicdn.toast.com/tui.time-picker/latest/tui-time-picker.css">
<link rel="stylesheet" type="text/css" href="https://uicdn.toast.com/tui.date-picker/latest/tui-date-picker.css">
<link rel="stylesheet" type="text/css" href="https://nhn.github.io/tui.calendar/latest/examples/css/icons.css">
<link rel="stylesheet" type="text/css" href="./resources/css/tui-calendar.css"><!-- dist> tui-calendar.css css파일 > -->
<link rel="stylesheet" href="./resources/css/Calendar.css"> <!-- css > Calendar.css css파일 > -->
</head>
<body>
<section class="container mt-3" id="new-mozzle2">
     <jsp:include page="../comm/mozzleHeader.jsp" />
</section>
<form action="./calendar.do" method="get">
<div class="col-xs-2" style="margin-top: 63px;">
		<div>
        <!-- <div class="lnb-new-schedule">
            <button id="btn-new-schedule" type="button" class="btn btn-default btn-block lnb-new-schedule-btn" data-toggle="modal">New schedule</button>
        </div>
        <div id="lnb-calendars" class="lnb-calendars">
            <div>
                <div class="lnb-calendars-item">
                    <label>
                        <input type="checkbox" value="all" checked>
                        <span></span>
                        <strong>View all</strong>
                    </label>
                </div>
            </div>-->
            <div id="calendarList" class="lnb-calendars-d1">
			</div>
       	</div>
</div>

<div id="calendarList" class="lnb-calendars-d1 list-group"></div>
 	<div class="col-xs-9">
		<div id="menu">
		    <span id="menu-navi">
			  <button type="button" class="btn btn-default btn-sm move-2week" data-action="move-2week">현재주 ~ +2주</button>
			  <button type="button" class="btn btn-default btn-sm move-month" data-action="move-month">월단위</button>
		      <button type="button" class="btn btn-default btn-sm move-today" data-action="move-today">Today</button>
		      <button type="button" class="btn btn-default btn-sm move-day" data-action="move-prev">
		        <i class="calendar-icon ic-arrow-line-left" data-action="move-prev"></i>
		      </button>
		      <button type="button" class="btn btn-default btn-sm move-day" data-action="move-next">
		        <i class="calendar-icon ic-arrow-line-right" data-action="move-next"></i>
		      </button>
		    </span>
		    <span id="renderRange" class="render-range"></span>
		</div>
		<div id="calendar" style="height: 600px;"></div>
	</div>
</body>
</form>
<script id="template-lnb-calendars-item" type="x-tmpl-mustache">
  {{#users}}
    <div class="lnb-calendars-item list-group-item">
        <label>
            <input type="checkbox" class="tui-full-calendar-checkbox-round" value="{{ id }}" checked>
            <span style="border-color: {{ color }}; background-color: {{ color }};" data-visible="visible"></span>
            <span>{{ name }}</span>
        </label>
    </div>
    {{/users}}
</script>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://uicdn.toast.com/tui.code-snippet/latest/tui-code-snippet.js"></script>
<script src="https://uicdn.toast.com/tui.time-picker/latest/tui-time-picker.min.js"></script>
<script src="https://uicdn.toast.com/tui.date-picker/latest/tui-date-picker.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.20.1/moment.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/chance/1.0.13/chance.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/mustache.js/3.0.1/mustache.min.js"></script>
<script src =" https://uicdn.toast.com/tui.dom/v3.0.0/tui-dom.js "></script>
<script src="./resources/js/tui-calendar.js"></script> <!-- dist > tui-calendar.js 파일 연결 -->
<script src="./resources/js/Calendar.js"></script> <!-- js > Calendar.js 파일 연결  -->
</html>