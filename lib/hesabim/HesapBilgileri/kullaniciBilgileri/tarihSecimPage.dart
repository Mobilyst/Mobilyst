import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TarihSelectPage extends StatefulWidget {
  const TarihSelectPage({super.key});

  @override
  State<TarihSelectPage> createState() => _TarihSelectPageState();
}

class _TarihSelectPageState extends State<TarihSelectPage> {
  final _createDateController = TextEditingController();

  DateTime _dateTime = DateTime.now();

  _selectedCreateDate(BuildContext context) async {
    var _pickedDate = await showDatePicker(
        context: context,
        initialDate: _dateTime,
        firstDate: DateTime(2000),
        lastDate: DateTime(2100));
    if (_pickedDate != null) {
      setState(() {
        _dateTime = _pickedDate;
        _createDateController.text =
            DateFormat('dd-MM-yyyy').format(_pickedDate);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            children: <Widget>[
              TextField(
                controller: _createDateController,
                decoration: InputDecoration(
                    // labelText: ' Doğum Tarihi',
                    hintText: 'Tarih seçiniz',
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade900),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade900),
                    ),
                    fillColor: Colors.grey.shade200,
                    filled: true,
                    hintStyle: TextStyle(color: Colors.grey[500]),
                    prefixIcon: InkWell(
                      onTap: () {
                        _selectedCreateDate(context);
                      },
                      child: const Icon(Icons.calendar_today),
                    )),
              ),
            ],
          )),
    );
  }
}
