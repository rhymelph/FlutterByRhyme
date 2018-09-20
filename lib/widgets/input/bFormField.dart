import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';

class FormFieldDemo extends StatefulWidget {
  static const String routeName = 'widgets/input/FormField';
  final String detail = '''单个表单字段。

此小组件维护表单字段的当前状态，以便在UI中直观地反映更新和验证错误。

在Form中使用时，您可以使用FormState上的方法来查询或操作表单数据。例如，调用FormState.save 将依次调用每个FormField的onSaved回调。

如果要检索其当前状态，请使用带有FormField的GlobalKey，例如，如果您希望一个表单字段依赖另一个表单字段。

一个表格不需要祖先。该表只是使得它更容易保存，复位，或一次验证多个领域。若要在没有Form的情况下使用，请将GlobalKey传递给构造函数，并使用GlobalKey.currentState来保存或重置表单字段。''';

  @override
  _FormFieldDemoState createState() => _FormFieldDemoState();
}

class _FormFieldDemoState extends ExampleState<FormFieldDemo> {
  FormFieldSetting setting;

  @override
  void initState() {
    setting = FormFieldSetting();
    super.initState();
  }

  @override
  String getDetail() {
    return widget.detail;
  }

  @override
  String getExampleCode() {
    return '''FormField(
      builder: ${setting.builder?.label??''},
      initiallabel??''}: ${setting.initialValue??''},
      autovalidate: ${setting.autovalidate?.label??''},
      validator: ${setting.validator?.label??''},
      onSaved: ${setting.onSaved?.label??''},
    )''';
  }

  @override
  List<Widget> getSetting() {
    return [];
  }

  @override
  String getTitle() {
    return 'FormField';
  }

  @override
  Widget getWidget() {
    return FormField(
      builder: setting.builder?.value,
      initialValue: setting.initialValue?.value,
      autovalidate: setting.autovalidate?.value,
      validator: setting.validator?.value,
      onSaved: setting.onSaved?.value,
    );
  }
}

class FormFieldSetting<T> {
  final Value<bool> autovalidate;
  final Value<T> initialValue;
  final Value<FormFieldValidator<T>> validator;
  final Value<FormFieldSetter<T>> onSaved;
  final Value<FormFieldBuilder<T>> builder;

  FormFieldSetting({
    this.builder,
    this.onSaved,
    this.validator,
    this.initialValue,
    this.autovalidate,
  });

  FormFieldSetting copyWith({
    Value<bool> autovalidate,
    Value<T> initialValue,
    Value<FormFieldValidator<T>> validator,
    Value<FormFieldSetter<T>> onSaved,
    Value<FormFieldBuilder<T>> builder,
  }) {
    return FormFieldSetting(
      autovalidate: autovalidate ?? this.autovalidate,
      initialValue: initialValue ?? this.initialValue,
      validator: validator ?? this.validator,
      onSaved: onSaved ?? this.onSaved,
      builder: builder ?? this.builder,
    );
  }
}
