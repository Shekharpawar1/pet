library horizontal_week_calendar;

import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:pet/controllers/user_controller/userServicesAddAppointmentController.dart';
import 'package:pet/utils/colors.dart';

enum WeekStartFrom {
  Sunday,
  Monday,
}

class HorizontalWeekCalendar extends StatefulWidget {
  /// week start from [WeekStartFrom.Monday]
  final WeekStartFrom? weekStartFrom;

  ///get DateTime on date select
  final Function(DateTime)? onDateChange;

  ///get the list of DateTime on week change
  final Function(List<DateTime>)? onWeekChange;

  /// Active background color
  ///
  /// Default value [Theme.of(context).primaryColor]
  final Color? activeBackgroundColor;

  /// In-Active background color
  ///
  /// Default value [Theme.of(context).primaryColor.withOpacity(.2)]
  final Color? inactiveBackgroundColor;

  /// Disable background color
  ///
  /// Default value [Colors.grey]
  final Color? disabledBackgroundColor;

  /// Active text color
  ///
  /// Default value [Theme.of(context).primaryColor]
  final Color? activeTextColor;

  /// In-Active text color
  ///
  /// Default value [Theme.of(context).primaryColor.withOpacity(.2)]
  final Color? inactiveTextColor;

  /// Disable text color
  ///
  /// Default value [Colors.grey]
  final Color? disabledTextColor;

  /// Active Navigator color
  ///
  /// Default value [Theme.of(context).primaryColor]
  final Color? activeNavigatorColor;

  /// In-Active Navigator color
  ///
  /// Default value [Colors.grey]
  final Color? inactiveNavigatorColor;

  /// Month Color
  ///
  /// Default value [Theme.of(context).primaryColor.withOpacity(.2)]
  final MyColors? monthColor;

  const HorizontalWeekCalendar({
    super.key,
    this.onDateChange,
    this.onWeekChange,
    this.activeBackgroundColor,
    this.inactiveBackgroundColor,
    this.disabledBackgroundColor,
    this.activeTextColor = Colors.white,
    this.inactiveTextColor,
    this.disabledTextColor,
    this.activeNavigatorColor,
    this.inactiveNavigatorColor,
    this.monthColor,
    this.weekStartFrom = WeekStartFrom.Monday,
  });

  @override
  State<HorizontalWeekCalendar> createState() => _HorizontalWeekCalendarState();
}

class _HorizontalWeekCalendarState extends State<HorizontalWeekCalendar> {
  CarouselController carouselController = CarouselController();

  UserServicesAddAppointmentController userServicesAddAppointmentController =
      Get.put(UserServicesAddAppointmentController());
  @override
  void initState() {
    initCalender();
    // userServicesAddAppointmentController
    //     .setSelectedDate(userServicesAddAppointmentController.selectedDate);
    super.initState();
  }






  DateTime getDate(DateTime d) => DateTime(d.year, d.month, d.day);
/*  initCalender() {
    final date = DateTime.now();

    DateTime startOfCurrentWeek = widget.weekStartFrom == WeekStartFrom.Monday
        ? getDate(date.subtract(Duration(days: date.weekday - 1)))
        : getDate(date.subtract(Duration(days: date.weekday % 7)));
        userServicesAddAppointmentController.addToCurrentWeek(startOfCurrentWeek);
      //  userServicesAddAppointmentController.clearData(); // Clear any previous data
    for (int index = 0; index < 7; index++) {
      DateTime addDate = startOfCurrentWeek.add(Duration(days: index));
      userServicesAddAppointmentController.addToCurrentWeek(addDate);
    }
  }*/

  onDateSelect(DateTime date) {
    if (date.isAfter(DateTime.now())) {
      userServicesAddAppointmentController.setSelectedDate(date);
      widget.onDateChange?.call(userServicesAddAppointmentController.selectedDate);
    }
  }


  initCalender() {
    final date = DateTime.now();

    DateTime startOfCurrentWeek = widget.weekStartFrom == WeekStartFrom.Monday
        ? getDate(date.subtract(Duration(days: date.weekday - 1)))
        : getDate(date.subtract(Duration(days: date.weekday % 7)));

    // Calculate the start of the next week
    DateTime startOfNextWeek = startOfCurrentWeek.add(Duration(days: 1));

    userServicesAddAppointmentController.addToCurrentWeek(startOfCurrentWeek);

    for (int index = 1; index < 7; index++) {
      DateTime addDate = startOfCurrentWeek.add(Duration(days: index));
      userServicesAddAppointmentController.addToCurrentWeek(addDate);
    }

    userServicesAddAppointmentController.addToListOfWeek(userServicesAddAppointmentController.currentWeek);

    getMorePreviousWeeks();
  }


  /* onBackClick() {
    // Calculate the start of the previous week
    DateTime startOfPreviousWeek = userServicesAddAppointmentController
        .listOfWeeks[userServicesAddAppointmentController.currentWeekIndex][0]
        .subtract(Duration(days: 7));

    if (startOfPreviousWeek.day < 23) {
      // Ensure that the previous week starts from the 23rd day
      startOfPreviousWeek = startOfPreviousWeek.add(Duration(days: 23 - startOfPreviousWeek.day));
    }

    userServicesAddAppointmentController.addToCurrentWeek(startOfPreviousWeek);

    carouselController.previousPage();
  }*/

  /*onNextClick() {
    // Calculate the start of the next week
    DateTime startOfNextWeek = userServicesAddAppointmentController
        .listOfWeeks[userServicesAddAppointmentController.currentWeekIndex][6]
        .add(Duration(days: 1));

    userServicesAddAppointmentController.addToCurrentWeek(startOfNextWeek);
    carouselController.nextPage();
  }*/

  /*initCalender() {
    final date = DateTime.now();
    DateTime startOfCurrentWeek = widget.weekStartFrom == WeekStartFrom.Monday
        ? getDate(date.subtract(Duration(days: date.weekday - 1)))
        : getDate(date.subtract(Duration(days: date.weekday % 7)));

    // currentWeek.add(startOfCurrentWeek);
    userServicesAddAppointmentController.addToCurrentWeek(startOfCurrentWeek);
    for (int index = 0; index <7 ; index++) {
      DateTime addDate = startOfCurrentWeek.add(Duration(days: index));
      userServicesAddAppointmentController.addToCurrentWeek(addDate);
     // DateTime addDate = startOfCurrentWeek.add(Duration(days: (index + 1)));
      // currentWeek.add(addDate);
      //userServicesAddAppointmentController.addToCurrentWeek(addDate);
    }

    // listOfWeeks.add(currentWeek);
    userServicesAddAppointmentController
        .addToListOfWeek(userServicesAddAppointmentController.currentWeek);

    getMorePreviousWeeks();
    
  
  }*/
/*  getMorePreviousWeeks() {
    List<DateTime> previousWeek = [];
    DateTime currentDate = userServicesAddAppointmentController.listOfWeeks.isEmpty
        ? DateTime.now()
        : userServicesAddAppointmentController
        .listOfWeeks[userServicesAddAppointmentController.currentWeekIndex]
        .isEmpty
        ? DateTime.now()
        : userServicesAddAppointmentController.listOfWeeks[
    userServicesAddAppointmentController.currentWeekIndex][0];

    // Calculate the start of the previous week
    DateTime startOfPreviousWeek = currentDate.subtract(Duration(days: currentDate.day - 23));

    for (int index = 0; index < 7; index++) {
      DateTime previousDate = startOfPreviousWeek.add(Duration(days: index));
      previousWeek.add(previousDate);
    }

    userServicesAddAppointmentController.addToListOfWeek(previousWeek);
  }*/
  getMorePreviousWeeks() {
    List<DateTime> nextWeek = [];
    DateTime currentDate = userServicesAddAppointmentController.listOfWeeks.isEmpty
        ? DateTime.now()
        : userServicesAddAppointmentController
        .listOfWeeks[userServicesAddAppointmentController.currentWeekIndex]
        .isEmpty
        ? DateTime.now()
        : userServicesAddAppointmentController.listOfWeeks[
    userServicesAddAppointmentController.currentWeekIndex][6];

    // Calculate the start of the next week
    DateTime startOfNextWeek = currentDate.add(Duration(days: 1));

    for (int index = 0; index < 7; index++) {
      DateTime nextDate = startOfNextWeek.add(Duration(days: index));
      nextWeek.add(nextDate);
    }

    userServicesAddAppointmentController.addToListOfWeek(nextWeek);
  }

/*  getMorePreviousWeeks() {
    List<DateTime> minus7Days = [];
    DateTime startFrom =
        userServicesAddAppointmentController.listOfWeeks.isEmpty
            ? DateTime.now()
            : userServicesAddAppointmentController
                    .listOfWeeks[
                        userServicesAddAppointmentController.currentWeekIndex]
                    .isEmpty
                ? DateTime.now()
                : userServicesAddAppointmentController.listOfWeeks[
                    userServicesAddAppointmentController.currentWeekIndex][0];

    for (int index = 0; index < 7; index++) {
      DateTime minusDate = startFrom.add(Duration(days: -(index + 1)));
      minus7Days.add(minusDate);
    }
    // listOfWeeks.add(minus7Days.reversed.toList());
    userServicesAddAppointmentController
        .addToListOfWeek(minus7Days.reversed.toList());
    // setState(() {});
  }*/


  
 /* onDateSelect(DateTime date) {

    userServicesAddAppointmentController.setSelectedDate(date);
    // print(
    //     "Selected Date: ${userServicesAddAppointmentController.selectedDate}");
    widget.onDateChange
        ?.call(userServicesAddAppointmentController.selectedDate);
  }*/

 onBackClick() {
   carouselController.previousPage();
  }

 onNextClick() {
   carouselController.nextPage();
   // carouselController.previousPage();
  }

  onWeekChange(index) {
    // currentWeekIndex = index;
    userServicesAddAppointmentController.setCurrentWeekIndex(index);
    // currentWeek = userServicesAddAppointmentController
    //     .listOfWeeks[userServicesAddAppointmentController.currentWeekIndex];
    userServicesAddAppointmentController.changeCurrentWeek(
        userServicesAddAppointmentController.listOfWeeks[
            userServicesAddAppointmentController.currentWeekIndex]);

    if (userServicesAddAppointmentController.currentWeekIndex + 1 ==
        userServicesAddAppointmentController.listOfWeeks.length) {
      getMorePreviousWeeks();
    }


    if (userServicesAddAppointmentController.currentWeekIndex + 1 ==
      userServicesAddAppointmentController.listOfWeeks.length) {
    getMoreFutureWeeks(userServicesAddAppointmentController.currentWeek);
  }

    widget.onWeekChange?.call(userServicesAddAppointmentController.currentWeek);
    setState(() {});
  }

// Function to get more future weeks
getMoreFutureWeeks( currentWeek) {
  List<DateTime> future7Days = [];

  // Calculate the start date for the next week
  DateTime startFrom = currentWeek.add(Duration(days: 1));

  for (int index = 0; index < 7; index++) {
    DateTime futureDate = startFrom.add(Duration(days: index));
    future7Days.add(futureDate);
  }

  // Add the list of future dates to your list of weeks
  userServicesAddAppointmentController.addToListOfWeek(future7Days);

  // Update the UI
  setState(() {});
}
  // =================

  isNextDisabled() {
    return userServicesAddAppointmentController
        .listOfWeeks[userServicesAddAppointmentController.currentWeekIndex].last
        .isBefore(DateTime.now());
  }

  isCurrentYear() {
    return DateFormat('yyyy')
            .format(userServicesAddAppointmentController.currentWeek[0]) ==
        DateFormat('yyyy').format(userServicesAddAppointmentController.today);
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var withOfScreen = MediaQuery.of(context).size.width;

    double boxHeight = withOfScreen / 7;

    return userServicesAddAppointmentController.currentWeek.isEmpty
        ? const SizedBox()
        : GetBuilder<UserServicesAddAppointmentController>(
            init: userServicesAddAppointmentController,
            builder: (_) {
              return Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          print("backk ======");
                          onBackClick();
                        },
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.arrow_back_ios_new,
                              size: 15,
                              color:
                              widget.activeNavigatorColor ??
                                  theme.primaryColor,
                            ),
                            const SizedBox(
                              width: 4,
                            ),

                          ],
                        ),
                      ),
                      Text(
                        isCurrentYear()
                            ? DateFormat('MMMM').format(
                                userServicesAddAppointmentController
                                    .currentWeek[0],
                              )
                            : DateFormat('MMMM yyyy').format(
                                userServicesAddAppointmentController
                                    .currentWeek[0],
                              ),
                        style: theme.textTheme.titleMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: MyColors.black ?? theme.primaryColor,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          print("ffffff ======");
                          onNextClick();
                        },
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [

                            const SizedBox(
                              width: 4,
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 15,
                              color: isNextDisabled()
                                  ?   Colors.grey

                                  : widget.inactiveNavigatorColor ??
                                  theme.primaryColor,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),

                  CarouselSlider(
                    carouselController: carouselController,
                    items: [
                      if (userServicesAddAppointmentController
                          .listOfWeeks.isNotEmpty)
                        for (int ind = 0;
                            ind <
                                userServicesAddAppointmentController
                                    .listOfWeeks.length;
                            ind++)
                          Container(
                            height: boxHeight,
                            width: withOfScreen,
                            color: Colors.transparent,
                            child: Row(
                              children: [
                                for (int weekIndex = 0;
                                    weekIndex <
                                        userServicesAddAppointmentController
                                            .listOfWeeks[ind].length;
                                    weekIndex++)
                                  Expanded(
                                    child: GestureDetector(
                                      onTap:
                                          userServicesAddAppointmentController
                                                  .listOfWeeks[ind][weekIndex]
                                                  .isAfter(DateTime.now())
                                              ? () {
                                                  onDateSelect(
                                                    userServicesAddAppointmentController
                                                            .listOfWeeks[ind]
                                                        [weekIndex],
                                                  );
print("Dates");
                                                    print( userServicesAddAppointmentController
                                                            .listOfWeeks[ind]
                                                        [weekIndex],);
                                                }
                                              : null,

                                            
                                      child: Container(
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(25),
                                          color: DateFormat('dd-MM-yyyy').format(
                                                      userServicesAddAppointmentController
                                                              .listOfWeeks[ind]
                                                          [weekIndex]) ==
                                                  DateFormat('dd-MM-yyyy').format(
                                                      userServicesAddAppointmentController
                                                          .selectedDate)
                                              ? MyColors.yellow ??
                                                  theme.primaryColor
                                              : userServicesAddAppointmentController
                                                      .listOfWeeks[ind]
                                                          [weekIndex]
                                                      .isBefore(DateTime.now())
                                                  ? MyColors.white ??
                                                      theme.primaryColor
                                                  : MyColors.red1 ??
                                                      Colors.grey,
                                          border: Border.all(
                                            color:
                                                theme.scaffoldBackgroundColor,
                                          ),
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              DateFormat(
                                                'EEE',
                                              ).format(
                                                userServicesAddAppointmentController
                                                        .listOfWeeks[ind]
                                                    [weekIndex],
                                              ),
                                              textAlign: TextAlign.center,
                                              style: theme.textTheme.bodyLarge!
                                                  .copyWith(
                                                color: DateFormat('dd-MM-yyyy').format(
                                                            userServicesAddAppointmentController
                                                                    .listOfWeeks[ind]
                                                                [weekIndex]) ==
                                                        DateFormat('dd-MM-yyyy')
                                                            .format(
                                                                userServicesAddAppointmentController
                                                                    .selectedDate)
                                                    ? widget.activeTextColor ??
                                                        MyColors.black
                                                    : userServicesAddAppointmentController
                                                            .listOfWeeks[ind]
                                                                [weekIndex]
                                                            .isBefore(
                                                                DateTime.now())
                                                        ? widget.inactiveTextColor ??
                                                            MyColors.black
                                                        // .withOpacity(.2)
                                                        : widget.disabledTextColor ??
                                                            Colors.white,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 4,
                                            ),
                                            FittedBox(
                                              child: Text(
                                                // "$weekIndex: ${listOfWeeks[ind][weekIndex] == DateTime.now()}",
                                                "${userServicesAddAppointmentController.listOfWeeks[ind][weekIndex].day}",
                                                textAlign: TextAlign.center,
                                                style: theme
                                                    .textTheme.titleLarge!
                                                    .copyWith(
                                                  color: DateFormat('dd-MM-yyyy').format(userServicesAddAppointmentController.listOfWeeks[ind]
                                                              [weekIndex]) ==
                                                          DateFormat('dd-MM-yyyy').format(
                                                              userServicesAddAppointmentController
                                                                  .selectedDate)
                                                      ? widget.activeTextColor ??
                                                          Colors.white
                                                      : userServicesAddAppointmentController
                                                              .listOfWeeks[ind]
                                                                  [weekIndex]
                                                              .isBefore(DateTime
                                                                  .now())
                                                          ? widget.inactiveTextColor ??
                                                              MyColors.black
                                                          // .withOpacity(.2)
                                                          : widget.disabledTextColor ??
                                                              Colors.white,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                    ],
                    options: CarouselOptions(
                      scrollPhysics: const ClampingScrollPhysics(),
                      height: boxHeight,
                      viewportFraction: 1,
                      enableInfiniteScroll: false,
                      reverse: false,
                      onPageChanged: (index, reason) {
                        onWeekChange(index);
                      },
                    ),
                  ),
                
                ],
              );
            });
  }
}

