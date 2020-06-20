import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trello_clone/models/user.dart';
import 'package:trello_clone/services/database.dart';
import 'package:trello_clone/shared/loading.dart';

class AddList extends StatefulWidget {

  final String boardName;
  AddList({this.boardName});
  @override
  _AddListState createState() => _AddListState();
}

class _AddListState extends State<AddList> {

  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  String _listName;

  @override
  Widget build(BuildContext context) {
    User user = Provider.of<User>(context);
    return loading ? Loading() : Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        backgroundColor: Colors.blue[600],
        leading: IconButton(
          icon: Icon(Icons.cancel),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Add List',
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
                'List Name',
                style: TextStyle(
                  color: Colors.green[600],
                  fontFamily: 'Lato',
                  fontSize: 13.0,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.left,
              ),
              TextFormField(
                validator: (val) => val.isEmpty ? 'Enter a List Name' : null,
                onChanged: (val) {
                  setState(() => _listName = val);
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
                    print(widget.boardName);
                    if (_formKey.currentState.validate()) {
                      loading = true;
                      await DatabaseService(uid: user.uid).addList(widget.boardName, _listName);
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