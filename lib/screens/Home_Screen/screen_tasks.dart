import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:calendar_timeline/calendar_timeline.dart';
import 'drawer.dart';

class ScreenTask extends StatefulWidget {
  const ScreenTask({Key? key}) : super(key: key);

  @override
  State<ScreenTask> createState() => _HomePageState();
}

class _HomePageState extends State<ScreenTask> {
  late DateTime _selectedDate;

  @override
  void initState() {
    super.initState();
    _resetSelectedDate();
  }

  void _resetSelectedDate() {
    _selectedDate = DateTime.now().add(const Duration(days: 2));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(userName: '',),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.0),
        child: AppBar(
          leading: Builder(
            builder: (context) {
              return IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              );
            },
          ),
          title: Column(
            children: [
              Text(
                'Today',
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 2.0),
              Text(
                '11/9/2023',
                style: TextStyle(fontSize: 12.0, color: Colors.grey),
              ),
            ],
          ),
          actions: [
            CircularPercentIndicator(
              radius: 20.0,
              lineWidth: 4.0,
              percent: 0.7,
              center: Text('70%'),
              progressColor: Colors.green,
            ),
            SizedBox(width: 16.0),
            CircularPercentIndicator(
              radius: 20.0,
              lineWidth: 4.0,
              percent: 0.5,
              center: Text('50%'),
              progressColor: Colors.blue,
            ),
            SizedBox(width: 16.0),
            CircularPercentIndicator(
              radius: 20.0,
              lineWidth: 4.0,
              percent: 0.3,
              center: Text('30%'),
              progressColor: Colors.orange,
            ),
            SizedBox(width: 16.0),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CalendarTimeline(
              showYears: true,
              initialDate: _selectedDate,
              firstDate: DateTime.now(),
              lastDate: DateTime.now().add(const Duration(days: 365 * 4)),
              onDateSelected: (date) => setState(() => _selectedDate = date),
              leftMargin: 20,
              monthColor: Colors.black,
              dayColor: Colors.purple,
              dayNameColor:  Colors.black,
              activeDayColor: Colors.black,
              activeBackgroundDayColor: Colors.purple,
              dotsColor: Colors.purple,
              selectableDayPredicate: (date) => date.day != 23,
              locale: 'en',
            ),
            const SizedBox(height: 20),
           Expanded(
             child: ListView.separated(
                 itemBuilder: (context,index){
                   return Card(
                     child: Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start, // Align text to the start line
                         children: [
                           Text(
                             'New',
                             style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
                           ),
                           Divider(),
                           Row(
                             children: [
                               Text(
                                 'Create a high ....',
                                 style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
                               ),
                               Icon(Icons.list)
                             ],
                           ),
                           SizedBox(height: 13,),
                           Text(
                             'Create a high ....',
                             style: TextStyle(fontSize: 12.sp, color: Colors.grey),
                           ),
                           SizedBox(height: 13,),
                           Row(
                             children: [
                               Icon(Icons.update),
                               SizedBox(width: 5,),
                               Text(
                                 'Create a high ....',
                                 style: TextStyle(fontSize: 12.sp,),
                               ),
                             ],
                           )
                         ],
                       ),
                     ),
                   );
                 },
                 separatorBuilder: (context,index){
                   return SizedBox(height: 10,);
                 },
                 itemCount: 13,
             ),
           ),
          ],
        ),
      ),
    );
  }
}
