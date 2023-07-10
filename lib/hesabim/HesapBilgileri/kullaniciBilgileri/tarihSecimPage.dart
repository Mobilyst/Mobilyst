import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobilyst/ColorAndType/color.dart';

class TarihSelectPage extends StatefulWidget {
  final Function(DateTime)? onDateSelected;
  const TarihSelectPage({Key? key, this.onDateSelected}) : super(key: key);

  @override
  State<TarihSelectPage> createState() => _TarihSelectPageState();
}

class _TarihSelectPageState extends State<TarihSelectPage> {
  final _createDateController = TextEditingController();
  late DateTime _selectedDateTime;

  @override
  void initState() {
    super.initState();
    _selectedDateTime = DateTime.now();
  }

  Future<void> _selectedCreateDate(BuildContext context) async {
    var pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDateTime,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null) {
      setState(() {
        _selectedDateTime = pickedDate;
        _createDateController.text =
            DateFormat('dd-MM-yyyy').format(pickedDate);
      });
      // Seçilen tarihi üst widgeta iletmek icin
      if (widget.onDateSelected != null) {
        widget.onDateSelected!(pickedDate);
      }
    }
  }

/*
  @override
  void dispose() {
    _createDateController.dispose();
    super.dispose();
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
*/

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          children: <Widget>[
            TextField(
              readOnly: true, //okunabilirgi actik
              onTap: () {
                _selectedCreateDate(context);
              },
              decoration: InputDecoration(
                hintText: 'Tarih seçiniz',
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColors.alti),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade500),
                ),
                fillColor: Colors.grey.shade200,
                filled: true,
                hintStyle: TextStyle(color: Colors.grey[500]),
                prefixIcon:
                    const Icon(Icons.calendar_today, color: AppColors.dort),
              ),
              controller: TextEditingController(
                text: DateFormat('dd-MM-yyyy').format(_selectedDateTime),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
