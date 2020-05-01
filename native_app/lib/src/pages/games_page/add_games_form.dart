import 'package:clearbook/src/model/model.dart';
import 'package:clearbook/src/widgets/widgets.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class AddGamesForm extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<AddGameFormState>(context);
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
                  initialValue: Provider.of<AddGameFormState>(context).title,
                  decoration: const InputDecoration(
                    labelText: 'Title',
                  ),
                  autovalidate: false,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'タイトルを入力してください。';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    Provider.of<AddGameFormState>(
                      context,
                      listen: false,
                    ).updateTitle(value);
                  },
                ),
                Padding(padding: EdgeInsets.all(8)),
                TextFormField(
                  initialValue:
                      Provider.of<AddGameFormState>(context).price.toString(),
                  decoration: const InputDecoration(
                    labelText: 'Price',
                  ),
                  keyboardType: TextInputType.number,
                  autovalidate: false,
                  validator: (value) {
                    if (value.isEmpty) {
                      return '価格を入力してください';
                    }
                    if (int.tryParse(value) < 0) {
                      return '0 以上で入力してください';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    Provider.of<AddGameFormState>(
                      context,
                      listen: false,
                    ).updatePrice(int.tryParse(value));
                  },
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
                        onChanged: (value) {
                          Provider.of<AddGameFormState>(
                            context,
                            listen: false,
                          ).updateSelectedPlatform(value);
                        },
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
                        initialValue:
                            Provider.of<AddGameFormState>(context).releaseDate,
                        format: DateFormat("yyyy-MM-dd"),
                        onShowPicker: (context, currentValue) {
                          return showDatePicker(
                            context: context,
                            initialDate: currentValue,
                            firstDate: DateTime(1900),
                            lastDate: DateTime(2100),
                          );
                        },
                        onChanged: (value) {
                          Provider.of<AddGameFormState>(
                            context,
                            listen: false,
                          ).updateReleaseDate(value);
                        },
                      ),
                    );
                  },
                ),
                Padding(padding: EdgeInsets.all(8)),
                new Container(
                  child: new RaisedButton(
                    child: const Text('追加'),
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        final game = Provider.of<AddGameFormState>(
                          context,
                          listen: false,
                        ).toGame();
                        Provider.of<GameListState>(
                          context,
                          listen: false,
                        ).addGame(game);
                        Provider.of<AddGameFormState>(
                          context,
                          listen: false,
                        ).initialize();
                        Navigator.pop(context);
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
