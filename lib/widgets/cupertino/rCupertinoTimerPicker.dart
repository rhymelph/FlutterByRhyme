import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';

class CupertinoTimerPickerDemo extends StatefulWidget {
  static const String routeName = 'widgets/cupertino/CupertinoTimerPickerDemo';
  final String detail = '''iOS风格的倒数计时器选择器。

此选择器显示小时，分钟和秒旋转器的倒计时持续时间。持续时间在0到23小时59分59秒之间。

CupertinoTimerPickerMode中列出了几种计时器选择器模式。''';

  @override
  _CupertinoTimerPickerDemoState createState() =>
      _CupertinoTimerPickerDemoState();
}

class _CupertinoTimerPickerDemoState
    extends ExampleState<CupertinoTimerPickerDemo> {
  CupertinoTimerPickerSetting setting;

  @override
  void initState() {
    setting = CupertinoTimerPickerSetting(
        mode: timerPickerModeValues[0],
        initialTimerDuration: durationValues[0],
        minuteInterval: intMiniValues[0],
        secondInterval: intMiniValues[0],
        onTimerDurationChanged: Value(
          value: (value) {},
          label: '',
        ));
    super.initState();
  }

  @override
  String getDetail() {
    return widget.detail;
  }

  @override
  String getExampleCode() {
    return '''CupertinoTimerPicker(
      mode: ${setting.mode?.label ?? ''},
      initialTimerDuration: ${setting.initialTimerDuration?.label ?? ''},
      minuteInterval: ${setting.minuteInterval?.label ?? ''},
      secondInterval: ${setting.secondInterval?.label ?? ''},
      onTimerDurationChanged: ${setting.onTimerDurationChanged?.label ?? ''},
    )''';
  }

  @override
  List<Widget> getSetting() {
    return [
      ValueTitleWidget(StringParams.kMode),
      RadioGroupWidget(setting.mode, timerPickerModeValues, (value) {
        setState(() {
          setting = setting.copyWith(mode: value);
        });
      }),
      ValueTitleWidget(StringParams.kInitialTimerDuration),
      RadioGroupWidget(setting.initialTimerDuration, durationValues, (value) {
        if(value.value >=Duration(days: 1)){
          exampleKey.currentState.showToast("初始时间不能大于等于一天");

        }
        setState(() {
          setting = setting.copyWith(initialTimerDuration: value);
        });
      }),
      DropDownValueTitleWidget(
        selectList: intMiniValues,
        title: StringParams.kMinuteInterval,
        value: setting.minuteInterval,
        onChanged: (value) {
          setState(() {
            setting = setting.copyWith(minuteInterval: value);
          });
        },
      ),
      DropDownValueTitleWidget(
        selectList: intMiniValues,
        title: StringParams.kSecondInterval,
        value: setting.secondInterval,
        onChanged: (value) {
          setState(() {
            setting = setting.copyWith(secondInterval: value);
          });
        },
      ),
    ];
  }

  @override
  String getTitle() {
    return 'CupertinoTimerPicker';
  }

  @override
  Widget getWidget() {
    return Center(
      child: CupertinoButton(
          child: Text('Show CupertinoTimePickter'),
          onPressed: () {
            showModalBottomSheet(
                context: context,
                builder: (BuildContext context) => CupertinoTimerPicker(
                      mode: setting.mode?.value,
                      initialTimerDuration: setting.initialTimerDuration?.value,
                      minuteInterval: setting.minuteInterval?.value,
                      secondInterval: setting.secondInterval?.value,
                      onTimerDurationChanged:
                          setting.onTimerDurationChanged?.value,
                    ));
          }),
    );
  }
}

class CupertinoTimerPickerSetting {
  final Value<CupertinoTimerPickerMode> mode;
  final Value<Duration> initialTimerDuration;
  final Value<int> minuteInterval;
  final Value<int> secondInterval;
  final Value<ValueChanged<Duration>> onTimerDurationChanged;

  CupertinoTimerPickerSetting(
      {this.mode,
      this.initialTimerDuration,
      this.minuteInterval,
      this.secondInterval,
      this.onTimerDurationChanged});

  CupertinoTimerPickerSetting copyWith({
    Value<CupertinoTimerPickerMode> mode,
    Value<Duration> initialTimerDuration,
    Value<int> minuteInterval,
    Value<int> secondInterval,
    Value<ValueChanged<Duration>> onTimerDurationChanged,
  }) {
    return CupertinoTimerPickerSetting(
      mode: mode ?? this.mode,
      initialTimerDuration: initialTimerDuration ?? this.initialTimerDuration,
      minuteInterval: minuteInterval ?? this.minuteInterval,
      secondInterval: secondInterval ?? this.secondInterval,
      onTimerDurationChanged:
          onTimerDurationChanged ?? this.onTimerDurationChanged,
    );
  }
}
