import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';

class StepperDemo extends StatefulWidget {
  static const String routeName = 'widgets/material/Stepper';
  final String detail = '''一个物料步进器小部件，通过一系列步骤显示进度。对于一个步骤需要完成另一个步骤，或者需要完成多个步骤才能提交整个表单的表单，步进器特别有用。

小部件是一个灵活的包装器。父类应该 根据它提供的三个回调触发的某些逻辑将currentStep传递给此窗口小部件。''';

  @override
  _StepperDemoState createState() => _StepperDemoState();
}

class _StepperDemoState extends ExampleState<StepperDemo> {
  StepperSetting setting;

  @override
  void initState() {
    setting = StepperSetting(
      steps: Value(
        value: <Step>[
          Step(
            title: Text('StepTitle1'),
            content: Text('StepContent1'),
          ),
          Step(
            title: Text('StepTitle2'),
            content: Text('StepContent2'),
            state: StepState.indexed,
          ),
          Step(
            title: Text('StepTitle3'),
            content: Text('StepContent3'),
            state: StepState.editing,
          ),
          Step(
            title: Text('StepTitle4'),
            content: Text('StepContent4'),
            state: StepState.complete,
            isActive: true,
          ),
          Step(
            title: Text('StepTitle5'),
            content: Text('StepContent5'),
            isActive: true,
          ),
        ],
        label: '''<Step>[
          Step(
            title: Text('StepTitle1'),
            content: Text('StepContent1'),
          ),
          Step(
            title: Text('StepTitle2'),
            content: Text('StepContent2'),
            state: StepState.indexed,
          ),
          Step(
            title: Text('StepTitle3'),
            content: Text('StepContent3'),
            state: StepState.editing,
          ),
          Step(
            title: Text('StepTitle4'),
            content: Text('StepContent4'),
            state: StepState.complete,
            isActive: true,
          ),
          Step(
            title: Text('StepTitle5'),
            content: Text('StepContent5'),
            isActive: true,
          ),
        ]''',
      ),
      type: stepperTypeValue[0],
      currentStep: intMini2Values[0],
      onStepTapped: Value(
        value: (value) {
          //todo currentStep == value
          setState(() {
            setting = setting.copyWith(
              currentStep: Value(
                name: '$value',
                value: value,
                label: '$value',
              ),
            );
          });
        },
        label: '''(value){
          //todo currentStep == value
          setState(() {
            currentStep=value;
          });
        }''',
      ),
      onStepContinue: Value(
        value: () {
          //todo click the continue button
          exampleKey.currentState.showToast('click the continue');
        },
        label: '''(){
        //todo click the continue button
      }''',
      ),
      onStepCancel: Value(
        value: () {
          //todo click the cancel button
          exampleKey.currentState.showToast('click the cancel');
        },
        label: '''(){
        //todo click the cancel button
      }''',
      ),
    );
    super.initState();
  }

  @override
  String getDetail() {
    return widget.detail;
  }

  @override
  String getExampleCode() {
    return '''int currentStep=0;
Stepper(
      steps: ${setting.steps?.label ?? ''},
      type: ${setting.type?.label ?? ''},
      currentStep: currentStep,
      onStepTapped: ${setting.onStepTapped?.label ?? ''},
      onStepContinue: ${setting.onStepContinue?.label ?? ''},
      onStepCancel: ${setting.onStepCancel?.label ?? ''},
    )''';
  }

  @override
  List<Widget> getSetting() {
    return [
      ValueTitleWidget(StringParams.kType),
      RadioGroupWidget(setting.type, stepperTypeValue, (value) {
        setState(() {
          setting = setting.copyWith(type: value);
        });
      }),
      DropDownValueTitleWidget(
        selectList: intMini2Values,
        title: 'currentStep',
        value: setting.currentStep,
        onChanged: (value) {
          setState(() {
            setting = setting.copyWith(currentStep: value);
          });
        },
      )
    ];
  }

  @override
  String getTitle() {
    return 'Stepper';
  }

  @override
  Widget getWidget() {
    return Stepper(
      steps: setting.steps?.value,
      type: setting.type?.value,
      currentStep: setting.currentStep?.value,
      onStepTapped: setting.onStepTapped?.value,
      onStepContinue: setting.onStepContinue?.value,
      onStepCancel: setting.onStepCancel?.value,
    );
  }
}

class StepperSetting {
  final Value<List<Step>> steps;
  final Value<StepperType> type;
  final Value<int> currentStep;
  final Value<ValueChanged<int>> onStepTapped;
  final Value<VoidCallback> onStepContinue;
  final Value<VoidCallback> onStepCancel;

  StepperSetting({
    this.steps,
    this.type,
    this.currentStep,
    this.onStepTapped,
    this.onStepContinue,
    this.onStepCancel,
  });

  StepperSetting copyWith({
    Value<List<Step>> steps,
    Value<StepperType> type,
    Value<int> currentStep,
    Value<ValueChanged<int>> onStepTapped,
    Value<VoidCallback> onStepContinue,
    Value<VoidCallback> onStepCancel,
  }) {
    return StepperSetting(
      steps: steps ?? this.steps,
      type: type ?? this.type,
      currentStep: currentStep ?? this.currentStep,
      onStepTapped: onStepTapped ?? this.onStepTapped,
      onStepContinue: onStepContinue ?? this.onStepContinue,
      onStepCancel: onStepCancel ?? this.onStepCancel,
    );
  }
}
