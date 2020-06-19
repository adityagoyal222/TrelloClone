import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trello_clone/models/user.dart';
import 'package:trello_clone/services/database.dart';
import 'package:trello_clone/shared/loading.dart';

class AddBoard extends StatefulWidget {
  @override
  _AddBoardState createState() => _AddBoardState();
}

class _AddBoardState extends State<AddBoard> {
  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  String _boardName;

  @override
  Widget build(BuildContext context) {
    User user = Provider.of<User>(context);
    return loading ? Loading() : Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[600],
        leading: IconButton(
          icon: Icon(Icons.cancel),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Create Board',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Lato',
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 20.0,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(height: 20.0),
              Text(
                'Board Name',
                style: TextStyle(
                  color: Colors.green[600],
                  fontFamily: 'Lato',
                  fontSize: 13.0,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.left,
              ),
              TextFormField(
                validator: (val) => val.isEmpty ? 'Enter a Board Name' : null,
                onChanged: (val) {
                  setState(() => _boardName = val);
                },
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Lato',
                  fontSize: 15.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: FlatButton(
                  child: Text(
                    'CREATE',
                    style: TextStyle(
                        color: Colors.blue[600],
                        fontFamily: 'Lato',
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      loading = true;
                      await DatabaseService(uid: user.uid).addBoard(_boardName);
                      Navigator.pop(context);
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
