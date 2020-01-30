import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'contacts.dart'

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Register',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Registration form'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  }
  Contact newContact = new Contact();
  List<String> _levels = <String>['', '1st year', '2nd year', '3rd year', '4th year'];
  String _level = '';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: _scaffoldKey,
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new SafeArea(
          top: false,
          bottom: false,
          child: new Form(
              key: _formKey,
              autovalidate: true,
              child: new ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                children: <Widget>[
                  new TextFormField(
                    decoration: const InputDecoration(
                      icon: const Icon(Icons.person),
                      hintText: 'Enter your full name',
                      labelText: 'Full Name',
                    ),
                    validator: (val) => val.isEmpty ? 'Name is required' : null,
                      onSaved: (val) => newContact.name = val,
                  ),
              
                  new TextFormField(
                    decoration: const InputDecoration(
                      icon: const Icon(Icons.keyboard),
                      hintText: 'Enter your Password',
                      labelText: 'Password',
                      ),
                      inputFormatters: [new LengthLimitingTextInputFormatter(8)],
                      validator: (val) => val.isEmpty ? 'Password is required' : null,
                      onSaved: (val) => newContact.password = val,
        ),

                  
                
                  new TextFormField(
                    decoration: const InputDecoration(
                      icon: const Icon(Icons.phone),
                      hintText: 'Enter a phone number',
                      labelText: 'Phone',
                    ),
                    keyboardType: TextInputType.phone,
                    inputFormatters: [
                      WhitelistingTextInputFormatter.digitsOnly,
                    ],
                  ),
                     TextFormField(
                    decoration: const InputDecoration(
                      icon: const Icon(Icons.email),
                      hintText: 'Enter a email address',
                      labelText: 'Email',
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) => isValidEmail(value)
                    ? null
                    : 'Please enter a valid email address',
                    onSaved: (val) => newContact.email = val,
                    bool isValidEmail(String input) {
                    final RegExp regex = new RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");
                    return regex.hasMatch(input);
  }
                  ),
                  new FormField(
                    builder: (FormFieldState state) {
                      return InputDecorator(
                        decoration: InputDecoration(
                          icon: const Icon(Icons.book),
                          labelText: 'Level of Study',
                          errorText: state.hasError ? state.errorText : null,
                        ),
                        isEmpty: _level == '',
                        child: new DropdownButtonHideUnderline(
                          child: new DropdownButton(
                            value: _level,
                            isDense: true,
                            onChanged: (String newValue) {
                              setState(() {
                                var newContact;
                                newContact.levelofstudy = newValue;
                                _level = newValue;
                                state.didChange(newValue);
                              });
                            },
                            items: _levels.map((String value) {
                              return new DropdownMenuItem(
                                value: value,
                                child: new Text(value),
                              );
                            }).toList(),
                          ),
                        ),

                      );
                    },
                    validator: (val) {
                    return val != '' ? null : 'Please select a level';
                  ),
                  new Container(
                      padding: const EdgeInsets.only(left: 40.0, top: 20.0),
                      child: new RaisedButton(
                        child: const Text('Submit'),
                        onPressed: _submitform();
                        
                      )),
                ],
              ))),
              
              
    )
              
              void _submitForm() {
              final FormState form = _formKey.currentState;
              if (!form.validate()) {
                showMessage('Form is not valid!  Please review and correct.');
              } else {
                form.save(); 
                print('Form save called, newContact is now up to date...');
                print('Email: ${newContact.name}');
                print('Email: ${newContact.password}');
                print('Phone: ${newContact.phone}');
                print('Email: ${newContact.email}');
                print('Favorite Color: ${newContact.levelofstudy}');
                print('========================================');
                }
              void showMessage(String message, [MaterialColor color = Colors.red]) {
              _scaffoldKey.currentState
              .showSnackBar(new SnackBar(backgroundColor: color, content: new Text(message)));
  }
  }
    );
  }
