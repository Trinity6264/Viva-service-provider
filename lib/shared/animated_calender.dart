import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'custom_colors.dart';


// ignore: prefer_generic_function_type_aliases
typedef OnDateSelected(date);

class AnimatedHorizontalCalendar extends StatefulWidget {
  final DateTime? initialDate;
  final ValueChanged<DateTime> onChanged;

  const AnimatedHorizontalCalendar({
    Key? key,
    this.initialDate,
    required this.onChanged,
  }) : super(key: key);

  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<AnimatedHorizontalCalendar> {
  DateTime? _startDate;
  DateTime? selectedCalenderDate;
  final ScrollController _scrollController = ScrollController();

  calenderAnimation() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: const Duration(seconds: 1),
      curve: Curves.fastOutSlowIn,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  void initState() {
    super.initState();
    selectedCalenderDate = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    DateTime findFirstDateOfTheWeek(DateTime dateTime) {
      if (dateTime.weekday == 7) {
        if (_scrollController.hasClients) {
          calenderAnimation();
        }
        return dateTime;
      } else {
        if (dateTime.weekday == 1 || dateTime.weekday == 2) {
          if (_scrollController.hasClients) {
            calenderAnimation();
          }
        }
        return dateTime.subtract(Duration(days: dateTime.weekday));
      }
    }

    _startDate = findFirstDateOfTheWeek(selectedCalenderDate!);

    return SingleChildScrollView(
      controller: _scrollController,
      scrollDirection: Axis.horizontal,
      reverse: true,
      child: SizedBox(
        child: Row(
          children: <Widget>[
            ListView.builder(
              itemCount: 10,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                DateTime? _date = _startDate?.add(Duration(days: index));
                int? diffDays = _date?.difference(selectedCalenderDate!).inDays;
                return Container(
                  width: (width - 10) * 0.13,
                  alignment: Alignment.center,
                  child: TextButton(
                    onPressed: () {
                      // widget.onDateSelected!(Utils.getDate(_date!));
                      widget.onChanged(_date!);
                      setState(() {
                        selectedCalenderDate =
                            _startDate?.add(Duration(days: index));
                        _startDate = _startDate?.add(Duration(days: index));
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          Utils.getDayOfWeek(_date!),
                          style: TextStyle(
                            color: diffDays != 0
                                ? const Color.fromARGB(255, 158, 158, 158)
                                : blackColor,
                            fontSize: 12.0,
                          ),
                        ),
                        const SizedBox(height: 2.0),
                        Text(
                          Utils.getDayOfMonth(_date),
                          style: TextStyle(
                            color: diffDays != 0
                                ? const Color.fromARGB(255, 158, 158, 158)
                                : blackColor,
                            fontSize: 20.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            const SizedBox(width: 10),
            Container(
              padding: const EdgeInsets.only(bottom: 10, top: 8),
              child: InkWell(
                onTap: () async {
                  DateTime? date = await selectDate();
                  // widget.onDateSelected!(Utils.getDate(date!));
                  widget.onChanged(date!);
                  setState(() => selectedCalenderDate = date);
                },
                child: Container(
                  height: double.infinity,
                  width: (width - 10) * 0.1428,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: const Icon(Icons.calendar_today),
                ),
              ),
            ),
            const SizedBox(width: 15)
          ],
        ),
      ),
    );
  }

  Future<DateTime?> selectDate() async {
    return await showDatePicker(
      context: context,
      initialDatePickerMode: DatePickerMode.day,
      initialDate: selectedCalenderDate!,
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 1),
    );
  }
}

class Utils {
  static String getDayOfWeek(DateTime date) => DateFormat('EEE').format(date);

  static String getDayOfMonth(DateTime date) => DateFormat('dd').format(date);

  static String getDate(DateTime date) => DateFormat('yyyy-MM-dd').format(date);
}