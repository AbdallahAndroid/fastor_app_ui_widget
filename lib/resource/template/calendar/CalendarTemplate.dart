import 'package:fastor_app_ui_widget/fastor_app_ui_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_calendar/flutter_clean_calendar.dart';

class CalendarTemplate extends StatefulWidget {

  ValueChanged<DateTime> selectDate;
  ValueChanged<CalendarState> getCalenderInstance;

  CalendarTemplate( {
    required this.selectDate ,
    required this.getCalenderInstance ,
  });

  @override
  CalendarState createState() {
    var state =  CalendarState();
    getCalenderInstance(state);
    return state;
  }

}

class CalendarState extends State<CalendarTemplate> {

  DateTime? selectedDay;
  List <CleanCalendarEvent>? selectedEvent;


  @override
  Widget build(BuildContext context) {
    return _cleanCalenderView();
  }



  Widget _cleanCalenderView(){

    var cal = _getCalenderClean();


    //space + decoration
    var cont =  Container( child:  cal ,

      color: DSColor.calendar_card_background,          //background color

    );

    var mat =  Material( child:  cont,);

    return mat;
    // var box = SizedBox( child:  mat , height: 300 ,);
    // return box;
  }


  Widget _getCalenderClean() {
    return Calendar(
      //start week
      startOnMonday: true,
      weekDays: ['Mon','Tue','Wed','Thu','Fri','Sat','Sun'],

      //selected
      selectedColor: DSColor.calendar_selected_background, //selected day background circle color

      //today
      todayColor: DSColor.calendar_selected_background,     //today background selected circle color
      hideTodayIcon : true,
      bottomBarColor: DSColor.calendar_selected_background, //??

      //event
      eventColor: DSColor.calendar_card_event_color,    //event : not used event
      eventDoneColor: DSColor.calendar_card_event_color, //event : not used event

      onRangeSelected: (range) {     //
        //Log.i('_cleanCalenderView() - selected range - ${range.from}, ${range.to}');
      },
      onDateSelected: (date){
        // Log.i('_cleanCalenderView() - onDateSelected - ${date} ');
        return _handleData(date);
      },

      //hide event view
      eventListBuilder: (BuildContext context, List<CleanCalendarEvent> events){
        // return Text( "event view " + events.length.toString() );
        return EmptyView.zero();
      },

      events: events,
      isExpanded: true,
      dayOfWeekStyle: TextStyle(
        fontSize: 15,
        // fontFamily: FontProject.beach,
        color: Colors.black,                //week color
        fontWeight: FontWeight.w500,       //fond used
      ),
      bottomBarTextStyle: TextStyle(
        color: Colors.white,
      ),
      hideBottomBar: false,
      hideArrows: false,

    );

  }

  void _handleData(date){
    setState(() {
      selectedDay = date;
      selectedEvent = events[selectedDay] ?? [];
    });

    //callbacl
    widget.selectDate( date);
  }

  //-------------------------------------------------------------------------- public event controller


  void event_dateUpdate(DateTime timeUpdate, String yourDatabaseId ) {
    bool isContain = events.containsKey( timeUpdate );

    //case first time
    if( isContain == false ) {
      _eventAction_craeteNewDate(timeUpdate, yourDatabaseId );
      return;
    }

    //case replace old event id
    bool isEventFound = isEventIdAddedBefore( timeUpdate, yourDatabaseId);
    if( isEventFound ) {
      _eventAction_replace_eventId(timeUpdate, yourDatabaseId );
      return;
    }

    //case add new eventId with date already carry other events
    _eventAction_craeteNewEventId(timeUpdate, yourDatabaseId );
  }


  bool  isEventIdAddedBefore(DateTime timeUpdate, String yourDatabaseId ){

    Map<String, String> mapKey =  Map();

    var s = mapKey["s"] ;

    //get list event same date
    List<CleanCalendarEvent>? listEventSameDate = events[ timeUpdate];

    if( listEventSameDate == null ) return false;

    //case new event added to date have event
    bool isFound = false;
    listEventSameDate.forEach((elementEvent) {

      //check found
      if( elementEvent.summary == yourDatabaseId ) {
        isFound = true;
      }
    });

    return isFound;
  }


  CleanCalendarEvent generateNewEvent (DateTime dateTime, String yourDatabaseId ) {
    return  CleanCalendarEvent( yourDatabaseId ,
        startTime: dateTime,
        endTime:  dateTime,
        description: yourDatabaseId,
        color: Colors.blue       //Colors.blue[700]
    );
  }

  //---------------------------------------------------------------------- action event

  _eventAction_craeteNewDate(DateTime timeUpdate, String yourDatabaseId ) {
    List<CleanCalendarEvent> listEvent = [];
    var newObj = generateNewEvent( timeUpdate, yourDatabaseId );
    listEvent.add( newObj );

    events[timeUpdate] = listEvent;

    if( mounted == false )return;
    setState( (){

    });
  }


  _eventAction_replace_eventId(DateTime timeUpdate, String yourDatabaseId ) {
    //get list event same date
    List<CleanCalendarEvent>? listEventSameDate = events[timeUpdate];

    if( listEventSameDate == null ) {
      _eventAction_craeteNewDate(timeUpdate, yourDatabaseId);
      return ;
    }
    //remove
    List<CleanCalendarEvent> listEventAfterRemoveOldEvent = [];

    listEventSameDate.forEach((elementEvent) {

      //check found
      if( elementEvent.summary != yourDatabaseId ) {
        listEventAfterRemoveOldEvent.add( elementEvent );
      }
    });

    //add new
    var newObj = generateNewEvent( timeUpdate, yourDatabaseId );
    listEventAfterRemoveOldEvent.add( newObj );


    events[timeUpdate] = listEventAfterRemoveOldEvent;
    if( mounted == false )return;
    setState( (){

    });

  }


  _eventAction_craeteNewEventId(DateTime timeUpdate, String yourDatabaseId ) {
    //get list event same date
    List<CleanCalendarEvent>? listEventSameDate = events[timeUpdate];

    if( listEventSameDate == null ) {
      _eventAction_craeteNewDate(timeUpdate, yourDatabaseId);
      return ;
    }

    //add new
    var newObj = generateNewEvent( timeUpdate, yourDatabaseId );
    listEventSameDate.add( newObj );


    events[timeUpdate] = listEventSameDate;

    if( mounted == false )return;
    setState( (){

    });
  }


  //-------------------------------------------------------------------------- tools



  Map<DateTime,List<CleanCalendarEvent>> events =  {};


// DateTime (DateTime.now().year,DateTime.now().month,DateTime.now().day):
// [
//   CleanCalendarEvent('Event A',
//       startTime: DateTime(
//           DateTime.now().year,DateTime.now().month,DateTime.now().day,10,0),
//       endTime:  DateTime(
//           DateTime.now().year,DateTime.now().month,DateTime.now().day,12,0),
//       description: 'A special event',
//       color: Colors.blue //Colors.blue[700]
//   ),
// ],




}