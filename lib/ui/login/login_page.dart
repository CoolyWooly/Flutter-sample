import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_unipark_client/bloc/movies_detail_bloc.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  bool _isLoading = false;
  String _phone = "";
  String _password = "";
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Stack(
        children: <Widget>[
          _showForm(),
          _showCircularProgress(),
        ],
      ),
    );
  }

  Widget _showForm() {
    return new SingleChildScrollView(
      padding: EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            showLogo(),
            showEmailInput(),
            showPasswordInput(),
            showPrimaryButton(),
            showSecondaryButton(),
          ],
        ),
      ),
    );
  }

  Widget _showCircularProgress() {
    if (_isLoading) {
      return Center(child: CircularProgressIndicator());
    }
    return Container(
      height: 0.0,
      width: 0.0,
    );
  }

  Widget showLogo() {
    return new Hero(
      tag: 'hero',
      child: Padding(
        padding: EdgeInsets.fromLTRB(0.0, 70.0, 0.0, 0.0),
        child: SvgPicture.asset('res/images/logo.svg'),
      ),
    );
  }

  Widget showEmailInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 100.0, 0.0, 0.0),
      child: new TextFormField(
        maxLines: 1,
        keyboardType: TextInputType.phone,
        autofocus: false,
        decoration: new InputDecoration(
          hintText: 'Телефон',
          icon: new Icon(
            Icons.phone,
            color: Colors.grey,
          ),
          border: OutlineInputBorder(),
        ),
        validator: (value) => value.isEmpty ? 'Введите номер телефона' : null,
        onSaved: (value) => _phone = value.trim(),
      ),
    );
  }

  Widget showPasswordInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
      child: new TextFormField(
        maxLines: 1,
        obscureText: true,
        autofocus: false,
        decoration: new InputDecoration(
          border: OutlineInputBorder(),
          hintText: 'Пароль',
          icon: new Icon(
            Icons.lock,
            color: Colors.grey,
          ),
        ),
        validator: (value) => value.isEmpty ? 'Введите пароль' : null,
        onSaved: (value) => _password = value.trim(),
      ),
    );
  }

  Widget showPrimaryButton() {
    return new Padding(
      padding: EdgeInsets.fromLTRB(0.0, 45.0, 0.0, 0.0),
      child: SizedBox(
        height: 50.0,
        width: double.infinity,
        child: new RaisedButton(
          shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(5.0),
          ),
          child: new Text(
            'Войти',
            style: Theme.of(context).textTheme.button,
          ),
          onPressed: validateAndSubmit,
        ),
      ),
    );
  }

  Widget showSecondaryButton() {
    return new FlatButton(
      child: new Text(
        'Зарегистрироваться',
        style: new TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.w300,
        ),
      ),
//        onPressed: toggleFormMode
    );
  }

  void validateAndSubmit() async {
    setState(() {
      _isLoading = true;
      if (_formKey.currentState.validate()) {
        movieDetailBloc.fetchMovieDetail();
        Navigator.pushReplacementNamed(context, '/main');
      }
    });
  }
}
