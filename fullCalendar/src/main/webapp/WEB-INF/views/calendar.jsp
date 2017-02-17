<!--/*
*개발자(developer): 배 근 후 Bae Keunhu
*날짜(date): 2017.02.05
*프로그램명(Program): NS Intranet ver1.0 / part : Calendar
* -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
 <title>NS's Scheduler</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<!-- Bootstrap 3.3.6 -->
<link rel="stylesheet" href="../resources/calendar/bootstrap/css/bootstrap.min.css">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
<!-- Ionicons -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
    <link rel="stylesheet" href="../resources/calendar/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
    <!--일정 css  -->
    <link rel="stylesheet" href="../resources/calendar/fullcalendar/fullcalendar.min.css">
    <link rel="stylesheet" href="../resources/calendar/fullcalendar/fullcalendar.print.css" media="print">
    <!--일정 Theme style -->
    <link rel="stylesheet" href="../resources/calendar/dist/css/AdminLTE.min.css">
    <link rel="stylesheet" href="../resources/calendar/dist/css/skins/_all-skins.min.css">
</head>
<body>

<div>
   <div id="page-wrapper">
                <!--BEGIN TITLE & BREADCRUMB PAGE-->
                <!-- 상단 제목부분 -->
                <div id="title-breadcrumb-option-demo" class="page-title-breadcrumb">
                    <div class="page-header pull-left">
                        <div class="page-title">
                            일정관리</div>
                    </div>
                    <ol class="breadcrumb page-breadcrumb pull-right">
                        <li><i class="fa fa-home"></i>&nbsp;<a href="/user/index/">홈으로</a>&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
                        <li class="active"><a href="#">일정관리</a></li>
                    </ol>
                    <div class="clearfix">
                    </div>
                </div>
                <!--END TITLE & BREADCRUMB PAGE-->
                <!--  상단 제목부분 끝-->
                <!--BEGIN CONTENT-->
                <div class="page-content">
                       <section class="content">
				<div class="row">
					<div class="col-md-3">
						<!--###########기본설정부분###########  -->
						<div class="box box-solid">
							<div class="box-header with-border">
								<h4 class="box-title">드래그앤드롭</h4>
						</div>
							<div class="box-body">
								<!-- the events -->
								<div id="external-events">
							</div>
						</div> <!-- /.box-body -->
					</div> <!-- /. box -->
						<div class="box box-solid">
							<div class="box-header with-border">
								<h3 class="box-title">커스텀 일정&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							</h3><p/>
								
						</div> <!--###########색깔선택부분###########  -->
							<div class="box-body">
								<div class="btn-group" style="width: 100%; margin-bottom: 10px;">
									<!-- <button type="button" id="color-chooser-btn" class="btn btn-info btn-block dropdown-toggle" data-toggle="dropdown">Color <span class="caret"></span></button>-->
									<ul class="fc-color-picker" id="color-chooser">
										<li><a class="text-red" href="#"><i
												class="fa fa-square"></i></a></li>
										<li><a class="text-fuchsia" href="#"><i
												class="fa fa-square"></i></a></li>
										<li><a class="text-orange" href="#" id="orange"><i
												class="fa fa-square"></i></a></li>
										<li><a class="text-green" href="#"><i
												class="fa fa-square"></i></a></li>
										<li><a class="text-blue" href="#">
										<i class="fa fa-square"></i></a></li>
										<li><a class="text-purple" href="#"><i
												class="fa fa-square"></i></a></li>
								</ul>
							</div>&nbsp;
							<!-- /btn-group -->
								<div class="input-group"><input id="new-event" name="title"
									type="text" class="form-control" placeholder="일정을 입력하세요!">
									<div class="input-group-btn">
										<button id="add-new-event" type="button"
										class="btn btn-primary btn-flat">추가</button>
								</div> <!-- /btn-group --></div>
								<!-- /input-group -->
						</div>
					</div>
					<c:if test="${sessionScope.login.grade>=3 }">
					<form action="/user/calendar/calendarDeptRegist" method="post">
					<div class="box box-solid">
							<div class="box-header with-border">
								<h3 class="box-title">부서 일정 등록&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							</h3><p/>
								
						</div> 
							<div class="box-body">
								<div class="btn-group" style="width: 100%; margin-bottom: 10px;">
									<!-- <button type="button" id="color-chooser-btn" class="btn btn-info btn-block dropdown-toggle" data-toggle="dropdown">Color <span class="caret"></span></button>-->
									  <div class="row">

									<div class='col-md-6'>
										<div class="form-group">
											<span>시작 날짜</span>
											<div class='input-group'>
											<input type="hidden" name="emp_id" value="${sessionScope.login.emp_id }"/>
											<input type="hidden" name="color" value="rgb(0, 31, 63)">
												<input type="date" class="form-control" id="start_day" name="start_day" style="width: 90%"/>
											</div>
										</div>
									</div>
									<div class='col-md-6'>
										<div class="form-group">
											<span>종료 날짜</span>
											<div class='input-group'>
												<input type='date' class="form-control" id="end_day" name="end_day" style="width: 90%"/> 
											</div>
										</div>
									</div>
								</div>
								<div class="input-group"><input id="title" name="title"
									type="text" class="form-control" placeholder="일정을 입력하세요!"/>
									<div class="input-group-btn">
										<button id="submit" type="submit"
										class="btn btn-primary btn-flat">일정등록</button>
								</div> <!-- /btn-group --></div>
							</div>&nbsp;
							<!-- /btn-group -->
								<!-- /input-group -->
						</div>
					</div>
					</form>
					</c:if>
					 <!--  박스엔드-->
				</div> <!-- /.col --> <!--###########달력 출력부분###########  -->
					<div class="col-md-9">
						<div class="box box-primary" id="box">
							<div class="box-body no-padding">
								<!-- THE CALENDAR -->
								<div id="calendar">
								
								</div>
						</div> <!-- /.box-body -->
					</div> <!-- /. box -->
				</div> <!-- /.col -->
			</div> <!-- /.row -->
		</section> <!-- /.content -->          
                                </div>
                            </div>
                        </div>

                <!--END CONTENT-->
             	<script src="../resources/calendar/jQuery/jquery-2.2.3.min.js"></script>
	<!-- Bootstrap 3.3.6 -->
	<script src="../resources/calendar/bootstrap/js/bootstrap.min.js"></script>
	<!-- jQuery UI 1.11.4 -->
	<script src="https://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
	
	<!-- AdminLTE App -->
	<script src="../resources/calendar/dist/js/app.min.js"></script>
	<!-- AdminLTE for demo purposes -->
	<script src="../resources/calendar/dist/js/demo.js"></script>
	<!-- fullCalendar 2.2.5 -->
		<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.11.2/moment.min.js"></script>
	<script src="../resources/calendar/fullcalendar/fullcalendar.min.js"></script>
	
	
	<script type="text/javascript">
	/* $('#calendar').fullcalendar('getView'); */


	  $(document).ready(function () {
		  

	    /* initialize the external events
	     -----------------------------------------------------------------*/
	    function ini_events(ele) {    	
	      ele.each(function () {
	//일정추가 쿼리
	        // create an Event Object (http://arshaw.com/fullcalendar/docs/event_data/Event_Object/)
	        // it doesn't need to have a start or end
	        //var chk = $("#chk_allday:checked").val();
	        var calendar_no;
	        var emp_id = "abc";
	        // 로그인 기능이 있다면 해당 세션아이디값으로 대체
	        // If you has any LOGIN process, you must be get "sessionScope.id"
	        var title = $.trim($(this).text());
	        var color = $(this).css("background-color");
	        var sendData = {"emp_id":emp_id, "title": title, "color":color};
	        var eventObject = {
	          title : $.trim($(this).text()), // use the element's text as the event title
	          calendar_no : $.ajax({
	        	url : "/user/calendar/calendarInsert",
	        	type : "post",
	        	data : sendData,
	        	success : function(data) {
					
						calendar_no = data.calendar_no;// Numbering here(It calls keyvalue: do something like delete, update----)
					//이벤트 바 생성시 키값 부여
				}
	          })
	        };
	      
	        // store the Event Object in the DOM element so we can get to it later
	        $(this).data('eventObject', eventObject);

	        // make the event draggable using jQuery UI
	        $(this).draggable({
	          zIndex: 1070,
	          revert: true, // will cause the event to go back to its
	          revertDuration: 0  //  original position after the drag
	        });
	        

	      });

	    }

	    ini_events($('#external-events div.external-event'));

	    /* initialize the calendar
	     -----------------------------------------------------------------*/
	    //Date for the calendar events (dummy data)
	    var date = new Date();
	    var d = date.getDate(),
	        m = date.getMonth(),
	        y = date.getFullYear();
	     
	    $('#calendar').fullCalendar({//fullcalendar.css + jquey.js + moment.j
	      header: {//상단 화살표
	        left: 'prev,next today',
	        center: 'title',
	        right: 'month,agendaWeek,agendaDay'
	      },
	      buttonText: {//상단 버튼 메뉴
	        today: 'today',
	        month: 'month',
	        week: 'week',
	        day: 'day'
	      },
	      //Random default events
	     editable: true,
	     events: [//using C tag lib for LIST
	              
	    	 <c:forEach items="${list}" var="list">
	       {
	    	 title: '${list.title}',
	    	 start: new Date('${list.start_date.year}','${list.start_date.month}','${list.start_date.day}','${list.start_date.hour}','${list.start_date.min}'),
	    	 end: new Date('${list.end_date.year}','${list.end_date.month}','${list.end_date.day}','${list.end_date.hour}','${list.end_date.min}'),
	    	 backgroundColor: '${list.color}', //red
	         borderColor: '${list.color}', //red
	         calendar_no : '${list.calendar_no}',
	         allDay : true
	       },
	    	 </c:forEach>
	      ], 
	      eventClick: function(event) {
	    	  var del =event.calendar_no;
	    	  var emp_id = "abc";
	    	  if (!confirm("삭제하시겠습니까?")) {
	              return false;
	          }else{
	        	  var sendData = {"emp_id" : emp_id, "calendar_no" : del};
	        	  $.ajax({
	        		  url : "/user/calendar/calendarDelete",
	        		  type : "post",
	        		  data : sendData,
	        		  success : function(data) {
						alert("삭제되었습니다.");
						
					}
	        	  });
						$(this).remove();
						
	        	  
	          }
	      },
	      droppable: true, // this allows things to be dropped onto the calendar !!!
	     
	      eventDrop: function(event, delta, revertFunc) {//event-bar drag and drop (changing location) 렌더링 된 이벤트 바 드래그앤 드롭

	    	  var title = event.title;
	    	  var start_day = event.start.format();
	    	  var end_day= event.end.format();
	    	  var calendar_no = event.calendar_no;
	    	  console.log(calendar_no);
	    	  console.log(start_day);
	    	  console.log(end_day);
	          var sendData = {"end_day" : end_day, "start_day" : start_day, "calendar_no" : calendar_no}; 

	          if (!confirm("Are you sure about this change?")) {
	              revertFunc();
	          }

	          $.ajax({
	       		url : "/user/calendar/calendarUpdateMove",
	       		type : "post",
	       		data : sendData,
	       		success : function(data) {
					alert("일정이 수정되었습니다.");
				},
				error: function(request,status,error){
	        	       
	  	    		alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	  	    		
	        	 }
	       	  });
	      },
	     
	      drop: function (date) { // this function is called when something is dropped

	        // retrieve the dropped element's stored Event Object
	        var originalEventObject = $(this).data('eventObject');
	        
	        var copiedEventObject = $.extend({}, originalEventObject);
	        var calendar_no = copiedEventObject.calendar_no.responseJSON;
	  	    var start_day = date.format("YYYY/MM/DD hh:mm");
	  	    var sendData = {"calendar_no": calendar_no, "start_day" : start_day};
	  	    $.ajax({
	  	    	url : "/user/calendar/calendarDropUpdate",
	  	    	type : "post",
	  	    	data : sendData,
	  	    	dataType:"Json"
	  	    	
	  	    });
				 	copiedEventObject.calendar_no = calendar_no; 
					copiedEventObject.start = date;
					
			        copiedEventObject.backgroundColor = $(this).css("background-color");
			        copiedEventObject.borderColor = $(this).css("border-color");
			        $('#calendar').fullCalendar('renderEvent', copiedEventObject, true);
	  	 
	  
	       
	  	 
	        // we need to copy it, so that multiple events don't have a reference to the same object

	        // render the event on the calendar
	        // the last `true` argument determines if the event "sticks" (http://arshaw.com/fullcalendar/docs/event_rendering/renderEvent/)
	        $(this).remove();

	        // is the "remove after drop" checkbox checked?
	       /*  if ($('#drop-remove').is(':checked')) {
	          // if so, remove the element from the "Draggable Events" list
	          $(this).remove();
	        } */

	      },
         eventResize: function (event, delta) {//크기조절부분 after drop resizing event-bar
	    	  
	    	  var calendar_no = event.calendar_no;
	          console.log(calendar_no);
	    	  var end_day= event.end.format();
	    	  
	          var sendData = {"calendar_no" : calendar_no, "end_day" : end_day};
	          $.ajax({
	     		url : "/user/calendar/calendarUpdate",
	     		type : "post",
	     		data : sendData
	     		
	     	  });
	     	 

	      },
	      
	    });//상단 기본 일정값 스크립트

	    /* ADDING EVENTS */
	    var currColor = "#3c8dbc"; //Red by default
	    //Color chooser button
	    var colorChooser = $("#color-chooser-btn");
	    $("#color-chooser > li > a").click(function (e) {
	      e.preventDefault();
	      //Save color
	      currColor = $(this).css("color");
	      //Add color effect to button
	      $('#add-new-event').css({"background-color": currColor, "border-color": currColor});
	    });
	    $("#add-new-event").click(function (e) {
	      e.preventDefault();
	      //Get value and make sure it is not null
	      var val = $("#new-event").val();
	      console.log(val);
	      if (val.length == 0) {
	        return;
	      }
	    
	    var event = $("<div />");
	      event.css({"background-color": currColor, "border-color": currColor, "color": "#fff"}).addClass("external-event");
	      event.html(val);
	      
	      $('#external-events').prepend(event);

	      //Add draggable funtionality
	      ini_events(event);
	      //Remove event from text input
	      $("#new-event").val("");
	    });
	  });
	</script>
	
</html>