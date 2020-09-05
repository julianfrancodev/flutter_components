import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  String _name = '';
  String _email = '';
  String _password = '';
  String _date = '';
  TextEditingController _inputFieldDateController = new TextEditingController();
  List<String> _names = ['julian','danie','santiago','sneider'];
  String _selectedValue = 'julian';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inputs'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        children: [
          _renderInput(),
          Divider(),
          _renderPerson(),
          Divider(),
          _renderInputEmail(),
          Divider(),
          _renderPasswordEmail(),
          Divider(),
          _renderDate(context),
          Divider(),
          _renderDropdown(context),
        ],
      ),
    );
  }

  Widget _renderInput() {
    return TextField(
      onChanged: (value) {
        setState(() {
          _name = value;
          print(_name);
        });
      },
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20)
          ),

          counter: Text('cantidad'),
          hintText: 'Nombre',
          labelText: 'Nombre',
          helperText: 'Nombre',
          suffixIcon: Icon(Icons.accessibility),
          icon: Icon(Icons.account_circle)
      ),
    );
  }

  Widget _renderInputEmail() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      onChanged: (value) {
        setState(() {
          _email = value;
          print(_email);
        });
      },
      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20)
          ),

          counter: Text('cantidad'),
          hintText: 'Email',
          labelText: 'Email',
          suffixIcon: Icon(Icons.email),
          icon: Icon(Icons.email)
      ),
    );
  }

  Widget _renderPasswordEmail() {
    return TextField(
      obscureText: true,
      keyboardType: TextInputType.visiblePassword,
      onChanged: (value) {
        setState(() {
          _password = value;
          print(_password);
        });
      },
      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20)
          ),

          counter: Text('cantidad'),
          hintText: 'Password',
          labelText: 'Password',
          suffixIcon: Icon(Icons.lock),
          icon: Icon(Icons.lock_open)
      ),
    );
  }

  Widget _renderDate(context) {
    return TextField(
      enableInteractiveSelection: false,
      controller: _inputFieldDateController,

      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate(context);
      },
      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20)
          ),

          hintText: 'BirthDate',
          labelText: 'BirthDate',
          suffixIcon: Icon(Icons.calendar_today),
          icon: Icon(Icons.calendar_today)
      ),
    );
  }

  _selectDate(context) async {
    DateTime picked = await showDatePicker(context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(2018),
        locale: Locale('es','CO'),
        lastDate: new DateTime(2025));

    if(picked != null){
      setState(() {
        _date = picked.toString();
        _inputFieldDateController.text = _date;
      });
    }
  }

  Widget _renderDropdown(context){
    return DropdownButton(
      value: _selectedValue,
      onChanged: (item){
        setState(() {
          _selectedValue = item;
        });
      },
      items:getDropdownOptions()
    );
  }

  List<DropdownMenuItem<String>> getDropdownOptions(){
      List<DropdownMenuItem<String>> list = new List();

      _names.forEach((element) { 
        list.add(DropdownMenuItem(
          child: Text(element),
          value: element,
        ));
      });

      return list;
  }

  Widget _renderPerson() {
    return ListTile(
      title: Text(_name),
      subtitle: Text(_email),
    );
  }
}
