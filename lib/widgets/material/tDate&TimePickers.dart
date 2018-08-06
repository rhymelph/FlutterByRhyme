import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';

class DateTimePickersDemo extends StatefulWidget {
  static const String routeName = 'widgets/material/DateTimePickers';
  final String detail = '';

  @override
  _DateTimePickersDemoState createState() => _DateTimePickersDemoState();
}

class _DateTimePickersDemoState extends ExampleState<DateTimePickersDemo> {
  DateTimePickersSetting setting;
  Value<bool> isTime = boolValues[0];

  @override
  void initState() {
    setting = DateTimePickersSetting(
      initialDate: dateTimeValues[0],
      firstDate: dateTimeValues[1],
      lastDate: dateTimeValues[2],
      textDirection: textDirectionValues[0],
      initialDatePickerMode: datePickerModeValues[0],
      initialTime: timeOfDayValues[0],
    );
    super.initState();
  }

  @override
  String getDetail() {
    return widget.detail;
  }

  @override
  String getExampleCode() {
    // TODO: implement getExampleCode
    return isTime.value
        ? '''FlatButton(
       onPressed: () async{
       TimeOfDay tod = await showTimePicker(
            context: context,
            initialTime: ${setting.initialTime?.label??''},
          );
       showToast(tod.toString());
      },
      child: Text('Show TimePicker'),
    )'''
        : '''FlatButton(
       onPressed: () async{
       DateTime time=await showDatePicker(
                    context: context,
                    initialDate: ${setting.initialDate?.label ?? ''},
                    firstDate: ${setting.firstDate?.label ?? ''},
                    lastDate: ${setting.lastDate?.label ?? ''},
                    selectableDayPredicate: ${setting.selectableDayPredicate
        ?.label ??
        ''},
                    initialDatePickerMode: ${setting.initialDatePickerMode
        ?.label ?? ''},
                    locale: ${setting.locale?.label ?? ''},);
       showToast(time.toString());
      },
      child: Text('Show DateTimePicker'),
    )''';
  }

  @override
  List<Widget> getSetting() {
    // TODO: implement getSetting
    List<Widget> _widgetSetting = [
      SwitchValueTitleWidget(
        title: StringParams.kChangeToTimePickers,
        value: isTime,
        onChanged: (value) {
          setState(() {
            isTime = value;
          });
        },
      ),
    ];
    if (isTime.value) {
      _widgetSetting.addAll([
        ValueTitleWidget(StringParams.kInitialTime),
        RadioGroupWidget(setting.initialTime, timeOfDayValues, (value) {
          setState(() {
            setting = setting.copyWith(initialTime: value);
          });
        }),
      ]);
    } else {
      _widgetSetting.addAll([
        ValueTitleWidget(StringParams.kInitialDate),
        RadioGroupWidget(setting.initialDate, dateTimeValues, (value) {
          setState(() {
            if (value.value.isBefore(setting.firstDate.value)) {
              exampleKey.currentState.showToast('初始日期不能早于起始日期');
            } else if (value.value
                .isAfter(setting.lastDate.value)) {
              exampleKey.currentState.showToast('初始日期不能晚于最后日期');
            } else {
              setting = setting.copyWith(initialDate: value);
            }
          });
        }),
        ValueTitleWidget(StringParams.kFirstDate),
        RadioGroupWidget(setting.firstDate, dateTimeValues, (value) {
          setState(() {
            if(value.value.isAfter(setting.lastDate.value)){
              exampleKey.currentState.showToast('起始日期不能晚于最后日期');
            }
            else if(value.value.isAfter(setting.initialDate.value)){
              setting=setting.copyWith(firstDate: value,initialDate: value);
            }else{
              setting = setting.copyWith(firstDate: value);
            }
          });
        }),
        ValueTitleWidget(StringParams.kLastDate),
        RadioGroupWidget(setting.lastDate, dateTimeValues, (value) {
          setState(() {
            if(value.value.isBefore(setting.firstDate.value)){
              exampleKey.currentState.showToast('最后日期不能早于起始日期');
            }
            else if(value.value.isBefore(setting.initialDate.value)){
              setting=setting.copyWith(lastDate: value,initialDate: value);
            }else{
              setting = setting.copyWith(lastDate: value);
            }
          });
        }),
        ValueTitleWidget(StringParams.kInitialDatePickerMode),
        RadioGroupWidget(setting.initialDatePickerMode, datePickerModeValues,
            (value) {
          setState(() {
            setting = setting.copyWith(initialDatePickerMode: value);
          });
        }),
        ValueTitleWidget(StringParams.kTextDirection),
        RadioGroupWidget(setting.textDirection, textDirectionValues, (value) {
          setState(() {
            setting = setting.copyWith(textDirection: value);
          });
        }),
      ]);
    }
    return _widgetSetting;
  }

  @override
  String getTitle() {
    return 'DateTimePickers';
  }

  @override
  Widget getWidget() {
    return Center(
        child: FlatButton(
      onPressed: () async {
        if (isTime.value) {
          TimeOfDay tod = await showTimePicker(
            context: context,
            initialTime: setting.initialTime?.value,
          );
          exampleKey.currentState.showToast(tod.toString());
        } else {
          DateTime time = await showDatePicker(
              context: context,
              initialDate: setting.initialDate?.value,
              firstDate: setting.firstDate?.value,
              lastDate: setting.lastDate?.value,
              selectableDayPredicate: setting.selectableDayPredicate?.value,
              initialDatePickerMode: setting.initialDatePickerMode?.value,
              locale: setting.locale?.value,
              textDirection: setting.textDirection?.value);
          exampleKey.currentState.showToast(time.toString());
        }
      },
      child: Text(isTime.value ? 'Show TimePicker' : 'Show DateTimePicker'),
    ));
  }
}

class DateTimePickersSetting {
  final Value<DateTime> initialDate;
  final Value<DateTime> firstDate;
  final Value<DateTime> lastDate;
  final Value<DatePickerMode> initialDatePickerMode;
  final Value<SelectableDayPredicate> selectableDayPredicate;
  final Value<Locale> locale;
  final Value<TextDirection> textDirection;

  final Value<TimeOfDay> initialTime;

  DateTimePickersSetting({
    this.initialTime,
    this.textDirection,
    this.initialDate,
    this.firstDate,
    this.lastDate,
    this.initialDatePickerMode,
    this.selectableDayPredicate,
    this.locale,
  });

  DateTimePickersSetting copyWith({
    Value<TimeOfDay> initialTime,
    Value<TextDirection> textDirection,
    Value<DateTime> initialDate,
    Value<DateTime> firstDate,
    Value<DateTime> lastDate,
    Value<DatePickerMode> initialDatePickerMode,
    Value<SelectableDayPredicate> selectableDayPredicate,
    Value<Locale> locale,
  }) {
    return DateTimePickersSetting(
      initialTime: initialTime ?? this.initialTime,
      textDirection: textDirection ?? this.textDirection,
      initialDate: initialDate ?? this.initialDate,
      firstDate: firstDate ?? this.firstDate,
      lastDate: lastDate ?? this.lastDate,
      initialDatePickerMode:
          initialDatePickerMode ?? this.initialDatePickerMode,
      selectableDayPredicate:
          selectableDayPredicate ?? this.selectableDayPredicate,
      locale: locale ?? this.locale,
    );
  }
}
