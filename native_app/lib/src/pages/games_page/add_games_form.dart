import 'package:clearbook/src/model/model.dart';
import 'package:clearbook/src/widgets/widgets.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class AddGamesForm extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('発売ソフト追加'),
        ),
        body: Container(
          padding: EdgeInsets.all(32.0),
          child: Form(
            key: _formKey,
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Title',
                  ),
                ),
                Padding(padding: EdgeInsets.all(8)),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Price',
                  ),
                  keyboardType: TextInputType.number,
                ),
                Padding(padding: EdgeInsets.all(8)),
                FormField(
                  builder: (FormFieldState state) {
                    return InputDecorator(
                      decoration: InputDecoration(
                        labelText: 'プラットフォーム',
                      ),
                      child: DropdownButtonFormField<String>(
                        value: Provider.of<AddGameFormState>(context)
                            .selectedPlatform,
                        selectedItemBuilder: (context) {
                          return Game.platforms
                              .map((e) => DropdownMenuItem<String>(
                                    child: Text(
                                      e,
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    value: e,
                                  ))
                              .toList();
                        },
                        items: Game.platforms
                            .map((e) => DropdownMenuItem<String>(
                                  child: Text(
                                    e,
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  value: e,
                                ))
                            .toList(),
                        onChanged: (String value) =>
                            Provider.of<AddGameFormState>(context,
                                    listen: false)
                                .updateSelectedPlatform(value),
                      ),
                    );
                  },
                ),
                Padding(padding: EdgeInsets.all(8)),
                FormField(
                    builder: (FormFieldState state) {
                      return InputDecorator(
                        decoration: InputDecoration(
                          labelText: '発売日',
                        ),
                        child: DateTimeField(
                          initialValue: DateTime.now(),
                          format: DateFormat("yyyy-MM-dd"),
                          onShowPicker: (context, currentValue) {
                            return showDatePicker(
                              context: context,
                              initialDate: currentValue,
                              firstDate: DateTime(1900),
                              lastDate: DateTime(2100),
                            );
                          },
                        ),
                      );
                    },
                ),
                Padding(padding: EdgeInsets.all(8)),
                new Container(
                  child: new RaisedButton(
                    child: const Text('Submit'),
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        print('ok');
                      }
                      print('ng');
                    },
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
